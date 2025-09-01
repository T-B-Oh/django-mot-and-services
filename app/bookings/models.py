from django.db import models
from users.models import User
import shortuuid

# package model
class Package(models.Model):
    Package_CHOICES = (
        ('MOT', 'MOT'),
        ('Servicing', 'Servicing'),
        ('Offers', 'Offers'),
    )

    package_type = models.CharField(max_length=10, choices=Package_CHOICES, default='MOT')
    package_name = models.CharField(max_length=70, null=False)
    price = models.CharField(max_length=200, null=False)
    description = models.CharField(max_length=200, null=False)
    slug = models.SlugField(unique=True)

    def __str__(self):
        return f'{self.package_name}'

# stores vehicle details and links to multiple users via UserVehicle
class Vehicle(models.Model):
    owner = models.ManyToManyField(User, through='UserVehicle')
    make = models.CharField(max_length=70, null=False)
    model = models.CharField(max_length=200, null=False)
    reg = models.CharField(max_length=200, null=True)
    year = models.IntegerField(null=False)

    def __str__(self):
        return f'{self.reg}'
    
# intermediary model that defines the many-to-many relationship 
class UserVehicle(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.user.username} owns {self.vehicle}'
    
# a virtual vehicle Database (instead of using VES API from gov)
class VehicleDatabase(models.Model):
    reg = models.CharField(max_length=200, null=True)
    make = models.CharField(max_length=70, null=False)
    model = models.CharField(max_length=200, null=False)
    year = models.IntegerField(null=False)

    def __str__(self):
        return f'{self.id}'

# generate short unique booking ID
def short_uuid():
    return shortuuid.ShortUUID(alphabet="BCDFGHJKLMNPQRSTVWXYZ").random(length=5)

# stores booking information
class BookingDetail(models.Model):
    TIME_CHOICES = [
        ('09:00', '09:00 AM'),
        ('10:00', '10:00 AM'),
        ('11:00', '11:00 AM'),
        ('12:00', '12:00 PM'),
        ('13:00', '1:00 PM'),
        ('14:00', '2:00 PM'),
        ('15:00', '3:00 PM'),
        ('16:00', '4:00 PM'),
        ('17:00', '5:00 PM'),
    ]

    STATUS_CHOICES = [
        ('confirmed', 'Confirmed'),
        ('cancelled', 'Cancelled'),
        ('completed', 'Completed'),
    ]
    
    booking_id = models.CharField(max_length=5, unique=True, default=short_uuid, editable=False)
    owner = models.ForeignKey(User, on_delete = models.CASCADE)
    vehicle_id = models.ForeignKey(Vehicle, null=True, blank=True, on_delete = models.CASCADE)
    package_id = models.ForeignKey(Package, on_delete = models.CASCADE)
    # employee_id = models.ForeignKey(Employee, on_delete = models.CASCADE)
    # payment_id = models.ForeignKey(Payment, on_delete = models.CASCADE)
    booking_date = models.DateField()
    booking_time = models.CharField(max_length=5, choices=TIME_CHOICES)
    booking_status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='confirmed')

    def __str__(self):
        return f'{self.owner} - {self.booking_date} {self.booking_time}'
    
    