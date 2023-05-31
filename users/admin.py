from django.contrib import admin
from .models import CustomUser
# Register your models here.

class CustomUserAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'email', 'is_staff')
    list_display_links = ('id', 'username')
    search_fields = ('username', 'email')
    list_per_page = 25
    list_editable = ('is_staff',)
    list_filter = ('is_staff',)

    def __str__(self):
        return self.username

admin.site.register(CustomUser, CustomUserAdmin)