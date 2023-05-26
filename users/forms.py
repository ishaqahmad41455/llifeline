

from django import forms
from .models import CustomUser
from django.contrib.auth.forms import AuthenticationForm

class RegistrationForm(forms.ModelForm):
    # password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'password']

        widgets = {
                'username': forms.TextInput(attrs={'class': 'form-control'}),
                'email': forms.EmailInput(attrs={'class': 'form-control'}),
                'password': forms.PasswordInput(attrs={'class': 'form-control'}),
            }
class LoginForm(AuthenticationForm):
    # You can customize the login form here if needed
    model = CustomUser
    fields = ['username', 'password']
    class Meta:
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control'}),
            'password': forms.PasswordInput(attrs={'class': 'form-control'}),
            
        }