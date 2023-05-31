from django.urls import path
from . import views


urlpatterns = [
    path('register/', views.register, name='register'),
    path('register_doctor/', views.register_doctor, name='register_doctor'),
    path('register_ngo/', views.register_ngo, name='register_ngo'),
    path('login/', views.user_login, name='login'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('ngo_dashboard/', views.ngo_dashboard, name='ngo_dashboard'),
    path('doctor_dashboard/', views.doctor_dashboard, name='doctor_dashboard'),
    path('logout/', views.user_logout, name='logout'),
    path('inquiry_details/<int:id>/', views.inquiry_details, name='inquiry_details'),
    path('treatment_details/<int:id>/', views.treatment_details, name='treatment_details'),
]
