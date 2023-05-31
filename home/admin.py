from django.contrib import admin
from home.models import Contact, Inquiries, Treatments,Referrals


class ContactAdmin(admin.ModelAdmin):
    list_display = ('id','name', 'email', 'phone', 'message', 'date')
    list_filter = ('name', 'email', 'phone', 'message', 'date')
    search_fields = ('name', 'email', 'phone', 'message', 'date')
    list_display_links = ('id','name',)

class InquiriesAdmin(admin.ModelAdmin):
    list_display = ('id','user', 'name', 'email', 'phone', 'message')
    list_filter = ('user', 'name', 'email', 'phone', 'message')
    search_fields = ('user', 'name', 'email', 'phone', 'message')
    list_display_links = ('id','user',)

class TreatmentsAdmin(admin.ModelAdmin):
    list_display = ('id','patient', 'doctor', 'date', 'suggestions', 'meds')
    list_filter = ('patient', 'doctor', 'date', 'suggestions', 'meds')
    search_fields = ('patient', 'doctor', 'date', 'suggestions', 'meds')
    list_display_links = ('id','patient',)



class ReferralsAdmin(admin.ModelAdmin):
    list_display = ('id','inquiry','patient', 'doctor', 'date', )
    list_display_links = ('id','inquiry',)
    search_fields = ('inquiry','ngos',)


admin.site.register(Referrals,ReferralsAdmin)
admin.site.register(Treatments,TreatmentsAdmin)
admin.site.register(Contact, ContactAdmin)
admin.site.register(Inquiries, InquiriesAdmin)