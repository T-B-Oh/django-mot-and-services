from rest_framework import serializers
from .models import VehicleDatabase

# Converts VehicleDatabase to JSON/dict for views
class VehicleDatabaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = VehicleDatabase
        fields = ['reg', 'make', 'model', 'year']