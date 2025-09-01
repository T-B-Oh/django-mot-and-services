from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save


class User(AbstractUser):
    username = models.CharField(max_length=100, null=True, blank=True, unique=True)
    email = models.EmailField(unique=True)
    # use email instead of username in Log_in page
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    def __str__(self):
        return f"{self.id}"
    
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100, null=True, blank=False)
    last_name = models.CharField(max_length=100, null=True, blank=False)
    contact = models.CharField(max_length=100, null=True, blank=False)
    address = models.CharField(max_length=500, null=False, blank=True)
    city = models.CharField(max_length=100, null=False, blank=True)
    postcode = models.CharField(max_length=10, null=False, blank=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user}"
    

# signal functions    
# Create Profile when User is created
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

# Save Profile when User is saved
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()

# Connect signals to User model
post_save.connect(create_user_profile, sender=User)
post_save.connect(save_user_profile, sender=User)

