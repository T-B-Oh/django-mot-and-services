from django import forms
from .models import BookingDetail, Vehicle, UserVehicle
from users.models import User, Profile
from django.core.exceptions import ValidationError


class BookingForm(forms.ModelForm):
    class Meta:
        model = BookingDetail
        fields = ['owner', 'vehicle_id', 'package_id', 'booking_date', 'booking_time']

        widgets = {
            'booking_date': forms.DateInput(attrs={'type': 'date'}), # date picker
        }

# register a new vehicle for the current user
class VehicleForm(forms.ModelForm):
    make = forms.CharField(widget=forms.TextInput(attrs={'placeholder': "Enter make", 'class':"a custom class"}))
    class Meta:
        model = Vehicle
        fields = ['owner', 'make', 'model', 'reg', 'year']

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)  # Get logged-in user
        super(VehicleForm, self).__init__(*args, **kwargs)

    def clean_reg(self):
        reg_item = self.cleaned_data.get('reg')
        # prevent same user from registering same vehicle twice
        if Vehicle.objects.filter(reg=reg_item, owner=self.user).exists():
            raise ValidationError('This Vehicle is already registered. Please select your vehicle.')
        return reg_item
    