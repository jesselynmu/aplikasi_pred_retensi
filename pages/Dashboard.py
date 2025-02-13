import streamlit as st
import os
import mysql.connector
import pandas as pd
import plotly.express as px
import seaborn as sns
import matplotlib.pyplot as plt

# st.set_page_config(page_title="TALENTRA", layout="wide", initial_sidebar_state="collapsed")

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
            background-color: #264CBE !important;
            color: white !important;
            border-radius: 10px !important;
            font-size: 12px !important;
            font-weight: bold !important;
            padding: 10px 15px !important;
            margin-top:6px !important;
            border: none !important;
            cursor: pointer !important;
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
            SELECT employee_id AS ID_Karyawan, Nama, domisili as Domisili, jenis_kelamin as Jenis_Kelamin, 
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
            Lihat dan Temukan Informasi yang Anda Inginkan
        </h4>
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
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
            <h4 style="text-align: center; font-family: 'Inter', sans-serif;">
                Analisis Visual Distribusi Karyawan
            </h4>
        """, unsafe_allow_html=True
        )
        
        # Layout untuk dua grafik per baris
        col1, col2 = st.columns(2)

        with col1:
            st.markdown(
            """
                <h6 style="text-align: center; font-family: 'Inter', sans-serif;">
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
                <h6 style="text-align: center; font-family: 'Inter', sans-serif;">
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
                <h6 style="text-align: center; font-family: 'Inter', sans-serif;">
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
                <h6 style="text-align: center; font-family: 'Inter', sans-serif;">
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
