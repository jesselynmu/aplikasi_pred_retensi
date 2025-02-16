import streamlit as st
import os
import mysql.connector
import math

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
            background-color: #264CBE;
            color: white;
            font-family: 'Inter', sans-serif;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            margin-top: 8px !important;
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
                Form Penilaian Kinerja Karyawan
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


def get_employee_id_by_name(employee_name):
    conn = connect_to_db()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            query = "SELECT employee_id FROM data_employee_db WHERE Nama = %s LIMIT 1"
            cursor.execute(query, (employee_name,))
            result = cursor.fetchone()
            conn.close()
            return result["employee_id"] if result else None
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat mencari Employee ID: {e}")
            conn.close()
            return None
        
# Fungsi untuk mencocokkan employee_id di database
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

# Fungsi untuk menyimpan data dan menghitung skor akhir
def save_employee_ratings(employee_id, responses):
    conn = connect_to_db()
    if conn:
        try:
            # Hitung skor akhir
            total_score = sum([responses[q] for q in range(len(responses))])
            average_score = total_score / len(responses)
            final_score = min(max(round(average_score), 1), 4)  # Batas 1-4

            # Simpan ke tabel employee_ratings
            cursor = conn.cursor()
            query = """
                INSERT INTO employee_ratings (
                    employee_id, question_1, question_2, question_3, question_4,
                    question_5, question_6, question_7, question_8, skor_akhir
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (employee_id, *responses, final_score))
            conn.commit()

            # Update performance_rating di data_employee_db
            update_query = """
                UPDATE data_employee_db
                SET performance_rating = %s
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

# Fungsi utama untuk form kinerja rating karyawan
def show_pimpinan_form():
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
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <h4 style="text-align: center; font-family: 'Inter', sans-serif;">
            Silahkan Isi Form Penilaian Karyawan Anda
        </h4>
    """, unsafe_allow_html=True
    )

        # Inisialisasi session state
    if "employee_name" not in st.session_state:
        st.session_state.employee_name = None

    if "submit_success" not in st.session_state:
        st.session_state.submit_success = False

    # Input Nama Karyawan
    if not st.session_state.employee_name:
        employee_name = st.text_input("Masukkan Nama Lengkap Karyawan yang ingin diberikan penilaian", placeholder="Contoh: Budi Santoso")

        if st.button("Isi Form"):
            if not employee_name:
                st.error("Harap masukkan Nama Lengkap Karyawan terlebih dahulu.")
                return

            # Cari ID berdasarkan nama
            employee_id = get_employee_id_by_name(employee_name)
            if not employee_id:
                st.error("Nama Karyawan tidak ditemukan di database.")
                return

            # Simpan Nama dan ID di session_state
            st.session_state.employee_name = employee_name
            st.session_state.employee_id = employee_id

    # Jika Nama sudah ditemukan
    if st.session_state.employee_name:
        st.success(f"Karyawan ditemukan! Anda sedang mengisi untuk {st.session_state.employee_name} (ID: {st.session_state.employee_id})")

        # Pertanyaan penilaian
        questions = [
            "Bagaimana tingkat keandalan karyawan dalam menyelesaikan tugas tepat waktu?",
            "Seberapa efektif karyawan ini dalam bekerja secara mandiri atau dalam tim?",
            "Bagaimana penilaian Anda terhadap kemampuan karyawan untuk memecahkan masalah?",
            "Seberapa baik karyawan ini dalam mencapai target atau KPI yang telah ditentukan?",
            "Seberapa baik karyawan ini beradaptasi terhadap perubahan atau tantangan baru?",
            "Bagaimana penilaian Anda terhadap inisiatif yang diambil oleh karyawan ini dalam pekerjaannya?",
            "Seberapa efektif komunikasi karyawan ini, baik kepada rekan kerja maupun kepada pelanggan?",
            "Bagaimana Anda menilai sikap profesionalisme karyawan dalam menjalankan tugas sehari-hari?"
        ]

        options = {"Sangat Buruk": 1, "Cukup Baik": 2, "Baik": 3, "Sangat Baik": 4}

        # Tampilkan pertanyaan dalam dua kolom
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
            final_score = save_employee_ratings(st.session_state.employee_id, responses)
            if final_score is not None:
                st.session_state.submit_success = True
                st.success(f"Data berhasil disimpan! Skor Akhir: {final_score} untuk {st.session_state.employee_name}")

    # Jika data berhasil disimpan, tampilkan tombol kembali
    if st.session_state.submit_success:
        if st.button("Kembali ke Form Awal"):
            st.session_state.employee_name = None
            st.session_state.employee_id = None
            st.session_state.submit_success = False
            st.rerun()

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

# Jalankan fungsi show_pimpinan_form
if __name__ == "__main__":
    show_pimpinan_form()
