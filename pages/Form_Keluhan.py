import streamlit as st
import os
import mysql.connector
import time

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

# Fungsi untuk menyimpan data ke database
def save_employee_comment(employee_id, comment):
    conn = connect_to_db()
    if conn:
        try:
            query = """
                INSERT INTO employee_comments (employee_id, comment, created_at)
                VALUES (%s, %s, NOW())
            """
            cursor = conn.cursor()
            cursor.execute(query, (employee_id, comment))
            conn.commit()
            st.success("Komentar berhasil disimpan. Terima kasih atas masukan Anda!")
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat menyimpan komentar: {e}")
        finally:
            conn.close()

def update_total_comments(employee_id):
    conn = connect_to_db()
    if conn:
        try:
            # Hitung jumlah komentar dari employee_comments berdasarkan employee_id
            cursor = conn.cursor()
            query_count = """
                SELECT COUNT(*) FROM employee_comments WHERE employee_id = %s
            """
            cursor.execute(query_count, (employee_id,))
            total_comments = cursor.fetchone()[0]

            # Update total_komp di data_employee_db
            query_update = """
                UPDATE data_employee_db
                SET total_komp = %s
                WHERE employee_id = %s
            """
            cursor.execute(query_update, (total_comments, employee_id))
            conn.commit()
            st.success(f"Total komentar untuk Employee ID {employee_id} berhasil diperbarui: {total_comments}")
        except mysql.connector.Error as e:
            st.error(f"Terjadi kesalahan saat memperbarui total komentar: {e}")
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
                Halaman Prediksi
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
        if st.button("Form Kepuasan Kerja", key="nav_prediksi"):
            st.switch_page("pages/Form_Kepuasan.py")  # Pindah ke halaman yang sudah ada

    with col3:
        if st.button("Form Keluhan", key="nav_dashboard"):
            st.switch_page("pages/Form_Keluhan.py")  # Pindah ke halaman yang sesuai

def show_karyawan_komen():
    # Navbar 
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
            Silahkan Berikan Keluhan Anda
        </h4>
    """, unsafe_allow_html=True
    )
    
    # Inisialisasi session state 
    if "submit_success" not in st.session_state:
        st.session_state.submit_success = False
    if "employee_id" not in st.session_state:
        st.session_state.employee_id = ""

    # Jika data berhasil disimpan, tampilkan pesan sukses dan tombol kembali
    if st.session_state.submit_success:
        st.success("Komentar berhasil disimpan. Terima kasih atas masukan Anda!")
        if st.button("Kembali ke Form Awal"):
            st.session_state.submit_success = False
            st.session_state.employee_id = ""
            st.rerun()
        return  # Penting: hentikan eksekusi fungsi di sini

    # Form input (hanya ditampilkan jika submit_success adalah False)
    employee_id = st.text_input(
        "Masukkan Employee ID Anda",
        value=st.session_state.employee_id,
        placeholder="Contoh: EM12345"
    )

    comment = st.text_area("Tuliskan Komentar atau Keluhan Anda")

    if st.button("Submit"):
        if not employee_id or not comment:
            st.error("Harap isi semua bidang sebelum mengirimkan.")
        else:
            save_employee_comment(employee_id, comment)
            update_total_comments(employee_id)
            st.session_state.submit_success = True
            st.session_state.employee_id = employee_id
            st.rerun()  # Gunakan experimental_rerun() untuk memuat ulang halaman

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
    show_karyawan_komen()
