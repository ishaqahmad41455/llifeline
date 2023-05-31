
from django.contrib.auth.models import User
from django import forms
from .models import CustomUser
from django.contrib.auth.forms import AuthenticationForm

class RegistrationFormNgo(forms.ModelForm):
    # password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ['username','first_name', 'last_name', 'email', 'password', 'phone', 'address']

        widgets = {
                'username': forms.TextInput(attrs={'class': 'form-control'}),
                'first_name': forms.TextInput(attrs={'class': 'form-control'}),
                'last_name': forms.TextInput(attrs={'class': 'form-control'}),
                'email': forms.EmailInput(attrs={'class': 'form-control'}),
                'password': forms.PasswordInput(attrs={'class': 'form-control'}),
                'phone': forms.TextInput(attrs={'class': 'form-control'}),
                'dob': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
                'address': forms.TextInput(attrs={'class': 'form-control'}),
            }

class RegistrationForm(forms.ModelForm):
    # password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ['username','first_name', 'last_name', 'email', 'password', 'phone', 'dob', 'gender', 'address']

        widgets = {
                'username': forms.TextInput(attrs={'class': 'form-control'}),
                'first_name': forms.TextInput(attrs={'class': 'form-control'}),
                'last_name': forms.TextInput(attrs={'class': 'form-control'}),
                'email': forms.EmailInput(attrs={'class': 'form-control'}),
                'password': forms.PasswordInput(attrs={'class': 'form-control'}),
                'phone': forms.TextInput(attrs={'class': 'form-control'}),
                'dob': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
                'gender': forms.Select(attrs={'class': 'form-control'},
                                          choices=[
                                              ('Male', 'Male'), 
                                              ('Female', 'Female'), 
                                              ('Other', 'Other')

                                          ]),
                'address': forms.TextInput(attrs={'class': 'form-control'}),
            }


class LoginForm(AuthenticationForm):
    username = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Username'}),
        max_length=150,
    )
    password = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'}),
        max_length=128,
    )
