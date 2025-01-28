import streamlit as st
import os
import pandas as pd
import mysql.connector

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
                <a href="?page=pimpinan_form" class="{ 'active' if st.session_state.page == 'pimpinan_form' else '' }">Form Performance Rate</a>
                <a href="?page=pimpinan_exploration" class="{ 'active' if st.session_state.page == 'pimpinan_exploration' else '' }">Dashboard</a>
            </div>
            <a class="login-button" href="{login_button_link}">{login_button_text}</a>
        </div>
        """,
        unsafe_allow_html=True,
    )

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

# Fungsi untuk mendapatkan data "All Data + Komentar"
def get_all_data_with_comments():
    conn = connect_to_db()
    if conn:
        try:
            query = """
                SELECT 
                e.employee_id AS ID_Karyawan, e.domisili as Domisili, e.jenis_kelamin as Jenis_Kelamin, 
                e.join_date as Tanggal_Masuk, e.resign_date as Tanggal_Keluar, e.marriage_stat as Status_Pernikahan,
                e.dependant as Jumlah_Tanggungan, e.education as Pendidikan, e.absent_90D as Absen_90Hari, 
                e.avg_time_work as Rata_Rata_Jam_Kerja, e.departemen as Departemen, e.position as Posisi,
                e.income as Penghasilan, e.total_komp as Total_Komplain, e.job_satisfaction as Kepuasan_Kerja,
                e.performance_rating as Kinerja_Kerja,
                    IFNULL(c.comment, 'Tidak ada Komplain') AS Isi_Komentar
                FROM data_employee_db e
                LEFT JOIN employee_comments c ON e.employee_id = c.employee_id
            """
            df = pd.read_sql(query, conn)
            return df
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengambil data: {e}")
            return pd.DataFrame()
        finally:
            conn.close()

# Fungsi untuk mendapatkan data "History Prediksi"
def get_history_prediction():
    conn = connect_to_db()
    if conn:
        try:
            query = """SELECT employee_id as ID_Karyawan, hasil_prediksi_klasifikasi as Hasil_Prediksi_Retensi,
                    hasil_prediksi_regresi as Hasil_Prediksi_Lama_Kerja, waktu_prediksi as Waktu_Prediksi
                    FROM history_prediction"""
            df = pd.read_sql(query, conn)
            return df
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengambil data: {e}")
            return pd.DataFrame()
        finally:
            conn.close()

def show_pimpinan_exploration():
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

    st.markdown(
    """
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <h3 style="text-align: center; font-family: 'Poppins', sans-serif;">
            Dashboard
        </h3>
    """, unsafe_allow_html=True
    )

    # Menu Dropdown
    menu_option = st.selectbox(
        "Pilih data yang ingin ditampilkan:",
        ["Semua Data Karyawan", "Histori Prediksi"]
    )

    col1, col2 = st.columns(2)
    with col1:
        filter_employee_id = st.text_input("Filter berdasarkan Karyawan_ID", placeholder="Contoh: EM12345")
    with col2:
        filter_departemen = st.selectbox(
            "Filter berdasarkan Departemen",
            ["Semua", "Engineering & IT", "Service & Support", "Creative & Design",
            "Marketing", "Operations", "HR", "Finance & Accounting",
            "Corporate Strategy & Communications"]
        )

    if menu_option == "Semua Data Karyawan":
        df = get_all_data_with_comments()

        if not df.empty:
            # Terapkan filter
            if filter_employee_id:
                df = df[df['Karyawan_ID'].str.contains(filter_employee_id, na=False)]

            if filter_departemen != "Semua":
                df = df[df['Departemen'] == filter_departemen]

            # Tampilkan data
            st.dataframe(df)

            # Tombol untuk download CSV
            csv = df.to_csv(index=False)
            st.download_button(
                label="Download Tabel sebagai CSV",
                data=csv,
                file_name="all_data_with_comments.csv",
                mime="text/csv",
            )
        else:
            st.write("Tidak ada data yang tersedia.")

    elif menu_option == "Histori Prediksi":
        df = get_history_prediction()

        if not df.empty:
            # Terapkan filter
            if filter_employee_id:
                df = df[df['Karyawan_ID'].str.contains(filter_employee_id, na=False)]

            # Tampilkan data
            st.dataframe(df)

            # Tombol untuk download CSV
            csv = df.to_csv(index=False)
            st.download_button(
                label="Download Tabel sebagai CSV",
                data=csv,
                file_name="history_prediction.csv",
                mime="text/csv",
            )
        else:
            st.write("Tidak ada data yang tersedia.")

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
# Jalankan fungsi show_pimpinan_exploration
if __name__ == "__main__":
    show_pimpinan_exploration()
