import streamlit as st
import os
import mysql.connector
import math

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
                <a href="?page=karyawan_form" class="{ 'active' if st.session_state.page == 'karyawan_form' else '' }">Form Kepuasan Kerja</a>
                <a href="?page=karyawan_komen" class="{ 'active' if st.session_state.page == 'karyawan_komen' else '' }">Form Komplain</a>
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
        <h3 style="text-align: center; font-family: 'Poppins', sans-serif;">
            Form Kepuasan Kerja Karyawan
        </h3>
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
        st.success(f"Employee ID ditemukan!")

        st.markdown(
        """
            <h3 style="text-align: center; font-family: 'Poppins', sans-serif;">
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