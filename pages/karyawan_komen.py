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

def show_karyawan_komen():
    # Navbar 
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
            Form Komplain
        </h3>
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
