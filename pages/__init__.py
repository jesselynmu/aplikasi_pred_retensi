import os

print("Current directory:", os.getcwd())
print("Files in pages directory:", os.listdir(os.path.dirname(__file__)))

from .home import show_home
from .karyawan_form import show_karyawan_form
from .pimpinan_form import show_pimpinan_form
from .prediction import show_prediction