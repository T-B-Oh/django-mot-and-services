from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import User, Profile
from django.core.exceptions import ValidationError

# user signup form
class SignUpForm(UserCreationForm):
    email = forms.EmailField(widget=forms.TextInput(attrs={'placeholder': "Enter Email", 'class':"a custom class"}))
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

# partial profile form in booking section
class PartialProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['first_name', 'last_name', 'contact']

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)  # Get logged-in user
        super(PartialProfileForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super().clean()
        first_name = cleaned_data.get('first_name')
        last_name = cleaned_data.get('last_name')
        contact = cleaned_data.get('contact')
        if not first_name or not last_name or not contact:
            raise forms.ValidationError("All fields are required.")
        return cleaned_data
    
# full profile form in dashboard
class FullProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['first_name', 'last_name', 'contact','address','city','postcode']
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'First Name'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Last Name'}),
            'contact': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Contact Number'}),
            'address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Address'}),
            'city': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'City'}),
            'postcode': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Postcode'}),
        }

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)  # Get logged-in user
        super(FullProfileForm, self).__init__(*args, **kwargs)
