from django.contrib import admin
from .models import Vehicle, Package, BookingDetail, VehicleDatabase, UserVehicle

class BookingAdmin(admin.ModelAdmin):
    list_display = ['booking_id','get_name', 'get_vehicle', 'booking_date', 'booking_time']

    def get_name(self, obj):
        return obj.owner.username
    get_name.admin_order_field = 'owner'
    get_name.short_description = 'User Name'

    def get_vehicle(self, obj):
        return obj.vehicle_id.reg
    get_vehicle.admin_order_field = 'vehicle_id'
    get_vehicle.short_description = 'Vehicle Reg'


class VehicleAdmin(admin.ModelAdmin):
    list_display = ['get_reg', 'make', 'model']

    def get_reg(self, obj):
        return obj.reg
    get_reg.admin_order_field = 'vehicle_id'
    get_reg.short_description = 'Vehicle Reg'


admin.site.register(Vehicle, VehicleAdmin)
admin.site.register(Package)
admin.site.register(BookingDetail, BookingAdmin)
admin.site.register(VehicleDatabase)
admin.site.register(UserVehicle)