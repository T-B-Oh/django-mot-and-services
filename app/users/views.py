from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate
from .forms import SignUpForm
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test
from bookings.models import BookingDetail
from datetime import date
from django.shortcuts import render, redirect

# ---- user section ----

# user sign up
def sign_up(request):
    if request.user.is_authenticated:
        return redirect('/dashboard')
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password1')
            user = authenticate(request, email=email, password=password)
            if user is not None:
                login(request, user)
                # Conditional redirect based on session data
                if request.session.get('package_data'):
                    return redirect('/checkout')
                if request.session.get('vehicle_data'):
                    return redirect('/prebooking')
                return redirect('/')
        else:
            # Check specific errors
            if "email" in form.errors:
                messages.error(request, "This email is already registered.")
            elif "password2" in form.errors and "password_mismatch" in form.errors["password2"].as_data()[0].code:
                messages.error(request, "Passwords do not match.")
            else:
                messages.error(request, "Please correct the highlighted errors.")
    else:
        form = SignUpForm()
    return render(request, 'booking/signup.html', {'form': form})

# user log in
def log_in(request):
    if request.user.is_authenticated:
        return redirect('/dashboard')
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = authenticate(request, email=email, password=password)
        if user is not None:
                login(request, user)
                # Conditional redirect based on session data
                if request.session.get('package_data'):
                    return redirect('/checkout')
                if request.session.get('vehicle_data'):
                    return redirect('/prebooking')
                return redirect('/dashboard')
        else:
            messages.error(request, "User or Password does not exist")
            return redirect('/users/login')
    return render(request, 'booking/login.html')

def log_out(request):
    logout(request)
    messages.success(request, "Logged out")
    return redirect('/users/login')




# ---- Employee section ----

# Employee login
def employee_login(request):
    error = None
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = authenticate(request, email=email, password=password)
        if user is not None and user.is_staff:
            login(request, user)
            return redirect('employee_dashboard')
        else:
            error = "Not authorized."
            return render(request, 'employee/em_login.html', {'error': error})
    return render(request, 'employee/em_login.html', {'error': error})


def employee_logout(request):
    logout(request)
    return redirect("employee_login")

# Staff check decorator
def is_employee(user):
    return user.is_staff


# Employee dashboard
@user_passes_test(is_employee, login_url='employee_login')
def employee_dashboard(request):
    filter_option = request.GET.get("filter", "today")  # default today
    search_ref = request.GET.get("search", "").strip()

    # searching by booking reference
    if search_ref:
        bookings = BookingDetail.objects.filter(booking_id__icontains=search_ref).order_by("booking_date", "booking_time")
    else:
        # all bookings
        bookings = BookingDetail.objects.filter(booking_status='confirmed').order_by("booking_date", "booking_time")
        # today bookings
        if filter_option == "today":
            bookings = bookings.filter(booking_date=date.today())

    return render(request, "employee/em_dashboard.html", {
        "bookings": bookings,
        "filter_option": filter_option,
        "search_ref": search_ref,
        "status_choices": BookingDetail.STATUS_CHOICES
    })