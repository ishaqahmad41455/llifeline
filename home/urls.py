from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('', views.index, name='index'),
    path('about/', views.about, name='about'),
    path('contact/', views.contact, name='contact'),
    path('users/', include('users.urls')),
    path('talktodoctor/',views.talktodoctor, name='talktodoctor'),
    path('treatments/<int:id>',views.treatments, name='treatments'),
    path('treatments/',views.save_treatments, name='save_treatments'),
    path('refer_to_ngo/',views.refer_to_ngo, name='refer_to_ngo'),
    path('ngo_treatment/',views.ngo_treatment, name='ngo_treatment'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)