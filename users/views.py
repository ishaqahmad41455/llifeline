# Create your views here.
from django.shortcuts import render, redirect

from home.models import Inquiries, Treatments, Referrals
from .forms import RegistrationForm , LoginForm, RegistrationFormNgo
from django.contrib.auth import login, authenticate, logout
from django.contrib import messages
from users.models import CustomUser
from django.contrib.auth.models import User
from datetime import datetime


def register_ngo(request):
    if request.method == 'POST':
        form = RegistrationFormNgo(request.POST)
        if form.is_valid():
            if CustomUser.objects.filter(email=form.cleaned_data.get('email')).exists() or CustomUser.objects.filter(username=form.cleaned_data.get('username') ).exists():
                messages.info(request, 'Email or username already exists')
                return render (request ,'users/register.html',{'form':form,'page':'ngo'})
            user = form.save(commit=False)
            password = form.cleaned_data.get('password')
            
            user.username = form.cleaned_data.get('username')
            user.email = form.cleaned_data.get('email')
            user.is_ngo = True
            user.is_approved = False
            user.set_password(password)
            user.save()
            login(request, user)
            messages.success(request, 'Account created successfully')
            messages.success(request, 'Logged In successfully')
            return redirect('index')
        else:
            messages.warning(request, 'Username or email already exists')
            return render(request, 'users/register.html', {'form': form,'page':'ngo'})
            
    else:    
        if request.user.is_authenticated:
            messages.info(request ,"Already LoggedIn")
            return redirect('index')
        form = RegistrationFormNgo()
        return render(request, 'users/register.html', {'form': form,'page':'ngo'})
def register_doctor(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            if CustomUser.objects.filter(email=form.cleaned_data.get('email')).exists() or CustomUser.objects.filter(username=form.cleaned_data.get('username') ).exists():
                messages.info(request, 'Email or username already exists')
                return render (request ,'users/register',{'form':form,'page':'doctor'})
            user = form.save(commit=False)
            password = form.cleaned_data.get('password')
            dob = form.cleaned_data.get('dob')
            current_date = datetime.now().date()
            
            if isinstance(dob, str):
                dob = datetime.strptime(dob, '%Y-%m-%d')
            age = current_date.year - dob.year
            if current_date.month < dob.month or (current_date.month == dob.month and current_date.day < dob.day):
                age = age - 1
            user.username = form.cleaned_data.get('username')
            user.email = form.cleaned_data.get('email')
            user.is_doctor = True
            user.is_approved = False
            user.age = age
            user.set_password(password)
            user.save()
            login(request, user)
            messages.success(request, 'Account created successfully')
            messages.success(request, 'Logged In successfully')
            return redirect('index')
        else:
            messages.warning(request, 'Username or email already exists')
            return render(request, 'users/register.html', {'form': form,'page':'doctor'})
            
    else:    
        if request.user.is_authenticated:
            messages.info(request ,"Already LoggedIn")
            return redirect('index')
        form = RegistrationForm()
        return render(request, 'users/register.html', {'form': form,'page':'doctor'})

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            if CustomUser.objects.filter(email=form.cleaned_data.get('email')).exists() or CustomUser.objects.filter(username=form.cleaned_data.get('username') ).exists():
                messages.info(request, 'Email or username already exists')
                return render (request ,'users/register.html',{'form':form})
            user = form.save(commit=False)
            password = form.cleaned_data.get('password')
            dob = form.cleaned_data.get('dob')
            current_date = datetime.now().date()
            if isinstance(dob, str):
                dob = datetime.strptime(dob, '%Y-%m-%d')
            age = current_date.year - dob.year
            if current_date.month < dob.month or (current_date.month == dob.month and current_date.day < dob.day):
                age = age - 1
            user.username = form.cleaned_data.get('username')
            user.email = form.cleaned_data.get('email')
            user.age = age
            user.set_password(password)
            user.save()
            login(request, user)
            messages.success(request, 'Account created successfully')
            messages.success(request, 'Logged In successfully')
            return redirect('index')
        else:
            messages.warning(request, 'Username or email already exists')
            return render(request, 'users/register.html', {'form': form})
            
    else:    
        if request.user.is_authenticated:
            messages.info(request ,"Already LoggedIn")
            return redirect('index')
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
                messages.success(request, 'Logged in successfully')
                if user.is_ngo:
                    return redirect('ngo_dashboard')
                elif user.is_doctor:
                    return redirect('doctor_dashboard')
                else:
                    return redirect('dashboard')
    else:
        form = LoginForm()
    if request.user.is_authenticated:
        messages.info(request,"Already LoggedIn")
        return redirect('index')
    return render(request, 'users/login.html', {'form': form})

def dashboard(request):
    if not request.user.is_authenticated:
        messages.info(request, 'Please login to access dashboard')
        return redirect('login')
    user = request.user;
    if request.user.is_ngo:
        return redirect('ngo_dashboard')
    elif request.user.is_doctor:
        return redirect('doctor_dashboard')
    
    inquiries = Inquiries.objects.filter(user=user)
    treatments = Treatments.objects.filter(patient=user)
    context = {
        'inquiries':inquiries,
        'user':user,
        'treatments':treatments
    }
    return render(request, 'users/dashboard.html',context)

def inquiry_details(request, id):
    if not request.user.is_authenticated:
        messages.info(request, 'Please login to access Inquiriers')
        return redirect('login')
    user = request.user;
    inquiry = Inquiries.objects.get(id=id)
    if  user == inquiry.user or user.is_ngo or user.is_doctor: 
        return render(request, 'users/inquiry_details.html',{'inquiry':inquiry})
    else:
        messages.info(request, 'You are not authorized to view this Inquiry')
        return redirect('dashboard')

def treatment_details(request, id):
    if not request.user.is_authenticated:
        messages.info(request, 'Please login to access Treatments')
        return redirect('login')
    user = request.user;
    treatment  = Treatments.objects.get(id=id)
    if  user == treatment.patient or user.is_ngo or user.is_doctor: 
        return render(request, 'users/treatment_details.html',{'treatment':treatment})
    else:
        messages.info(request, 'You are not authorized to view this Inquiry')
        return redirect('dashboard')
   
def ngo_dashboard(request):
    if not request.user.is_authenticated:
        messages.info(request, 'Please login to access dashboard')
        return redirect('login')
    user = request.user;
    if request.user.is_doctor:
        return redirect('doctor_dashboard')
    elif not request.user.is_ngo:
        return redirect('dashboard')
    refferals  = Referrals.objects.filter(ngos=user,is_attended=True)
    attended_inquiries = [refferal.inquiry for refferal in refferals]
    new_referrals = Referrals.objects.filter(ngos=user,is_attended=False)
    new_referrals = [refferal.inquiry for refferal in new_referrals]
    
    context = {
        'attended_inquiries':attended_inquiries,
        'new_referrals':new_referrals,
        'user':user
    }
    return render(request, 'users/ngo_dashboard.html',context)
def doctor_dashboard(request):
    
    if request.method== 'POST':
        suggestion = request.POST.get('suggest')
        meds = request.POST.get('meds')
        patient = CustomUser.objects.get(id=request.POST.get('patient'))
        treatment = Treatments.create(doctor = request.user, patient = patient ,suggestion=suggestion,meds=meds)
        treatment.save()
        messages.success(request, 'Treatment Sent successfully')
        return redirect('doctor_dashboard')
    if not request.user.is_authenticated:
        messages.info(request, 'Please login to access dashboard')
        return redirect('login')
    user = request.user;
    if request.user.is_ngo:
        return redirect('ngo_dashboard')
    elif not request.user.is_doctor:
        return redirect('dashboard')
    un_attended_inquiries = Inquiries.objects.filter(is_attended=False)
    attended_inquiries = Treatments.objects.filter(doctor = request.user)
    
    context = {
        'un_attended_inquiries':un_attended_inquiries,
        'attended_inquiries':attended_inquiries,
        'user':user
    }
    return render(request, 'users/doctor_dashboard.html',context)



def user_logout(request):
    if request.user.is_authenticated:
        logout(request)
        messages.info(request, 'Logged out successfully')
        return redirect('index')
    return redirect('login')

