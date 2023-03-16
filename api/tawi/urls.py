from django.contrib import admin
from django.urls import path
from django.http import HttpResponse
from django.conf.urls.static import static
from django.conf import settings

def api(request):
    return HttpResponse("API Call Success!")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', api),
]
