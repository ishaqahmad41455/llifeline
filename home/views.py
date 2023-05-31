from django.shortcuts import render ,redirect

from users.models import CustomUser
from .models import Contact, Inquiries, Referrals, Treatments
from django.contrib import messages
from datetime import datetime
# Create your views here.

def index(request):
    # print(MEDIA_URL)
    return render(request, 'home/index.html')


def about(request):
    return render(request, 'home/about.html')

def contact(request):
    if request.method == 'POST':
        name = request.POST['name']
        email = request.POST['email']
        phone = request.POST['phone']
        message = request.POST['message']
       
        contact = Contact(name=name, email=email, phone=phone, message=message)
        contact.save()
        messages.success(request, 'Your message has been sent!')
        return redirect('index')
        
    return render(request, 'home/contact.html')

def talktodoctor(request):

    if request.method == 'POST':
        message = request.POST['message']
        symptoms = request.POST['symptoms']
        
        if request.user.is_authenticated:
            user = request.user
            name = request.user.username
            email = request.user.email
            phone = request.user.phone
            dob = request.user.dob
            age = request.user.age
            gender = request.user.gender
            address = request.user.address
        else:
            request.user = None
            name = request.POST['name']
            email = request.POST['email']
            phone = request.POST['phone']
            dob = request.POST['dob']
            gender = request.POST['gender']
            address = request.POST['address']
            dob = request.POST.cleaned_data.get('dob')
            current_date = datetime.now().date()
            if isinstance(dob, str):
                dob = datetime.strptime(dob, '%Y-%m-%d')
            age = current_date.year - dob.year
            if current_date.month < dob.month or (current_date.month == dob.month and current_date.day < dob.day):
                age = age - 1
        Inquirie = Inquiries(name=name,user= user, email=email, phone=phone, message=message, symptoms=symptoms ,dob=dob, gender=gender, address=address)
        Inquirie.save()
        messages.success(request, 'A doctor will talk to you soon, please be patient!')
        return redirect('dashboard')

        # messages.warning(request, 'You are not logged in')
    if not  request.user.is_authenticated :
        messages.info(request, 'please register or login to talk to a doctor') 
        return redirect('index')
    return render(request, 'home/talk.html')



def treatments(request, id):
    inquiry = Inquiries.objects.get(id=id)
    ngos = CustomUser.objects.filter(is_ngo=True)   
    context = {
        'inquiry':inquiry,
        'ngos':ngos

    }
    
    return render(request, 'home/treatments.html',context )

def save_treatments(request):
    if request.method == 'POST':
        suggestion = request.POST['suggestion']
        meds = request.POST['meds']
        doctor = request.POST['doctor']
        inquiry = request.POST['inquiry']
        is_treated = request.POST['treated']

        print(is_treated,suggestion,meds,doctor,inquiry)

        inquiry = Inquiries.objects.get(id=inquiry)
        patient = inquiry.user 
        if is_treated == 'on':
            is_treated = True
        else:
            is_treated = False
        
        inquiry.is_attended = is_treated
        inquiry.save()
        print(inquiry)
        doctor = CustomUser.objects.get(id=doctor)
        treatment = Treatments(inquiry=inquiry ,patient=patient, doctor=doctor, suggestions=suggestion, meds=meds)
        treatment.save()
        if treatment.id:
            messages.success(request, 'Treatments and suggestions successfully sent,')
            return redirect('dashboard')

    # inquiry = Inquiries.objects.get(id=id)
    # inquiry.is_attended = True
    # inquiry.save()
    return redirect('index')


def refer_to_ngo(request):
    if request.method == 'POST':
        inquiry = request.POST['inquiry']
        inquiry = Inquiries.objects.get(id=inquiry)
        patient = inquiry.user
        doctor = request.user
        nogs  = request.POST.get('ngos')
        ngo_list = []
        for ngo in nogs.split(','):
            temp_ngo = CustomUser.objects.get(is_ngo=True,id=ngo)
            ngo_list.append(temp_ngo)
        refferal = Referrals.objects.create(inquiry=inquiry, patient=patient, doctor=doctor)
        refferal.ngos.set(ngo_list)
        refferal.save()
        if refferal.id:
            messages.success(request, 'referred to the appropriate NGOS, Thanks !')
            return redirect('dashboard')
        else:
            messages.error(request, 'Something went wrong')
            return redirect('dashboard')
        
def ngo_treatment(request):
    if request.method == 'POST':
        inquiry = request.POST['inquiry_id']
        inquiry = Inquiries.objects.get(id=inquiry)
        inquiry.is_attended = True
        inquiry.save()
        referral = Referrals.objects.filter(inquiry=inquiry,ngos=request.user)[0]
        referral.is_attended = True
        referral.save()
        messages.success(request, 'This patient has been added to your list of NGOS for treatment')
        return redirect('dashboard')


    return render(request, 'home/ngo_treatment.html')
