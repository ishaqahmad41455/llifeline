# Create your views here.
from django.shortcuts import render, redirect
from .forms import RegistrationForm , LoginForm
from django.contrib.auth import login, authenticate


def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = RegistrationForm()
    return render(request, 'users/register.html', {'form': form})


def user_login(request):
    if request.method == 'POST':
        form = LoginForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('dashboard')
    else:
        form = LoginForm()
    return render(request, 'users/login.html', {'form': form})

def dashboard(request):
    return render(request, 'users/dashboard.html')

def logout(request):
    if request.user.is_authenticated:
        request.user.auth_token.delete()
    return redirect('login')
