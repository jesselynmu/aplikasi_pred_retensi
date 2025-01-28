import streamlit as st
import os
import mysql.connector
import pandas as pd
import json

# Fungsi untuk mendapatkan gambar sebagai base64
def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")

# Fungsi untuk koneksi ke database
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

# Fungsi untuk mengambil data dari tabel history_prediction
def get_all_predictions():
    conn = connect_to_db()
    if conn:
        try:
            query = """SELECT employee_id as ID_Karyawan, hasil_prediksi_klasifikasi as Hasil_Prediksi_Retensi,
                    hasil_prediksi_regresi as Hasil_Prediksi_Lama_Kerja, waktu_prediksi as Waktu_Prediksi
                    FROM history_prediction"""
            df = pd.read_sql(query, conn)  # Menggunakan Pandas untuk membaca data
            return df
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengambil data dari database: {e}")
            return pd.DataFrame()  # Kembalikan DataFrame kosong jika terjadi error
        finally:
            conn.close()

# Fungsi untuk mengambil data dari tabel shap_pred_result
def get_shap_top_features():
    conn = connect_to_db()
    if conn:
        try:
            query = "SELECT employee_id as ID_Karyawan, shap_values FROM shap_pred_result"
            df = pd.read_sql(query, conn)

            # Ekstraksi dan format ulang shap_values
            result = []
            for _, row in df.iterrows():
                employee_id = row['ID_Karyawan']
                shap_values = json.loads(row['shap_values'])

                # Pastikan nilai SHAP berupa angka tunggal, jika list maka ambil rata-rata
                normalized_shap_values = {
                    feature: (sum(value) / len(value) if isinstance(value, list) else value)
                    for feature, value in shap_values.items()
                }

                # Ambil 5 fitur dengan SHAP value tertinggi (absolut)
                top_features = sorted(
                    normalized_shap_values.items(),
                    key=lambda x: abs(x[1]),
                    reverse=True
                )[:5]

                # Buat format tabel baru
                formatted_row = {
                    "ID_Karyawan": employee_id
                }
                for i, (feature, value) in enumerate(top_features, start=1):
                    formatted_row[f"Nama_Fitur_{i}"] = feature
                    formatted_row[f"Besar_Value_{i}"] = value
                result.append(formatted_row)

            # Konversi ke DataFrame
            formatted_df = pd.DataFrame(result)
            return formatted_df
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengambil data: {e}")
            return pd.DataFrame()
        finally:
            conn.close()

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

def show_report():
    # Tampilkan navbar
    navbar()

    st.markdown("""
        <style>
        .stDownloadButton > button {
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

        .stDownloadButton > button:hover {
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

    # Konten halaman Laporan
    st.markdown(
    """
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <h3 style="text-align: center; font-family: 'Poppins', sans-serif;">
            Halaman Laporan
        </h3>
    """, unsafe_allow_html=True
    )

    # Menu dropdown
    menu_option = st.selectbox(
        "Pilih data yang ingin ditampilkan:",
        ["History Prediksi", "History SHAP Values"]
    )

    if menu_option == "History Prediksi":
        st.markdown(
        """
            <h5 style="text-align: center; font-family: 'Poppins', sans-serif;">
                Tabel Histori Prediksi
            </h5>
        """, unsafe_allow_html=True
        )
        # Ambil data dari tabel history_prediction
        df = get_all_predictions()

        if not df.empty:
            # Tampilkan data dalam bentuk tabel
            st.dataframe(df)

            # Tombol untuk mendownload CSV
            csv = df.to_csv(index=False)  # Konversi DataFrame ke CSV tanpa indeks
            st.download_button(
                label="Download Tabel sebagai CSV",
                data=csv,
                file_name="history_prediction.csv",
                mime="text/csv",
            )
        else:
            st.write("Tidak ada data yang tersedia di tabel history_prediction.")

    elif menu_option == "History SHAP Values":
        st.markdown(
        """
            <h5 style="text-align: center; font-family: 'Poppins', sans-serif;">
                Tabel Histori SHAP Values
            </h5>
        """, unsafe_allow_html=True
        )
        # Ambil data dari tabel shap_pred_result
        df = get_shap_top_features()

        if not df.empty:
            # Tampilkan data dalam bentuk tabel
            st.dataframe(df)

            # Tombol untuk mendownload CSV
            csv = df.to_csv(index=False)  # Konversi DataFrame ke CSV tanpa indeks
            st.download_button(
                label="Download Tabel sebagai CSV",
                data=csv,
                file_name="shap_pred_result.csv",
                mime="text/csv",
            )
        else:
            st.write("Tidak ada data yang tersedia di tabel shap_pred_result.")

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
# Jalankan fungsi show_report
if __name__ == "__main__":
    show_report()