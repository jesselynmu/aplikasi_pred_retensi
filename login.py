import streamlit as st
import mysql.connector
import os

def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")
    
def navbar():
    logo_path = os.path.join(os.path.dirname(__file__), "./asset/logo.png")

    st.markdown(
        f"""
        <style>
        .navbar {{
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 20px;
            font-family: 'Poppins', sans-serif;
            margin-top: 20px;
            background-color: #D0EEFF; /* Background navbar */
            border-radius: 15px; /* Membulatkan sudut navbar */
        }}
        .navbar .logo {{
            display: flex;
            align-items: center;
            gap: 15px;
        }}
        .navbar .logo img {{
            height: 40px;
        }}
        .navbar .text {{
            font-size: 18px;
            font-weight: bold;
            color: #264CBE;
        }}
        </style>
        <div class="navbar">
            <div class="logo">
                <img src="data:image/png;base64,{get_image_as_base64(logo_path)}" alt="Logo">
                <div class="text">Silahkan Login ke Akun Anda</div>
            </div>
        </div>
        """,
        unsafe_allow_html=True,
    )

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
        st.success("Koneksi ke database berhasil!")
        return conn
    except mysql.connector.Error as e:
        st.error(f"Koneksi ke database gagal: {e}")
        return None

# Fungsi untuk validasi login
def validate_login(username, password):
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor(dictionary=True)
        query = "SELECT * FROM user WHERE username = %s AND password = %s"
        cursor.execute(query, (username, password))
        user = cursor.fetchone()
        conn.close()
        return user
    return None

def show_login():
    navbar()
    st.markdown("""
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        /* Reset Layout */
        html, body, [data-testid="stAppViewContainer"] {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            font-family: 'Poppins', sans-serif;
        }

        /* Fullscreen Center */
        [data-testid="stAppViewContainer"] {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f5f5f5;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }

        /* Logo Styling */
        div[data-testid="stImage"] img {
            width: 100px;
            height: auto;
            margin-bottom: 20px;
        }

        /* Title Styling */
        .login-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
        }

        /* Input Fields */
        .stTextInput > div > div > input {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            padding: 10px;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
            width: 100%;
        }

        /* Button Styling */
        .stButton > button {
            background-color: #264CBE;
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 2000;
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
        
    # Input form
    username = st.text_input("Username", placeholder="Masukkan username")
    password = st.text_input("Password", type="password", placeholder="Masukkan password")
    
    # Validasi tombol login tetap tidak diubah
    if st.button("Login", key="login_button"):
        user = validate_login(username, password)
        if user:
            st.session_state['logged_in'] = True
            st.session_state['role'] = user['role'].lower()
            st.session_state['username'] = user['username']
            st.rerun()
        else:
            st.error("Username atau password salah.")
    
    st.markdown('</div>', unsafe_allow_html=True)  # Tutup container
    st.markdown('</div>', unsafe_allow_html=True)

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

def main():
    if 'logged_in' not in st.session_state:
        st.session_state['logged_in'] = False
        st.session_state['role'] = None
        st.session_state['username'] = None

    if st.session_state['logged_in']:
        role = st.session_state['role']
        if role == 'admin':
            st.switch_page("pages/prediction.py")
        elif role == 'karyawan':
            st.switch_page("pages/karyawan_form.py")
        elif role == 'pimpinan':
            st.switch_page("pages/pimpinan_form.py")
    else:
        show_login()

if __name__ == "__main__":
    main()