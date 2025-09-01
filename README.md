## MOT & Vehicle Service Booking App (Django)
### Project Overview

This is a Django-based booking system for vehicle MOT and vehicle services. Customers can book appointments for MOT or service, select available 1-hour time slots, and view in dashboard. Employees can view all bookings and change the booking status.


⚠️ Note: This project does not connect to any official government vehicle registration database. All vehicle information is stored manually in the project's local database for demonstration and testing purposes.

Please use following Registeration numbers:
(HH24BBB)
(SS16DDD)
(GG18NNN)
(KK25TST)
(TE10STT)
<br>Note: docker compose only

## Features

1. User Authentication
    - Customers and employees have separate dashboards.
    - Sign up, login, and logout.

2. Vehicle Registration
    - Users can search vehicles with:
        - Registration number (which is stored in database 5 vehicles for testing purpose)
    - Each vehicle can be linked to multiple owners.

3. Booking System
    - Bookings are for 1-hour time slots.
    - Users can choose a date, time, and service type (MOT or Service).
    - Already booked slots become unavailable.


#### Employee Dashboard Features

- View all bookings and Filter by today date
- Search by booking reference number 
- Mark bookings as completed and cancelled

## Usage
### Customer Dashboard
Sign Up, Log in, book MOT/services, view user dashboard, etc.

### Employee Dashboard
Access the dashboard at (http://127.0.0.1:8000/employee/dashboard/)
<br>Login credentials:
<br>Email: staff@example.com
<br>Password: staffstaff

## Tech Stack

- Backend: Django
- Frontend: HTML, CSS, JavaScript
- Database: PostgreSQL
- Containerization: Docker
- Admin Panel: Django Admin with Jazzmin

## Installation
### Local Setup
If you run the project locally without restoring local_backup database, it will start with a clean database. You must then populate all vehicle records, service packages and initial configurations through the admin panel for the app to work as intended.
#### Create Virtual Environment
```
python -m venv venv
. venv/Scripts/activate
```
#### Install Dependencies, migrate and runserver.
```
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
```
```
http://localhost:8000/
```
### Docker Compose Setup
To start with a pre-configured environment including cars, packages and a pre-existing superuser, use Docker Compose. This will restore the initial backup database (local_backup.sql) for you, allowing you to use the system right away without having to enter the data manually.
<br>Access the admin at (http://127.0.0.1:8000/admin/)
<br>Admin Login credentials::
<br>supersername: admin@example.com
<br>pw: admin

Use 'HOST': 'pg_container' in settings.py for Docker Compose, instead of 'localhost', to connect with PostgreSQL container.
```
'HOST': 'localhost'
to
'HOST': 'pg_container'
```
#### build and start containers
```
docker compose up -d
docker-compose exec web python manage.py migrate
```
```
http://127.0.0.1:8000/
```

## License
This project is licensed under the MIT License# django-mot-and-services
