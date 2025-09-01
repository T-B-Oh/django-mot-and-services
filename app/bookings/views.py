from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import BookingDetail, Package, Vehicle
from bookings.models import Vehicle, VehicleDatabase
from django.utils.timezone import now, timedelta
from django.utils import timezone
from .forms import BookingForm, VehicleForm
from users.forms import PartialProfileForm, FullProfileForm
from datetime import datetime
from django.http import JsonResponse
from .serializers import VehicleDatabaseSerializer
from django.db.models import Q
from django.views.decorators.http import require_http_methods

# home page
def home(request):
    vehicle_data = VehicleDatabase.objects.all()
    context = {'vehicle_data': vehicle_data}
    return render(request, 'booking/index.html', context)

# mot page section
def mot(request):
    offer = Package.objects.filter(package_type='Offers') # get offer packages
    data = Package.objects.filter(package_type='MOT') # get MOT packages
    mot_id = data.values_list('id', flat=True).first() # pass MOT ID to template
    context = {'offer': offer,
               'mot_id': mot_id}
    return render(request, "booking/mot.html", context)

# Servicing page
def servicing(request):
    basic = Package.objects.filter(package_type='Servicing', slug='basicservice').values_list('id', flat=True).first()
    interim = Package.objects.filter(package_type='Servicing', slug='interimservice').values_list('id', flat=True).first()
    full = Package.objects.filter(package_type='Servicing', slug='fullservice').values_list('id', flat=True).first()
    context = {
                'basic': basic,
                'interim': interim,
                'full': full
               }
    return render(request, "booking/servicing.html", context)

# offer page
def offer(request):
    data = Package.objects.filter(package_type='Offers')
    context = {'data': data}
    return render(request, "booking/offers.html", context)


def booking_success(request):
    data = BookingDetail.objects.filter(owner=request.user).order_by('-id').first()
    context = {'data': data}
    return render(request, 'booking/booking_success.html', context)



# List of all booking time slots
AVAILABLE_SLOTS = [
    '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00' , '17:00'
]

# Get available time slots
def available_time_slots(request):
    selected_date = request.GET.get('date')  # Get the date from the request
    try:
        selected_date = datetime.strptime(selected_date, '%Y-%m-%d').date()
    except ValueError:
        return JsonResponse({'error': 'Invalid date format'}, status=400)
    # Get booked time slots for the selected date
    booked_time_slots = BookingDetail.objects.filter(booking_date=selected_date).values_list('booking_time', flat=True)
    # Filter out booked time slots
    available_time_slots = [slot for slot in AVAILABLE_SLOTS if slot not in booked_time_slots]
    return JsonResponse({'available_slots': available_time_slots})

# store selected package ID in session
def add_selection(request):
    package_data = {
        "id": request.GET['id']
    }
    request.session['package_data'] = package_data
    return JsonResponse(package_data)


# fetch vehicle from home page
def fetch_vehicle(request, vehicleReg):
    try:
        vehicle_data = VehicleDatabase.objects.get(reg=vehicleReg)
        request.session['vehicle_data'] = VehicleDatabaseSerializer(vehicle_data).data  # Store in session
        return redirect('pre_checkout')  # Redirect to pre checkout page
    except VehicleDatabase.DoesNotExist:
        return JsonResponse({"error": "Vehicle not found"}, status=404)
    
# fetch vehicle from checkout page (change vehicle)
def fetch_vehicle_change(request, vehicleReg):
    try:
        vehicle_data = VehicleDatabase.objects.get(reg=vehicleReg)
        request.session['vehicle_data'] = VehicleDatabaseSerializer(vehicle_data).data  # Store in session
        return redirect('booking_form')  # Redirect to checkout page
    except VehicleDatabase.DoesNotExist:
        return JsonResponse({"error": "Vehicle not found"}, status=404)
    
# pre-booking session    
def vehicle_details_view(request):
    vehicle_data = request.session.get('vehicle_data', None)
    all_packages = Package.objects.all()
    context = {'vehicle_data': vehicle_data,
               'all_packages': all_packages}
    if not vehicle_data:
        return redirect('/')
    return render(request, "booking/pre_checkout.html", context)

# checkout section
@login_required 
def booking_form(request):

    profile = request.user.profile
    vehicles = Vehicle.objects.filter(owner=request.user)
    all_packages = Package.objects.all()
    # Get selected package ID from session set by add_selection
    selected_package_id = request.session.get('package_data')   
    # Get Package object for selected ID
    current_package = Package.objects.filter(id=selected_package_id['id'])
    # Set tomorrow's date to prevent backdate bookings
    tomorrow_date = (now().date() + timedelta(days=1)).isoformat() 
    # current vehicle session data
    vehicle_data = request.session.get('vehicle_data', {})
    reg, make, model, year = (
        vehicle_data.get('reg'),
        vehicle_data.get('make'),
        vehicle_data.get('model'),
        vehicle_data.get('year'),
    )

    get_id = Vehicle.objects.filter(reg=reg, owner=request.user).values_list('id', flat=True).distinct().first()

    vehicle_form = VehicleForm()
    booking_form = BookingForm()
    partial_profile_form = PartialProfileForm()

    for v in current_package:
        float_price = float(v.price)
        vat = float_price * 0.2
        before_vat = float_price * 0.8

    context = {
        'booking_form': booking_form,
        'vehicle_form': vehicle_form,
        'tomorrow_date': tomorrow_date,
        'profile': profile,
        'vehicles': vehicles,
        'selected_package_id': selected_package_id,
        'current_package': current_package,
        'all_packages': all_packages,
        'get_id': get_id,
        'reg': reg,
        'make': make,
        'model': model,
        'year': year,
        'show_second_form': False,
        'show_vehicle_form':True,
        'show_profile_form':False,
        'vat': vat,
        'before_vat': before_vat
    }

    if request.method == "POST":
        booking_form = BookingForm(request.POST)
        vehicle_form = VehicleForm(request.POST, user=request.user)
        partial_profile_form = PartialProfileForm(request.POST, instance=profile)

        # Handle vehicle form submission
        if 'vehicle_submit' in request.POST:
            if vehicle_form.is_valid():
                vehicle_form.save()
                get_id = Vehicle.objects.filter(reg=reg, owner=request.user).values_list('id', flat=True).first()
                context["get_id"] = get_id
            # Always go to profile form after vehicle submit
            context.update(show_vehicle_form=False, show_second_form=False, show_profile_form=True)
            return render(request, 'booking/checkout.html', context)

        # Handle profile form submission
        if 'profile_submit' in request.POST and partial_profile_form.is_valid():
            partial_profile_form.save()
            context.update(show_profile_form=False, show_vehicle_form=False, show_second_form=True)
            return render(request, 'booking/checkout.html', context)

        # handle booking form submission
        if 'booking_submit' in request.POST and booking_form.is_valid():
            booking_form.save()
            return redirect('booking_success')
    return render(request, 'booking/checkout.html', context)

# user dashboard
@login_required
def dashboard(request):
    today = timezone.localdate()

    previous = BookingDetail.objects.filter(Q(booking_status='completed') | Q(booking_status='confirmed', booking_date__lt=today),
        owner=request.user).order_by('-booking_date')
    upcoming = BookingDetail.objects.filter(owner=request.user, 
            booking_status='confirmed', booking_date__gte=today).order_by('booking_date')
    cancelled = BookingDetail.objects.filter(owner=request.user, 
            booking_status='cancelled').order_by('-booking_date')
    
    # profile section
    profile = request.user.profile
    if request.method == 'POST' and 'profile_submit' in request.POST:
        profile_form = FullProfileForm(request.POST, instance=profile)
        if profile_form.is_valid():
            profile_form.save()
    else:
        profile_form = FullProfileForm(instance=profile)

    context = {'upcoming': upcoming,
               'previous': previous,
               'cancelled': cancelled,
               'profile_form': profile_form}
    return render(request, "booking/dashboard.html", context)

# cancel booking
@login_required
def cancel_booking(request, booking_id):
    booking = get_object_or_404(BookingDetail, id=booking_id, owner=request.user)
    
    if request.method == 'POST':
        booking.booking_status = 'cancelled'
        booking.save()
        return redirect('dashboard')
    return redirect('dashboard')


# ------ Employee Section ----------

# Staff check decorator
def is_employee(user):
    return user.is_staff

# Update booking status
@user_passes_test(is_employee)
def update_booking_status(request, booking_id):
    booking = get_object_or_404(BookingDetail, booking_id=booking_id)
    if request.method == "POST":
        new_status = request.POST.get("status")
        if new_status in dict(BookingDetail.STATUS_CHOICES).keys():
            booking.booking_status = new_status
            booking.save()
    return redirect('employee_dashboard')