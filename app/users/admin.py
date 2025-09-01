from django.contrib import admin
from .models import User, Profile


class UserAdmin(admin.ModelAdmin):
    search_fields = ['username', 'email']
    list_display = ['username', 'email']

class ProfileAdmin(admin.ModelAdmin):
    search_fields = ['user', 'first_name', 'last_name']
    list_display = ['user', 'first_name', 'last_name']

admin.site.register(User, UserAdmin)
admin.site.register(Profile, ProfileAdmin)
 