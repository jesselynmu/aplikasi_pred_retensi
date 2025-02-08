import os

print("Current directory:", os.getcwd())
print("Files in pages directory:", os.listdir(os.path.dirname(__file__)))

from .home import show_home
from .Form_Kepuasan import show_karyawan_form
from .Form_Penilaian import show_pimpinan_form
from .Prediksi import show_prediction