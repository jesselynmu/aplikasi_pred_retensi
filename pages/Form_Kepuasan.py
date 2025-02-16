import streamlit as st
import os
import mysql.connector
import math

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
            margin-top: 6px !important;
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
                Form Kepuasan Kerja
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
        login_button_text = "Logout"

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
        </style>
        """,
        unsafe_allow_html=True
    )

    # Tombol navigasi dengan warna berbeda di col2, col3, col4
    with col2:
        if st.button("Form Kepuasan Kerja", key="nav_prediksi"):
            st.switch_page("pages/Form_Kepuasan.py")  # Pindah ke halaman yang sudah ada

    with col3:
        if st.button("Form Keluhan", key="nav_dashboard"):
            st.switch_page("pages/Form_Keluhan.py")  # Pindah ke halaman yang sesuai


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
    
def check_employee_in_db(employee_id):
    conn = connect_to_db()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            query = "SELECT * FROM data_employee_db WHERE employee_id = %s"
            cursor.execute(query, (employee_id,))
            result = cursor.fetchone()
            conn.close()
            return result  # Mengembalikan data karyawan jika ditemukan
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mengakses database: {e}")
            return None
    return None

def save_job_satisfaction(employee_id, responses):
    conn = connect_to_db()
    if conn:
        try:
            # Hitung skor akhir
            total_score = sum([responses[q] for q in range(len(responses))])
            average_score = total_score / len(responses)
            final_score = min(max(round(average_score), 1), 4)  # Batas 1-4

            # Simpan ke tabel employee_job_sas
            cursor = conn.cursor()
            query = """
                INSERT INTO employee_job_sas (
                    employee_id, question_1, question_2, question_3, question_4,
                    question_5, question_6, question_7, question_8, skor_akhir
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (employee_id, *responses, final_score))
            conn.commit()

            # Update kolom job_satisfaction di tabel data_employee_db
            update_query = """
                UPDATE data_employee_db
                SET job_satisfaction = %s
                WHERE employee_id = %s
            """
            cursor.execute(update_query, (final_score, employee_id))
            conn.commit()

            conn.close()
            return final_score
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat menyimpan data: {e}")
            conn.close()
            return None


def show_karyawan_form():
    navbar()
    menu()

    st.markdown("""
        <style>
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
        <h4 style="text-align: center; font-family: 'Inter', sans-serif;">
            Silahkan Isi Form Kepuasan Kerja Anda
        </h4>
    """, unsafe_allow_html=True
    )
    
    # Inisialisasi session state
    if "employee_id" not in st.session_state:
        st.session_state.employee_id = None  # Awalnya kosong

    if "submit_success" not in st.session_state:
        st.session_state.submit_success = False  # Awalnya False

    # Input Employee ID
    if not st.session_state.employee_id:  # Jika belum ada ID yang tersimpan
        employee_id = st.text_input("Masukkan ID Karyawan", placeholder="Contoh: EM12345")

        # Tombol untuk mencocokkan employee_id
        if st.button("Isi Form"):
            if not employee_id:
                st.error("Harap masukkan Employee ID terlebih dahulu.")
                return

            # Cek apakah employee_id ada di database
            employee_data = check_employee_in_db(employee_id)
            if not employee_data:
                st.error("Employee ID tidak ditemukan di database.")
                return

            # Jika ditemukan, simpan Employee ID di session_state
            st.session_state.employee_id = employee_id

    # Jika Employee ID sudah disimpan
    if st.session_state.employee_id:
        st.success(f"ID Karyawan tersebut ditemukan! Silahkan isi form Kepuasan Kerja Anda")

        st.markdown(
        """
            <h3 style="text-align: center; font-family: 'Inter', sans-serif;">
                Isi Form Kepuasan Kerja
            </h3>
        """, unsafe_allow_html=True
        )

        questions = [
            "Bagaimana tingkat kepuasan Anda terhadap lingkungan kerja saat ini?",
            "Seberapa puas Anda dengan keseimbangan antara pekerjaan dan kehidupan pribadi?",
            "Bagaimana pendapat Anda tentang kompensasi atau benefit yang Anda terima?",
            "Bagaimana penilaian Anda terhadap hubungan dengan rekan kerja?",
            "Seberapa puas Anda dengan kesempatan pengembangan karier atau pelatihan yang disediakan perusahaan?",
            "Bagaimana penilaian Anda terhadap kejelasan tugas dan tanggung jawab di pekerjaan Anda?",
            "Seberapa puas Anda dengan penghargaan atau pengakuan atas pencapaian kerja Anda?",
            "Bagaimana tingkat kepuasan Anda terhadap kepemimpinan dan arahan dari manajer Anda?"
        ]

        options = {"Sangat Tidak Puas": 1, "Tidak Puas": 2, "Puas": 3, "Sangat Puas": 4}

        # Buat dua kolom
        col1, col2 = st.columns(2)
        responses = []

        for idx, question in enumerate(questions):
            if idx % 2 == 0:
                with col1:
                    response = st.selectbox(question, list(options.keys()), key=f"q{idx}")
                    responses.append(options[response])
            else:
                with col2:
                    response = st.selectbox(question, list(options.keys()), key=f"q{idx}")
                    responses.append(options[response])

        # Tombol Submit
        if st.button("Submit") and not st.session_state.submit_success:
            final_score = save_job_satisfaction(st.session_state.employee_id, responses)
            if final_score is not None:
                st.session_state.submit_success = True  # Tandai data berhasil disimpan
                st.success(f"Data berhasil disimpan! Skor Akhir: {final_score}")

    # Jika data berhasil disimpan, tampilkan tombol kembali
    if st.session_state.submit_success:
        if st.button("Kembali ke Form Awal"):
            # Reset Employee ID dan status submit
            st.session_state.employee_id = None
            st.session_state.submit_success = False
            st.rerun()

    st.markdown(
        """
            <div class="footer">
                <p><strong>2025 © Jesselyn Mu</strong></p>
                <p>Untuk informasi lebih lanjut, dapat mengirim email ke mujesselyn@gmail.com</p>
            </div>
        """,
        unsafe_allow_html=True
    )
if __name__ == "__main__":
    show_karyawan_form()