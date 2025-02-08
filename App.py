import os
import sys
import streamlit as st

st.set_page_config(page_title="TALENTRA", layout="wide", initial_sidebar_state="collapsed")

from pages.Form_Kepuasan import show_karyawan_form
from pages.Form_Penilaian import show_pimpinan_form
from pages.Prediksi import show_prediction
from pages.Laporan import show_report
from pages.Dashboard import show_exploration
from pages.Form_Keluhan import show_karyawan_komen
from pages.Dashboard_Pimpinan import show_pimpinan_exploration

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

import pages as pg

from pages.login import show_login  

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
    if not options.get("show_sidebar", True):  
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

    navbar_home()

def navbar_home():
    current_page = st.session_state.page  
    print("Navbar current page:", repr(current_page))
    if current_page == "Login":
        return
    
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
        font-weight: bold !important;
    }
    .navbar-right {
        margin-left: auto;
    }
    .stButton > button {
    background-color: #264CBE !important;
    color: white !important;
    border-radius: 10px !important;
    font-size: 10px !important; /* Membesarkan ukuran teks */\
    font-weight: bold !important; /* Mengatur ketebalan teks */
    font-type: 'Inter', sans-serif !important; /* Mengatur jenis font */
    padding: 10px 20px !important; /* Mengatur padding tombol */
    margin-top: 6px !important; /* Mengatur jarak atas */
    width: 100px !important; /* Opsional: Mengatur lebar tombol */
    height: 50px !important; /* Opsional: Mengatur tinggi tombol */
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
        if st.button("Login", key="login_button"):
            st.session_state["page"] = "Login"
            st.rerun()

    st.markdown("</div></div>", unsafe_allow_html=True)  # Menutup div navbar

options = {
    "show_menu": False,
    "show_sidebar": False,  
}

if st.session_state.page == "Home":
    navbar_with_sidebar_control(
        pages=["Home", "Login"],
        options=options,
        logo_path=logo_path,
    )

functions = {
    "Home": pg.show_home,  
    "Login": show_login,  
    "admin": show_prediction,  
    "karyawan_form": show_karyawan_form, 
    "pimpinan_form": show_pimpinan_form,
    "exploration": show_exploration,
    "Prediksi": show_prediction,  
    "report": show_report,       
    "karyawan_komen": show_karyawan_komen,
    "pimpinan_exploration": show_pimpinan_exploration
}

query_params = st.query_params

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