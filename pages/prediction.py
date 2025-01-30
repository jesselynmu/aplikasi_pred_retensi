import streamlit as st
import os
import pickle
import pandas as pd
import shap
import matplotlib.pyplot as plt
from catboost import Pool
import numpy as np
import mysql.connector
import io
import json

reg_model = pickle.load(open('regression_model.sav', 'rb'))
class_model = pickle.load(open('clasification_model.sav', 'rb'))
train_file_path = 'X_train.csv'

def connect_to_db():
    try:
        conn = mysql.connector.connect(
            host=st.secrets["mysql"]["host"],
            user=st.secrets["mysql"]["user"],
            password=st.secrets["mysql"]["password"],
            database=st.secrets["mysql"]["dbname"],
            port=st.secrets["mysql"]["port"]
        )
        return conn
    except mysql.connector.Error as e:
        st.error(f"Koneksi ke database gagal: {e}")
        return None

# Fungsi untuk mendapatkan data karyawan dari database
def get_employee_data_from_db(employee_id):
    conn = connect_to_db()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            query = "SELECT * FROM data_employee_db WHERE employee_id = %s"
            cursor.execute(query, (employee_id,))
            result = cursor.fetchone()
            return result  # Kembalikan data sebagai dictionary jika ditemukan, None jika tidak
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengakses database: {e}")
            return None
        finally:
            conn.close()

def process_employee_data(df):
    numeric_columns = [
        "job_satisfaction", "performance_rating", "absent_90D", "income", "dependant", 
        "avg_time_work", "total_komp"
    ]

    for col in numeric_columns:
        if col in df.columns:
            df[col] = pd.to_numeric(df[col], errors="coerce")

    end_date = pd.to_datetime("2024-10-31")
    df["date_of_birth"] = pd.to_datetime(df["date_of_birth"], errors='coerce')
    df["age_years"] = (end_date - df["date_of_birth"]).dt.days // 365

    df["join_date"] = pd.to_datetime(df["join_date"])
    df["resign_date"] = pd.to_datetime(df["resign_date"])

    df["resign_date"].fillna(end_date, inplace=True)

    df["total_komp"].fillna(0, inplace=True)
    df["absent_90D"].fillna(0, inplace=True)

    df["active_work"] = (df["resign_date"] - df["join_date"]).dt.days

    df["active_work_months"] = df["active_work"] // 30
    df["income_3_months"] = df["income"] * 3
    df["income_6_months"] = df["income"] * 6
    df["total_income_work"] = df["income"] * df["active_work_months"]

    df["absence_ratio"] = df["absent_90D"] / (df["active_work"] / 90)
    df["income_dependant_ratio"] = df["income"] / (df["dependant"] + 1)
    df["work_efficiency"] = df["avg_time_work"] / 8

    def categorize_work_duration_months(months):
        if months < 12:
            return "Short-term"
        elif 12 <= months <= 36:
            return "Mid-term"
        else:
            return "Long-term"

    df['active_work_category'] = df['active_work_months'].apply(categorize_work_duration_months)

    # Work Stability Score
    df['work_stability_score'] = df['active_work_months'] / (df['absent_90D'] + 1)

    # Married-Dependent Ratio
    def married_dependent_ratio(row):
        if row['marriage_stat'] == 'Married':
            return row['dependant'] + 1
        else:
            return 1

    df['married_dependent_ratio'] = df.apply(married_dependent_ratio, axis=1)

    # Job Income to Position Score
    position_score_mapping = {'Junior': 2, 'Staff': 1, 'Senior': 3, 'Manager': 4}
    df['position_score'] = df['position'].map(position_score_mapping)
    df['job_income_position_score'] = df['income'] / df['position_score']

    # Education-Adjusted Income
    education_score_mapping = {'SLTA': 1, 'D1': 2, 'D2': 3, 'D3': 4, 'S1': 5, 'S2': 6, 'S3': 7}
    df['education_score'] = df['education'].map(education_score_mapping)
    df['education_income_ratio'] = df['income'] / df['education_score']

    # Weighted Satisfaction-Performance Score
    df['weighted_satisfaction_performance'] = (
        0.6 * df['job_satisfaction'] + 0.4 * df['performance_rating']
    )

    # Resign Risk Indicator
    def resign_risk_indicator(row):
        if row['age_years'] < 30 and row['active_work_months'] < 12:
            return "High"
        elif 1 <= row['active_work_months'] <= 36:
            return "Medium"
        else:
            return "Low"

    df['resign_risk_indicator'] = df.apply(resign_risk_indicator, axis=1)

    # Adjusted Work Time
    df['adjusted_work_time'] = df['avg_time_work'] * (1 - (df['absent_90D'] / ((df['active_work_months'] * 90) + 1)))

    job_satisfaction_mapping = {1.0: 'Low', 2.0: 'Medium', 3.0: 'High', 4.0: 'Very High'}
    df['job_satisfaction'] = df['job_satisfaction'].map(job_satisfaction_mapping)

    performance_rating_mapping = {1.0: 'Low', 2.0: 'Good', 3.0: 'Excellent', 4.0: 'Outstanding'}
    df['performance_rating'] = df['performance_rating'].map(performance_rating_mapping)

    return df

# Fungsi untuk mendapatkan gambar sebagai base64
def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")

# Fungsi untuk menampilkan navbar
def navbar():
    current_page = st.session_state.get("page", "Home")
    logo_path = os.path.join(os.path.dirname(__file__), "../asset/logo.png")

    # Cek status login
    if 'logged_in' in st.session_state and st.session_state['logged_in']:
        login_button_text = "Logout"
        login_button_link = "?page=Login&logout=true"  # Tambahkan parameter logout
    else:
        login_button_text = "Logout"
        login_button_link = "?page=Login"

    st.markdown(
        f"""
        <style>
        .navbar {{
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            font-family: 'Poppins', sans-serif;
            margin-top: 20px; /* Hilangkan jarak atas */
            background-color: #D0EEFF; /* Background navbar */
            border-radius: 15px; /* Membulatkan sudut navbar */
        }}
        .navbar .logo {{
            display: flex;
            align-items: center;
        }}
        .navbar .logo img {{
            height: 40px;
            margin-right: 10px;
        }}
        .navbar .nav-links {{
            display: flex;
            gap: 60px;
        }}
        .navbar .nav-links a {{
            color: black;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }}
        .navbar .nav-links a:hover {{
            color: royalblue;
        }}
        .navbar .nav-links a.active {{
            color: #264CBE; /* Warna saat aktif */
            text-decoration: underline; /* Garis bawah saat aktif */
        }}
        .navbar .login-button {{
            background-color: #264CBE;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
        }}
        .navbar .login-button:hover {{
            background-color: white;
            color: #264CBE;
        }}
        </style>
        <div class="navbar">
            <div class="logo">
                <img src="data:image/png;base64,{get_image_as_base64(logo_path)}" alt="Logo">
            </div>
            <div class="nav-links">
                <a href="?page=Prediksi" class="{ 'active' if st.session_state.page == 'Prediksi' else '' }">Prediksi</a>
                <a href="?page=exploration" class="{ 'active' if st.session_state.page == 'exploration' else '' }">Dashboard</a>
                <a href="?page=report" class="{ 'active' if st.session_state.page == 'report' else '' }">Laporan</a>
            </div>
            <a class="login-button" href="{login_button_link}">{login_button_text}</a>
        </div>
        """,
        unsafe_allow_html=True,
    )

def save_prediction_to_db(employee_id, hasil_prediksi_klasifikasi, probabilitas_pred_klasifikasi, hasil_prediksi_regresi):
    conn = connect_to_db()
    if conn:
        try:
            cursor = conn.cursor()
            query = """
                INSERT INTO history_prediction (employee_id, hasil_prediksi_klasifikasi, probabilitas_pred_klasifikasi, hasil_prediksi_regresi)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(query, (employee_id, hasil_prediksi_klasifikasi, probabilitas_pred_klasifikasi, hasil_prediksi_regresi))
            conn.commit()  # Pastikan perubahan disimpan
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat menyimpan ke database: {e}")
        finally:
            conn.close()

def save_shap_to_db_with_features(employee_id, shap_dict):
    conn = connect_to_db()
    if conn:
        try:
            shap_values_json = json.dumps(shap_dict)

            # Query untuk menyimpan data ke database
            query = """
                INSERT INTO shap_pred_result (employee_id, shap_values)
                VALUES (%s, %s)
            """
            cursor = conn.cursor()
            cursor.execute(query, (employee_id, shap_values_json))
            conn.commit()
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat menyimpan SHAP values: {e}")
        finally:
            conn.close()

def show_prediction():
    navbar()

    st.markdown("""
        <style>
        .stButton > button {
            background-color: #264CBE;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            margin-top: 20px;
            width: 100%;
        }

        .stButton > button:hover {
            background-color: #ffffff;
            color: #264CBE;
        }
        /* Footer */
        .footer {
            width: 100%;
            background-color: #D0EEFF;
            padding: 20px !important;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            border-radius: 10px;
            margin-top: 50px !important;
        }

        .footer p {
            margin: 5px 0;
            font-size: 14px;
            color: #333333;
        }
        </style>
    """, unsafe_allow_html=True)

    st.markdown(
    """
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <h3 style="text-align: center; font-family: 'Poppins', sans-serif;">
            Halaman Prediksi
        </h3>
        <p style="font-family: 'Poppins', sans-serif;">
            Masukkan ID Karyawan untuk memulai prediksi.
        </p>
    """, unsafe_allow_html=True
    )

    employee_id = st.text_input("Masukkan ID Karyawan", placeholder="Contoh: EM12345")

    # Tombol untuk memulai prediksi
    if st.button("Validasi dan Prediksi"):
        if not employee_id:
            st.error("Harap masukkan ID Karyawan terlebih dahulu.")
            return

        # Ambil data karyawan dari database
        employee_data = get_employee_data_from_db(employee_id)
        if employee_data is None:
            st.error("ID Karyawan tidak ditemukan. Harap masukkan ID yang valid.")
            return

        # Proses data karyawan
        df = pd.DataFrame([employee_data])  # Ubah dictionary menjadi DataFrame
        df = process_employee_data(df)  # Proses data

        # Kolom yang diharapkan oleh model
        expected_columns_class = class_model.feature_names_
        expected_columns_reg = reg_model.feature_names_

        # Kolom kategori
        cat_feature = ['departemen', 'position', 'domisili', 'marriage_stat', 'job_satisfaction', 
                       'performance_rating', 'education', 'active_work_category', 'resign_risk_indicator', 'jenis_kelamin']

        # Pastikan data uji memiliki kolom yang sesuai dengan model
        X_test_class = df[expected_columns_class]
        X_test_reg = df[expected_columns_reg]

        # Konversi fitur kategori menjadi string
        for col in cat_feature:
            if col in X_test_class.columns:
                X_test_class[col] = X_test_class[col].astype(str)
            if col in X_test_reg.columns:
                X_test_reg[col] = X_test_reg[col].astype(str)

        # Pool untuk data uji
        test_pool_class = Pool(data=X_test_class, cat_features=cat_feature)
        test_pool_reg = Pool(data=X_test_reg, cat_features=cat_feature)

        # Prediksi
        classification_prob = class_model.predict_proba(test_pool_class)
        regression_result = reg_model.predict(test_pool_reg)

        # Ambil hasil prediksi
        predicted_class = 1 if classification_prob[0][1] > 0.5 else 0
        hasil_prediksi_retensi = 'Tidak Retensi' if predicted_class == 1 else 'Retensi'
        probabilitas_pred_retensi = classification_prob[0][1] * 100  # Dalam persen
        hasil_prediksi_regresi = round(regression_result[0], 2)

        warna_retensi = "green" if hasil_prediksi_retensi == "Retensi" else "red"

        # Tampilkan hasil dalam kotak dengan warna
        st.markdown(
            f"""
            <div style="border: 1px solid #ddd; border-radius: 10px; padding: 20px; margin-bottom: 20px; background-color: #FFFFFF;">
                <h4 style="color: {warna_retensi}; text-align: center; font-family: 'Poppins', sans-serif;">
                    Prediksi Kemungkinan Retensi: {hasil_prediksi_retensi}
                </h4>
                <p style="text-align: center; font-family: 'Poppins', sans-serif;">
                    <b>Probabilitas Kemungkinan Retensi:</b> {classification_prob[0][0]:.2f}
                </p>
                <p style="text-align: center; font-family: 'Poppins', sans-serif;">
                    <b>Prediksi Durasi Kerja (bulan):</b> {hasil_prediksi_regresi} bulan
                </p>
            </div>
            """,
            unsafe_allow_html=True
        )

        # Simpan hasil ke database
        save_prediction_to_db(employee_id, hasil_prediksi_retensi, probabilitas_pred_retensi, hasil_prediksi_regresi)

        df_train = pd.read_csv(train_file_path)
        background_data = df_train.sample(n=min(len(df_train), 50), random_state=42)

        # TreeExplainer untuk model klasifikasi
        explainer_class = shap.TreeExplainer(class_model, feature_perturbation="tree_path_dependent")
        shap_values_class = explainer_class.shap_values(X_test_class)

        # Pastikan SHAP values valid
        if isinstance(shap_values_class, list) and len(shap_values_class) > 1:
            try:
                if predicted_class == 1:
                    shap_values = shap_values_class[1][0]  # Ambil nilai SHAP untuk class 1
                else:
                    shap_values = shap_values_class[0][0]  # Ambil nilai SHAP untuk class 0
            except IndexError:
                st.error("SHAP values list index out of range.")
                return
        elif not isinstance(shap_values_class, list):
            shap_values = shap_values_class[0]  # Single-class output
        else:
            st.error("SHAP values tidak valid.")
            return

        # Konversi SHAP values ke bentuk list
        shap_values_list = shap_values.flatten()  # Rata array SHAP values menjadi 1D
        feature_names = list(X_test_class.columns)  # Ambil semua nama fitur

        # Validasi panjang SHAP values dan nama fitur
        if len(feature_names) != len(shap_values_list):
            st.error(
                f"Jumlah fitur ({len(feature_names)}) tidak sesuai dengan jumlah SHAP values ({len(shap_values_list)})."
            )
            return  # Stop eksekusi jika tidak sesuai

        shap_dict = {feature: shap_values_list[i] for i, feature in enumerate(feature_names)}

        save_shap_to_db_with_features(employee_id, shap_dict)

        plot_placeholder = st.empty()

        # Modify the generate_shap_plot function
        def generate_shap_plot(X_test_class, explainer_class, shap_dict, predicted_class):
            plt.close('all')
            
            try:
                # Generate new SHAP explanation
                shap_explanation = explainer_class(X_test_class.iloc[0:1])
                
                # Create figure
                plt.figure(figsize=(4, 2), dpi=100)
                
                # Handle different SHAP value structures
                if isinstance(shap_explanation, list):
                    # For multi-class output
                    if predicted_class == 1 and len(shap_explanation) > 1:
                        shap.plots.waterfall(shap_explanation[1][0])
                    else:
                        shap.plots.waterfall(shap_explanation[0][0])
                else:
                    # For single-class output
                    shap.plots.waterfall(shap_explanation[0])
                
                # Save and display plot
                buf = io.BytesIO()
                plt.savefig(buf, format='png', bbox_inches="tight", dpi=100)
                buf.seek(0)
                # cols = st.columns(2)  # Bagi halaman menjadi 4 kolom
                # with cols[0]:  # Grafik SHAP ditempatkan di kolom pertama
                #     st.image(buf, caption="SHAP Waterfall Plot", use_container_width=True)

                # plt.close()

                col1, col2 = st.columns([1.5, 2])  # **Kolom pertama untuk grafik, kolom kedua untuk penjelasan**
                
                with col1:
                    # st.image(buf, caption="SHAP Waterfall Plot", use_container_width=True)    
                    st.markdown(
                    f"""
                    <style>
                        .shap-container {{
                            display: flex;
                            justify-content: center;
                        }}
                        .shap-image {{
                            border-radius: 10px; /* Biar sudutnya membulat */
                            box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2); /* Shadow */
                            border: 2px solid #ddd; /* Stroke */
                            padding: 5px; /* Ruang di dalam border */
                            background: white; /* Biar keliatan efeknya */
                            max-width: 100%; /* Biar responsif */
                        }}
                        .shap-caption {{
                            text-align: center;
                            font-size: 14px;
                            font-family: 'Poppins', sans-serif;
                            color: #555;
                            margin-top: 5px;
                        }}
                    </style>
                    <div class="shap-container">
                        <img class="shap-image" src="data:image/png;base64,{buf.getvalue().decode('utf-8')}" alt="SHAP Waterfall Plot">
                    </div>
                    <p class="shap-caption">SHAP Waterfall Plot</p>
                    """,
                    unsafe_allow_html=True
                )


                with col2:
                    top_factors = sorted(shap_dict.items(), key=lambda x: abs(x[1]), reverse=True)[:5]

                    # Bangun kesimpulan dinamis
                    summary = " dan ".join(
                        [f"<b>{factor}</b> dengan kontribusi <b>{'+' if value > 0 else ''}{value:.2f}</b>" for factor, value in top_factors]
                    )

                    # Kesimpulan Dinamis
                    st.markdown(
                        f"""
                        <div style="text-align: justify; font-family: 'Poppins', sans-serif;">
                            <h4 style="color:#264CBE; font-size:18px; font-weight:600; font-family: 'Poppins', sans-serif;">Faktor Utama yang Mempengaruhi Prediksi:</h4>
                            <p>
                                Grafik ini menunjukkan bagaimana hasil prediksi dihitung berdasarkan beberapa faktor utama. 
                                Faktor-faktor yang paling memengaruhi hasil prediksi adalah {summary}. 
                                Faktor-faktor ini memberikan kontribusi signifikan terhadap hasil akhir prediksi, 
                                baik dalam meningkatkan maupun menurunkan probabilitas retensi karyawan.
                            </p>
                        </div>
                        """,
                        unsafe_allow_html=True
                    )

                plt.close()

            except Exception as e:
                st.error(f"Error generating SHAP plot: {str(e)}")
                plt.close()

        generate_shap_plot(X_test_class, explainer_class, shap_dict, predicted_class)

        # top_factors = sorted(shap_dict.items(), key=lambda x: abs(x[1]), reverse=True)[:5]

        # # Bangun kesimpulan dinamis
        # summary = " dan ".join(
        #     [f"<b>{factor}</b> dengan kontribusi <b>{'+' if value > 0 else ''}{value:.2f}</b>" for factor, value in top_factors]
        # )

        # # Kesimpulan Dinamis
        # st.markdown(
        #     f"""
        #     <div style="text-align: justify; font-family: 'Poppins', sans-serif;">
        #         Grafik ini menunjukkan bagaimana hasil prediksi dihitung berdasarkan beberapa faktor utama. 
        #         Faktor-faktor yang paling memengaruhi hasil prediksi adalah {summary}. 
        #         Faktor-faktor ini memberikan kontribusi signifikan terhadap hasil akhir prediksi, 
        #         baik dalam meningkatkan maupun menurunkan probabilitas retensi karyawan.
        #     </div>
        #     """,
        #     unsafe_allow_html=True
        # )

        # Footer
    st.markdown(
        """
        <div class="footer">
            <p><strong>2025 © Jesselyn Mu</strong></p>
            <p>Untuk informasi lebih lanjut, dapat mengirim email ke mujesselyn@gmail.com</p>
        </div>
        """,
        unsafe_allow_html=True
    )

# Jalankan fungsi show_prediction
if __name__ == "__main__":
    show_prediction()