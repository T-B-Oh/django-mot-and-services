from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name= 'home'),
    path('dashboard/', views.dashboard, name= 'dashboard'),
    path("mot/", views.mot, name="mot"),
    path("servicing/", views.servicing, name="servicing"),
    path("offers/", views.offer, name="offer"),
    path("bookingsuccess/", views.booking_success, name="booking_success"),
    # fetch available time slots
    path('available_time_slots/', views.available_time_slots, name='available_time_slots'),
    # Endpoint to handle package selection via JavaScript
    path('add_selection/', views.add_selection, name='add_selection'),

    path('checkout/', views.booking_form, name='booking_form'),
    path('fetch-vehicle/<vehicleReg>/', views.fetch_vehicle, name='fetch-vehicle'),
    path('fetch-vehicle-change/<vehicleReg>/', views.fetch_vehicle_change, name='fetch-vehicle-change'),
    path('prebooking/', views.vehicle_details_view, name='pre_checkout'),
    path('cancel-booking/<int:booking_id>/', views.cancel_booking, name='cancel-booking'),

    path('employee/update-status/<str:booking_id>/', views.update_booking_status, name='update_booking_status'),
]