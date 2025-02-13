import streamlit as st
import os
import base64

def show_home():
    # Atur layout halaman
    st.markdown(
        """
        <style>
        /* Hapus padding dan margin default Streamlit */
        .stApp {
            padding: 0 !important;
            margin: 0 !important;
            max-width: 100% !important;
        }

        /* Hapus padding dan margin dari semua elemen */
        .center-content, .about-section, .content-section, .news-section, .footer {
            padding: 0 !important;
            margin: 0 !important;
            max-width: 100% !important;
        }

        /* Atur layout utama */
        .center-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        .text-content {
            font-family: 'Inter', sans-serif;
            font-size: 40px;
            font-weight: bold;
            color: #333333;
            flex: 1;
        }

        .text-content h1 {
            color: #264CBE;  /* Warna biru */
            font-size: 70px; /* Ukuran teks */
        }

        .image-content {
            flex: 1;
            text-align: right;
        }

        .image-content img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        /* Tentang Aplikasi */
        .about-section {
            background-color: #FFFFFF;
            padding: 30px !important;
            border-radius: 15px;
            margin-top: 50px !important;
            margin-bottom: 50px !important;
            font-family: 'Inter', sans-serif;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .about-section::before {
            content: '';
            position: absolute;
            left: 0;
            width: 100%;
            height: 10px;
            background-color: #BBE2F2;
            border-radius: 20px;
            top: 25px;
        }

        /* Bagian Aplikasi */
        .content-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            width: 100%;
            margin: 0 !important;
            padding: 0 !important;
            margin-bottom: 50px; /* Tambahkan margin-bottom untuk memberikan jarak */
            /* position: relative; */
        }

        .content-section::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -40px;
            width: 100%;
            height: 10px;
            background-color: #BBE2F2;
            border-radius: 20px;
        }

        .content-section .text-content {
            flex: 1;
            font-family: 'Inter', sans-serif;
            font-size: 16px;
            color: #555555;
            line-height: 1.6;
            text-align: left;
        }

        .content-section .image-content img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .about-section h2,
        .content-section h2 {
            font-family: 'Inter', sans-serif; /* Gunakan font Inter */
            font-size: 28px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 20px;
        }
        .about-section p,
        .content-section .text-content p {
            font-family: 'Inter', sans-serif; /* Gunakan font Inter */
            font-size: 16px;
            color: #555555;
            line-height: 1.6;
        }

        /* Judul Bagian Aplikasi */
        .section-title {
            text-align: center;
            font-family: 'Inter', sans-serif;
            font-size: 28px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 20px;
        }

        /* Berita dan Informasi */
        .news-section {
            text-align: center;
            font-family: 'Inter', sans-serif;
            margin-top: 50px !important;
        }

        .news-title {
            font-size: 30px !important;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333333;
        }

        .news-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            width: 100%;
            margin: 0 auto;
        }

        .news-grid img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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

        .source {
                    font-style: italic; /* Italic */
                    font-weight: 300; /* Light font */
                    font-size: 12px; /* Ukuran lebih kecil */
                    color: #666; /* Warna abu-abu agar lebih soft */
                    margin-top: 5px;
                    text-align: center; /* Agar sejajar dengan gambar */
                }
        </style>
        """,
        unsafe_allow_html=True
    )

    # Path ke gambar
    parent_dir = os.path.dirname(os.path.abspath(__file__))
    image_path = os.path.join(parent_dir, "../asset/main_img.png")

    # Render konten utama
    st.markdown(
        f"""
        <div class="center-content">
            <div class="text-content">
                <h1>TALENTRA</h1>
                <p><strong>Aplikasi Prediksi Retensi Karyawan</strong></p>
            </div>
            <div class="image-content">
                <img src="data:image/png;base64,{get_image_as_base64(image_path)}" alt="Gambar Retensi Karyawan">
                <p class="source">Sumber: freepik.com</p>
            </div>
        </div>
        """,
        unsafe_allow_html=True
    )

    # Tentang Aplikasi
    st.markdown(
        """
        <div class="about-section">
            <h2>Tentang Aplikasi</h2>
            <p>
                Aplikasi ini dirancang untuk memprediksi retensi karyawan dengan memanfaatkan analisis data dan pembelajaran mesin. 
                Dikembangkan sebagai Tugas Akhir guna memperoleh gelar Sarjana Komputer di Universitas Pembangunan Nasional Veteran Jakarta (UPNVJ), 
                aplikasi ini bertujuan membantu perusahaan dalam mengidentifikasi dan mempertahankan karyawan berkualitas👩🏻‍🎓.
            </p>
        </div>
        """,
        unsafe_allow_html=True
    )

    # Bagian Aplikasi
    image_path_2 = os.path.join(parent_dir, "../asset/sitemap.png")
    st.markdown(
        f"""
        <div class="content-section">
            <div class="image-content">
                <img src="data:image/png;base64,{get_image_as_base64(image_path_2)}" alt="Gambar Konten">
            </div>
            <div class="text-content">
                <h2 class="section-title">Bagian Aplikasi</h2>
                <p style="text-align: justify;">
                    Aplikasi ini dirancang untuk mendukung prediksi retensi karyawan dan pengelolaan data 
                    dengan fitur-fitur yang terstruktur berdasarkan peran pengguna. 
                    Dimulai dari Halaman Utama, pengguna diarahkan ke Halaman Login, 
                    yang kemudian membagi akses berdasarkan peran: Admin, Karyawan, dan Pimpinan. 
                    Akses berdasarkan peran:
                    Admin: Halaman Prediksi, Dashboard, dan Laporan.
                    Karyawan: Form Kepuasan Kerja dan Form Komplain.
                    Pimpinan: Form Penilaian dan Halaman Dashboard.
                    Aplikasi ini dirancang untuk mempermudah pengelolaan dan pengambilan keputusan berbasis data.
                </p>
            </div>
        </div>
        """,
        unsafe_allow_html=True
    )

    st.markdown(
        f"""
        <div class="news-section">
            <p class="news-title">Berita dan Informasi</p>
            <div class="news-grid">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news1.png'))}" alt="Berita 1">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news2.png'))}" alt="Berita 2">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news3.png'))}" alt="Berita 3">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news4.png'))}" alt="Berita 4">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news5.png'))}" alt="Berita 5">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news6.png'))}" alt="Berita 6">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news7.png'))}" alt="Berita 7">
                <img src="data:image/png;base64,{get_image_as_base64(os.path.join(parent_dir, '../asset/news8.png'))}" alt="Berita 8">
            </div>
        </div>
        """,
        unsafe_allow_html=True
    )

    st.markdown(
        """
        <div class="footer">
            <p><strong>2025 © Jesselyn Mu</strong></p>
            <p>Untuk informasi lebih lanjut, dapat mengirim email ke mujesselyn@gmail.com</p>
        </div>
        """,
        unsafe_allow_html=True
    )

def get_image_as_base64(image_path):
    import base64
    with open(image_path, "rb") as img_file:
        return base64.b64encode(img_file.read()).decode("utf-8")

if __name__ == "__main__":
    show_home()