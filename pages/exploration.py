import streamlit as st
import os
import mysql.connector
import pandas as pd
import plotly.express as px
import seaborn as sns
import matplotlib.pyplot as plt

# Fungsi untuk mendapatkan gambar sebagai base64
def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")

# Fungsi untuk menampilkan navbar
def navbar():
    current_page = "exploration"  # Sesuaikan dengan halaman saat ini
    logo_path = os.path.join(os.path.dirname(__file__), "../asset/logo.png")  # Sesuaikan path logo

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

def get_all_employee_data(filter_employee_id=None, filter_join_date=None):
    conn = connect_to_db()
    if conn:
        try:
            query = """
            SELECT employee_id AS ID_Karyawan, domisili as Domisili, jenis_kelamin as Jenis_Kelamin, 
            join_date as Tanggal_Masuk, resign_date as Tanggal_Keluar, marriage_stat as Status_Pernikahan,
            dependant as Jumlah_Tanggungan, education as Pendidikan, absent_90D as Absen_90Hari, 
            avg_time_work as Rata_Rata_Jam_Kerja, departemen as Departemen, position as Posisi,
            income as Penghasilan, total_komp as Total_Komplain, job_satisfaction as Kepuasan_Kerja,
            performance_rating as Kinerja_Kerja
            FROM data_employee_db WHERE 1=1"""
            params = []

            if filter_employee_id:
                query += " AND employee_id LIKE %s"
                params.append(f"%{filter_employee_id}%")

            if filter_join_date:
                query += " AND join_date >= %s"
                params.append(filter_join_date)

            df = pd.read_sql(query, conn, params=params)
            return df
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengambil data: {e}")
            return pd.DataFrame()
        finally:
            conn.close()


def get_joined_employee_data(filter_employee_id=None):
    conn = connect_to_db()
    if conn:
        try:
            query = """
                SELECT 
                    e.employee_id as ID_Karyawan,
                    e.comment AS Komplain,
                    s.job_satisfaction  AS Skor_Kepuasan_Kerja,
                    s.performance_rating AS Skor_Kinerja_Kerja
                FROM employee_comments e
                INNER JOIN data_employee_db s ON e.employee_id = s.employee_id
                WHERE 1=1
            """
            params = []

            if filter_employee_id:
                query += " AND e.employee_id LIKE %s"
                params.append(f"%{filter_employee_id}%")

            df = pd.read_sql(query, conn, params=params)
            return df
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengambil data: {e}")
            return pd.DataFrame()
        finally:
            conn.close()

def show_exploration():
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
            Halaman Dashboard
        </h3>
    """, unsafe_allow_html=True
    )

    # Dropdown menu
    menu_option = st.selectbox(
        "Pilih Menu",
        ["Lihat Semua Informasi Karyawan", "Lihat Data Komplain Karyawan"]
    )

    # Pilihan menu
    if menu_option == "Lihat Semua Informasi Karyawan":
        col1, col2 = st.columns(2)

        with col1:
            filter_employee_id = st.text_input("Filter berdasarkan ID Karyawan", placeholder="Contoh: EM12345")

        with col2:
            filter_join_date = st.date_input("Filter berdasarkan Tanggal Masuk", value=None)

        df = get_all_employee_data(filter_employee_id, filter_join_date)

        if not df.empty:
            st.dataframe(df)
            csv = df.to_csv(index=False)
            st.download_button(
                label="Download Data sebagai CSV",
                data=csv,
                file_name="data_employee_db.csv",
                mime="text/csv",
            )
        else:
            st.write("Tidak ada data yang tersedia di tabel data_employee_db.")
        
        st.markdown(
        """
            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
            <h4 style="text-align: center; font-family: 'Poppins', sans-serif;">
                Analisis Visual Distribusi Karyawan
            </h4>
        """, unsafe_allow_html=True
        )
        
        # Layout untuk dua grafik per baris
        col1, col2 = st.columns(2)

        with col1:
            st.markdown(
            """
                <h6 style="text-align: center; font-family: 'Poppins', sans-serif;">
                    Distribusi Karyawan Berdasarkan Status Pernikahan
                </h6>
            """, unsafe_allow_html=True
            )
            fig_marriage = px.histogram(
                df, 
                x="Status_Pernikahan", 
                labels={"Status_Pernikahan": "Status Pernikahan", "count": "Jumlah Karyawan"}
            )
            fig_marriage.update_layout(xaxis_title="Status Pernikahan", yaxis_title="Jumlah")
            st.plotly_chart(fig_marriage, use_container_width=True)

        with col2:
            st.markdown(
            """
                <h6 style="text-align: center; font-family: 'Poppins', sans-serif;">
                    Distribusi Karyawan Berdasarkan Pendidikan
                </h6>
            """, unsafe_allow_html=True
            )
            fig_education = px.histogram(
                df, 
                x="Pendidikan", 
                labels={"Pendidikan": "Pendidikan", "count": "Jumlah Karyawan"}
            )
            fig_education.update_layout(xaxis_title="Pendidikan", yaxis_title="Jumlah")
            st.plotly_chart(fig_education, use_container_width=True)

        col1, col2 = st.columns(2)

        with col1:
            st.markdown(
            """
                <h6 style="text-align: center; font-family: 'Poppins', sans-serif;">
                    Distribusi Karyawan Berdasarkan Domisili
                </h6>
            """, unsafe_allow_html=True
            )
            fig_domisili = px.histogram(
                df, 
                x="Domisili", 
                labels={"Domisili": "Domisili", "count": "Jumlah Karyawan"}
            )
            fig_domisili.update_layout(xaxis_title="Domisili", yaxis_title="Jumlah")
            st.plotly_chart(fig_domisili, use_container_width=True)

        with col2:
            st.markdown(
            """
                <h6 style="text-align: center; font-family: 'Poppins', sans-serif;">
                    Distribusi Karyawan Berdasarkan Departemen
                </h6>
            """, unsafe_allow_html=True
            )
            fig_department = px.histogram(
                df, 
                x="Departemen", 
                labels={"Departemen": "Departemen", "count": "Jumlah Karyawan"}
            )
            fig_department.update_layout(xaxis_title="Departemen", yaxis_title="Jumlah")
            st.plotly_chart(fig_department, use_container_width=True)

    elif menu_option == "Lihat Data Komplain Karyawan":

        filter_employee_id = st.text_input("Filter berdasarkan ID Karyawan", placeholder="Contoh: EM12345")

        df = get_joined_employee_data(filter_employee_id)

        if not df.empty:
            st.dataframe(df)

            # Tombol download
            csv = df.to_csv(index=False)
            st.download_button(
                label="Download Data sebagai CSV",
                data=csv,
                file_name="joined_employee_data.csv",
                mime="text/csv",
            )
        else:
            st.write("Tidak ada data gabungan yang tersedia.")
    
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

# Jalankan fungsi show_exploration
if __name__ == "__main__":
    show_exploration()
