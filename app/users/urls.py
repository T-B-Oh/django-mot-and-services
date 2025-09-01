from django.urls import path
from . import views

urlpatterns = [
    path('users/login/', views.log_in, name='log_in'),
    path('users/signup/', views.sign_up, name='sign_up'),
    path('users/logout/', views.log_out, name='log_out'),

    path('employee/login/', views.employee_login, name='employee_login'),
    path('employee/logout/', views.employee_logout, name='employee_logout'),
    path('employee/dashboard/', views.employee_dashboard, name='employee_dashboard'),
]