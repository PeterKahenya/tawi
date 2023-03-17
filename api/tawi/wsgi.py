import os
import pathlib
import dotenv

BASE_DIR = pathlib.Path(__file__).resolve().parent.parent

print(BASE_DIR)

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'tawi.settings')

application = get_wsgi_application()
