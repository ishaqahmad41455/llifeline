from django.db import models
from users.models import CustomUser
# Create your models here.


class Contact(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=122)
    email = models.CharField(max_length=122)
    phone = models.CharField(max_length=50, blank=True,null=True)
    message = models.TextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name


class Inquiries(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE,blank=True,null=True)
    name = models.CharField(max_length=122)
    email = models.CharField(max_length=122)
    phone = models.CharField(max_length=50, blank=True,null=True)
    message = models.TextField(blank=True, null=True)
    symptoms = models.TextField(blank=True, null=True)
    dob = models.DateField(null=True, blank=True)
    age = models.IntegerField(null=True, blank=True)
    gender = models.CharField(max_length=122)
    address = models.CharField(max_length=122)
    date = models.DateField(auto_now_add=True)
    is_attended = models.BooleanField(default=False)
    def __str__(self):
        return self.user.username

class Treatments(models.Model):
    id = models.AutoField(primary_key=True)
    inquiry = models.ForeignKey(Inquiries, on_delete=models.CASCADE,blank=True,null=True)
    patient = models.ForeignKey(CustomUser, on_delete=models.CASCADE,blank=True,null=True,related_name='patient')
    doctor = models.ForeignKey(CustomUser, on_delete=models.CASCADE,blank=True,null=True,related_name='doctor')
    date = models.DateField(auto_now_add=True)
    time = models.TimeField(auto_now_add=True)
    suggestions = models.TextField(blank=True, null=True)
    meds = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.doctor.username + " " + self.patient.username
    
class Referrals(models.Model):
    id = models.AutoField(primary_key=True)
    inquiry = models.ForeignKey(Inquiries, on_delete=models.CASCADE,blank=True,null=True)
    patient = models.ForeignKey(CustomUser, on_delete=models.CASCADE,blank=True,null=True,related_name='patient_referral')
    doctor = models.ForeignKey(CustomUser, on_delete=models.CASCADE,blank=True,null=True,related_name='doctor_referral')
    ngos = models.ManyToManyField(CustomUser, blank=True,related_name='ngo_referral')
    date = models.DateField(auto_now_add=True)
    time = models.TimeField(auto_now_add=True)
    is_attended = models.BooleanField(default=False)
    

    def __str__(self):
        return self.patient.username + " " +  self.doctor.username