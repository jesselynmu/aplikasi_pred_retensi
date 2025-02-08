import streamlit as st
import mysql.connector
import os

def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")
    
st.markdown("""
    <style>
    .stButton > button {
        border-radius: 10px !important;
        font-weight: bold !important;
        font-family: 'Inter', sans-serif !important;
        margin-top: 6px !important;
    }
    /* Tombol Home (Kecil dan Biru) */
    .home-button button {
        background-color: #264CBE !important; /* Biru */
        color: white !important;
        font-size: 12px !important;
        width: 80px !important;
        height: 35px !important;
    }
    /* Tombol Login (Lebih Panjang dan Warna Berbeda) */
    .login-button button {
        background-color: #FFA500 !important; /* Oranye */
        color: white !important;
        font-size: 16px !important;
        width: 100% !important;
        height: 50px !important;
    }
    .login-button button:hover {
        background-color: white !important;
        color: #FFA500 !important;
        border: 2px solid #FFA500 !important;
    }
    </style>
""", unsafe_allow_html=True)


def navbar():
    current_page = st.session_state["page"]  
    print("Navbar current page:", repr(current_page))
    logo_path = os.path.join(os.path.dirname(__file__), "../asset/logo.png")
    
    if current_page == "Home":
        return  # Tidak perlu menampilkan navbar di Home jika tidak diinginkan

    st.markdown("""
    <style>
    .navbar-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #D0EEFF;
        border-radius: 15px;
        padding: 10px 20px;
        width: 100%;
    }
    .navbar-left {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .navbar-left img {
        height: 40px;
    }
    .navbar-center {
        flex: 1;
        text-align: center;
        font-family: 'Inter', sans-serif;
        color: #1D567E;
        font-size: 18px;
        font-weight: bold;
    }
    .navbar-right {
        margin-left: auto;
    }
    .stButton > button {
        background-color: #264CBE !important;
        color: white !important;
        border-radius: 10px !important;
        font-size: 12px !important;
        font-weight: bold !important;
        font-family: 'Inter', sans-serif !important;
        padding: 10px 20px !important;
        margin-top: 6px !important;
        width: 100px !important;
        height: 50px !important;
    }
    </style>
    """, unsafe_allow_html=True)

    col1, col2 = st.columns([11, 1])

    with col1:
        st.markdown(f"""
        <div class="navbar-container">
            <div class="navbar-left">
                <img src="data:image/png;base64,{get_image_as_base64(logo_path)}" alt="Logo">
            </div>
            <div class="navbar-center">
                Selamat Datang di TALENTRA
            </div>
            <div class="navbar-right">
        """, unsafe_allow_html=True)

    with col2:
        if st.button("Kembali", key="home_button"):
            st.session_state["page"] = "Home"
            st.rerun()  # Refresh halaman untuk memperbarui state

    st.markdown("</div></div>", unsafe_allow_html=True) 

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
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

        /* Reset Layout */
        html, body, [data-testid="stAppViewContainer"] {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            font-family: 'Inter', sans-serif;
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
            font-family: 'Inter', sans-serif;
        }

        /* Input Fields */
        .stTextInput > div > div > input {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            padding: 10px;
            border-radius: 5px;
            font-family: 'Inter', sans-serif;
            width: 100%;
        }

        /* Button Styling */
        .stButton > button {
            background-color: #264CBE;
            color: white;
            font-family: 'Inter', sans-serif;
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
        
    username = st.text_input("Username", placeholder="Masukkan username")
    password = st.text_input("Password", type="password", placeholder="Masukkan password")

    if st.button("Login", key="login_button"):
        user = validate_login(username, password)
        if user:
            st.session_state['logged_in'] = True
            st.session_state['role'] = user['role'].lower()
            st.session_state['username'] = user['username']
            st.rerun()
        else:
            st.error("Username atau password salah.")
    
    st.markdown('</div>', unsafe_allow_html=True) 
    st.markdown('</div>', unsafe_allow_html=True)

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
            st.switch_page("pages/Prediksi.py")
        elif role == 'karyawan':
            st.switch_page("pages/Form_Kepuasan.py")
        elif role == 'pimpinan':
            st.switch_page("pages/Form_Penilaian.py")
    else:
        show_login()

if __name__ == "__main__":
    main()