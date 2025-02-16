import streamlit as st
import os
import pandas as pd
import mysql.connector

# Fungsi untuk mendapatkan gambar sebagai base64
def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")

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
                Halaman Dashboard
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
    # **Pastikan Streamlit Session State Sudah Punya `page`**
    if "page" not in st.session_state:
        st.session_state["page"] = "Home"

    current_page = st.session_state["page"]
    logo_path = os.path.join(os.path.dirname(__file__), "../asset/logo.png")

    # **Login Check**
    if 'logged_in' in st.session_state and st.session_state['logged_in']:
        login_button_text = "Logout"
    else:
        login_button_text = "Login"

    # **Gunakan Streamlit Columns agar Navbar Sejajar (4 Kolom)**
    col2, col3 = st.columns([1.5, 1.5])  # 4 Kolom tanpa col1 (logo)

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

        .stButton > button {
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

        .stButton > button:hover {
            background-color: #ffffff;
            color: #264CBE;
        }
        </style>
        """,
        unsafe_allow_html=True
    )

    # Tombol navigasi dengan warna berbeda di col2, col3, col4
    with col2:
        if st.button("Form Penilaian", key="nav_prediksi"):
            st.switch_page("pages/Form_Penilaian.py")  # Pindah ke halaman yang sudah ada

    with col3:
        if st.button("Dashboard", key="nav_dashboard"):
            st.switch_page("pages/Dashboard_Pimpinan.py")  # Pindah ke halaman yang sesuai

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

    st.markdown(
    """
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <h4 style="text-align: center; font-family: 'Inter', sans-serif;">
            Silahkan Pilih Data Karyawan yang Ingin Dilihat
        </h4>
    """, unsafe_allow_html=True
    )

    # Menu Dropdown
    menu_option = st.selectbox(
        "Pilih data yang ingin ditampilkan:",
        ["Semua Data Karyawan", "Histori Prediksi"]
    )


    if menu_option == "Semua Data Karyawan":
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

        col1, col2 = st.columns(2)
        with col1:
            filter_employee_id = st.text_input("Filter berdasarkan Karyawan_ID", placeholder="Contoh: EM12345")
        with col2:
            filter_retensi = st.selectbox("Pilih Kategori Retensi/Tidak", ["Semua", "Retensi", "Tidak Retensi"])

        if not df.empty:
            # Terapkan filter
            if filter_employee_id:
                df = df[df['Karyawan_ID'].str.contains(filter_employee_id, na=False)]

            if filter_retensi != "Semua":
                df = df[df["Hasil_Prediksi_Retensi"] == filter_retensi]
                
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
