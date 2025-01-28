import os
import sys
import streamlit as st

from pages.karyawan_form import show_karyawan_form
from pages.pimpinan_form import show_pimpinan_form
from pages.prediction import show_prediction
from pages.report import show_report
from pages.exploration import show_exploration
from pages.karyawan_komen import show_karyawan_komen
from pages.pimpinan_exploration import show_pimpinan_exploration

# Set konfigurasi halaman sebagai perintah pertama
st.set_page_config(page_title="Aplikasi Prediksi Retensi Karyawan", layout="wide", initial_sidebar_state="collapsed")

# Tambahkan direktori 'App' ke sys.path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

# Import halaman dari folder pages
import pages as pg

# Import halaman dari root directory
from login import show_login  # Impor dari file login.py di root directory

parent_dir = os.path.dirname(os.path.abspath(__file__))
logo_path = os.path.join(parent_dir, "asset/logo.png")

st.markdown(
    """
    <style>
    /* Hilangkan margin dan padding dari elemen utama */
    .stApp {
        margin: 0 !important;
        padding: 0 !important;
    }

    /* Pastikan elemen utama Streamlit tidak memiliki margin */
    .stMainBlockContainer {
        margin-top: 0 !important; /* Hilangkan jarak di atas */
        padding-top: 0 !important; /* Hilangkan padding atas */
    }

    /* Hilangkan margin vertikal awal */
    [data-testid="stVerticalBlock"] {
        margin-top: 0 !important; /* Atur ulang margin atas */
        padding-top: 0 !important; /* Hilangkan padding atas */
    }

    </style>
    """,
    unsafe_allow_html=True,
)

# CSS untuk mengubah warna latar belakang
background_style = """
    <style>
    .stApp {
        background-color: #F9F9F9; /* Ubah warna latar belakang di sini */
    }
    </style>
"""
st.markdown(background_style, unsafe_allow_html=True)

st.markdown(
    """
<style>
    [data-testid="collapsedControl"] {
        display: none
    }
</style>
""",
    unsafe_allow_html=True,
)

if "page" not in st.session_state:
    query_params = st.query_params
    print("Query parameters (raw):", repr(query_params))  

    if "page" in query_params:
        st.session_state.page = query_params["page"]
        if isinstance(st.session_state.page, list): 
            st.session_state.page = st.session_state.page[0]
        st.session_state.page = st.session_state.page.strip()  
    else:
        st.session_state.page = "Home"

    # Tambahkan validasi login
    if 'logged_in' in st.session_state and st.session_state['logged_in']:
        role = st.session_state.get('role', '').lower()
        role_pages = {
            'admin': 'admin',
            'karyawan': 'karyawan_form',
            'pimpinan': 'pimpinan_form'
        }
        st.session_state.page = role_pages.get(role, 'Login')

    valid_pages = ["Home", "Login", "admin", "karyawan_form", "pimpinan_form", 
                   "exploration", "report", "Prediksi", "karyawan_komen", "pimpinan_exploration"]
    if st.session_state.page not in valid_pages:
        print(f"Invalid page detected: {st.session_state.page}. Defaulting to 'Home'.")
        st.session_state.page = "Home"
    print("Current page after query params handling:", st.session_state.page)

if 'logged_in' not in st.session_state:
    st.session_state['logged_in'] = False
    st.session_state['role'] = None
    print("Session state initialized:", st.session_state)

def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")
    
def navbar_with_sidebar_control(pages, options, logo_path):
    # Kontrol sidebar visibility
    if not options.get("show_sidebar", True):  # Jika "show_sidebar" = False
        st.markdown(
            """
            <style>
            [data-testid="stSidebar"] { 
                display: none; 
            }
            </style>
            """,
            unsafe_allow_html=True,
        )

    # Render navbar
    navbar_home()

def navbar_home():
    current_page = st.session_state.page  
    print("Navbar current page:", repr(current_page))
    if current_page == "Login":
        return
    
    st.markdown(
        f"""
        <style>
        .navbar {{
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            font-family: 'Poppins', sans-serif;
            margin-top: 0px; /* Hilangkan jarak atas */
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
            align-items: center; /* Pusatkan teks secara vertikal */
            gap: 60px;
        }}
        .navbar .nav-links .welcome-text {{
            color: #1D567E;
            font-size: 16px;
            font-weight: bold;
            margin: 0; /* Hilangkan margin default */
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
                <!-- Ganti teks "Home" dengan teks statis -->
                <span class="welcome-text">Selamat Datang di Aplikasi Prediksi Retensi Karyawan</span>
            </div>
            <a class="login-button" href="?page=Login">Login</a>
        </div>
        """,
        unsafe_allow_html=True,
    )

# Atur Navbar dengan kontrol sidebar
options = {
    "show_menu": False,
    "show_sidebar": False,  # Ubah ke True jika ingin menampilkan sidebar
}

# Atur Navbar dengan kontrol sidebar hanya untuk Home
if st.session_state.page == "Home":
    navbar_with_sidebar_control(
        pages=["Home", "Login"],
        options=options,
        logo_path=logo_path,
    )


# Deklarasi fungsi halaman
functions = {
    "Home": pg.show_home,  
    "Login": show_login,  # Panggil fungsi show_login dari root directory
    "admin": show_prediction,  # Pastikan fungsi ini diimpor dan didefinisikan
    "karyawan_form": show_karyawan_form,  # Pastikan fungsi ini diimpor dan didefinisikan
    "pimpinan_form": show_pimpinan_form,
    "exploration": show_exploration,
    "Prediksi": show_prediction,  # Tambahkan ini
    "report": show_report,       # Tambahkan ini
    "karyawan_komen": show_karyawan_komen,
    "pimpinan_exploration": show_pimpinan_exploration
}

query_params = st.query_params

# Validasi query parameter
if "page" not in st.session_state:
    query_params = st.query_params
    print("Query parameters (raw):", repr(query_params))  

    if "page" in query_params and query_params["page"].strip() in functions.keys():
        st.session_state.page = query_params["page"].strip()
    else:
        st.session_state.page = "Home"

print(f"Query parameters: {query_params}")
print(f"Session page: {st.session_state.page}")
print(f"Calling function for page: {st.session_state.page}")

if 'logged_in' in st.session_state and st.session_state['logged_in']:
    role = st.session_state.get('role', '').lower()
    role_pages = {
        'admin': show_prediction,
        'karyawan': show_karyawan_form,
        'pimpinan': show_pimpinan_form
    }
    go_to = role_pages.get(role)
    if go_to:
        print(f"Calling function for logged-in page: {st.session_state.page}")
        go_to()
else:
    go_to = functions.get(st.session_state.page)
    if go_to:
        print(f"Calling function for page: {st.session_state.page}")
        go_to()
    else:
        st.write("Halaman tidak ditemukan.")