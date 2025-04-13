import streamlit as st
import os
import mysql.connector
import pandas as pd
import json

with open("feature_explanation.json", "r") as f:
    feature_dict = json.load(f)

# st.set_page_config(page_title="TALENTRA", layout="wide", initial_sidebar_state="collapsed")

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
            query = """SELECT a.employee_id as ID_Karyawan, a.shap_values, b.hasil_prediksi_klasifikasi as Hasil_Prediksi_Retensi, 
            b.hasil_prediksi_regresi as Hasil_Prediksi_Lama_Kerja
            FROM shap_pred_result a inner join history_prediction b on a.employee_id = b.employee_id"""
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
                    "ID_Karyawan": employee_id,
                    "Hasil_Prediksi_Retensi": row["Hasil_Prediksi_Retensi"],  # Tambahkan ini!
                    "Hasil_Prediksi_Lama_Kerja": row["Hasil_Prediksi_Lama_Kerja"],  # Tambahkan ini!
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

def navbar():
    logo_path = os.path.join(os.path.dirname(__file__), "../asset/logo.png")

    st.markdown(
        f"""
        <style>
        .navbar-container {{
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #D0EEFF;
            border-radius: 15px;
            padding: 10px 20px;
            width: 100%;
        }}
        .navbar-left {{
            display: flex;
            align-items: center;
            gap: 10px;
        }}
        .navbar-left img {{
            height: 40px;
        }}
        .navbar-center {{
            flex: 1;
            text-align: center;
            font-family: 'Inter', sans-serif;
            color: #1D567E;
            font-size: 18px;
            font-weight: bold;
        }}
        .navbar-right {{
            margin-left: auto;
        }}
        .stButton > button {{
            background-color: #264CBE;
            color: white;
            font-family: 'Inter', sans-serif;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            margin-top: 8px;
            width: 100%;
        }}
        .stButton > button:hover {{
            background-color: #1D3A8A !important;
        }}
        </style>

        """, unsafe_allow_html=True)

    col1, col2 = st.columns([10, 1])

    with col1:
        st.markdown(f"""
        <div class="navbar-container">
            <div class="navbar-left">
                <img src="data:image/png;base64,{get_image_as_base64(logo_path)}" alt="Logo">
            </div>
            <div class="navbar-center">
                Halaman Laporan
            </div>
            <div class="navbar-right">
        """, unsafe_allow_html=True)

    with col2:
        if st.button("Logout" if st.session_state.get('logged_in', False) else "Logout", key="login_button"):
            if st.session_state.get('logged_in', False):
                st.session_state['logged_in'] = False
                st.query_params["logged_out"] = "true"  # Tandai bahwa logout baru saja terjadi
                st.rerun()
            else:
                st.switch_page("pages/login.py")

    st.markdown("</div></div>", unsafe_allow_html=True)


def menu():
    if "page" not in st.session_state:
        st.session_state["page"] = "Home"

    # **Gunakan Streamlit Columns agar Navbar Sejajar (3 Kolom)**
    col2, col3, col4 = st.columns([1.5, 1.5, 1.5])  # 3 Kolom (Tanpa col5)

    # **Custom CSS untuk Tombol Navbar yang Spesifik**
    st.markdown(
        """
        <style>
        /* Tombol di col2 (Prediksi) */
        div[data-testid="column"]:nth-child(1) button {
            background-color: #FF5733 !important; /* Warna oranye */
            color: white !important;
            padding: 10px 20px !important;
            margin: 5px 0 !important;
            border: none !important;
            border-radius: 5px !important;
            cursor: pointer !important;
        }
        div[data-testid="column"]:nth-child(1) button:hover {
            background-color: #E64A19 !important; /* Warna oranye lebih gelap saat hover */
        }

        /* Tombol di col3 (Dashboard) */
        div[data-testid="column"]:nth-child(2) button {
            background-color: #33FF57 !important; /* Warna hijau */
            color: white !important;
            padding: 10px 20px !important;
            margin: 5px 0 !important;
            border: none !important;
            border-radius: 5px !important;
            cursor: pointer !important;
        }
        div[data-testid="column"]:nth-child(2) button:hover {
            background-color: #2ECC71 !important; /* Warna hijau lebih gelap saat hover */
        }

        /* Tombol di col4 (Laporan) */
        div[data-testid="column"]:nth-child(3) button {
            background-color: #3357FF !important; /* Warna biru */
            color: white !important;
            padding: 10px 20px !important;
            margin: 5px 0 !important;
            border: none !important;
            border-radius: 5px !important;
            cursor: pointer !important;
        }
        div[data-testid="column"]:nth-child(3) button:hover {
            background-color: #2C3E50 !important; /* Warna biru lebih gelap saat hover */
        }
        </style>
        """,
        unsafe_allow_html=True
    )

    # Tombol navigasi dengan warna berbeda di col2, col3, col4
    with col2:
        if st.button("Prediksi", key="nav_prediksi"):
            st.switch_page("pages/Prediksi.py")  # Pindah ke halaman yang sudah ada

    with col3:
        if st.button("Dashboard", key="nav_dashboard"):
            st.switch_page("pages/Dashboard.py")  # Pindah ke halaman yang sesuai

    with col4:
        if st.button("Laporan", key="nav_laporan"):
            st.switch_page("pages/Laporan.py")  # Pindah ke halaman laporan

def show_report():
    # Tampilkan navbar
    navbar()
    menu()

    st.markdown("""
        <style>
        .stDownloadButton > button {
            background-color: #264CBE;
            color: white;
            font-family: 'Inter', sans-serif;
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
            font-family: 'Inter', sans-serif;
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
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <h4 style="text-align: center; font-family: 'Inter', sans-serif;">
            Lihat Hasil Prediksi 
        </h4>
    """, unsafe_allow_html=True
    )

    # Menu dropdown
    menu_option = st.selectbox(
        "Pilih data yang ingin ditampilkan:",
        ["History Prediksi", "History SHAP Values"]
    )

    if menu_option == "History Prediksi":

        # Ambil data dari tabel history_prediction
        df = get_all_predictions()

        if not df.empty:
            # **Filter Tanggal Prediksi**
            
            col1, col2, col3 = st.columns(3)
            with col1:
                # st.markdown("Pilih Tanggal Mulai Prediksi")
                start_date = st.date_input("Dari Tanggal Prediksi", df["Waktu_Prediksi"].min().date() if not df.empty else None)
            with col2:
                # st.markdown("Pilih Tanggal Akhir Prediksi")
                end_date = st.date_input("Sampai Tanggal Prediksi", df["Waktu_Prediksi"].max().date() if not df.empty else None)
            with col3:
            # **Filter Hasil Prediksi Retensi**
                # st.markdown("Pilih Retensi/Tidak")
                filter_retensi = st.selectbox("Pilih Kategori Retensi/Tidak", ["Semua", "Retensi", "Tidak Retensi"])

            # **Filter Data Sesuai Input Pengguna**
            if start_date and end_date:
                df = df[(df["Waktu_Prediksi"] >= pd.Timestamp(start_date)) & (df["Waktu_Prediksi"] <= pd.Timestamp(end_date))]

            if filter_retensi != "Semua":
                df = df[df["Hasil_Prediksi_Retensi"] == filter_retensi]

            # Tampilkan data dalam bentuk tabel
            st.dataframe(df)

            # Tombol untuk mendownload CSV
            if not df.empty:
                csv = df.to_csv(index=False)  # Konversi DataFrame ke CSV tanpa indeks
                st.download_button(
                    label="Download Tabel sebagai CSV",
                    data=csv,
                    file_name="history_prediction_filtered.csv",
                    mime="text/csv",
                )
        else:
            st.write("Tidak ada data yang tersedia di tabel history_prediction.")

    elif menu_option == "History SHAP Values":
        st.markdown(
        """
            <h5 style="text-align: center; font-family: 'Inter', sans-serif;">
                Tabel Histori SHAP Values
            </h5>
        """, unsafe_allow_html=True
        )

        # Ambil data dari tabel shap_pred_result
        df = get_shap_top_features()
        
        filter_retensi = st.selectbox("Pilih Kategori Retensi/Tidak", ["Semua", "Retensi", "Tidak Retensi"])

        if filter_retensi != "Semua":
                df = df[df["Hasil_Prediksi_Retensi"] == filter_retensi]

        if not df.empty:
            # Tambahkan kolom deskripsi fitur berdasarkan JSON
            for i in range(1, 6):  # Karena ada 5 fitur top SHAP
                feature_col = f"Nama_Fitur_{i}"
                desc_col = f"Deskripsi_Fitur_{i}"
                if feature_col in df.columns:
                    df[desc_col] = df[feature_col].map(feature_dict).fillna("-")  # Isi dengan "-" jika tidak ada di JSON

            # Tampilkan data dalam bentuk tabel
            st.dataframe(df)

            st.caption("Keterangan: Geser ke kanan untuk melihat keseluruhan data")

            # Konversi DataFrame ke CSV untuk di-download
            csv = df.to_csv(index=False)
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