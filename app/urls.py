from . import views
from django.urls import path


urlpatterns = [
    path('index/', views.index, name="index"),
    path('register/', views.register, name='register'),
    path('login/', views.login, name='login')
]
