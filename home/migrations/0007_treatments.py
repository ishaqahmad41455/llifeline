# Generated by Django 4.2.1 on 2023-05-29 06:56

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('home', '0006_inquiries_is_attended'),
    ]

    operations = [
        migrations.CreateModel(
            name='Treatments',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(auto_now_add=True)),
                ('time', models.TimeField(auto_now_add=True)),
                ('suggestions', models.TextField(blank=True, null=True)),
                ('meds', models.TextField(blank=True, null=True)),
                ('doctor', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='doctor', to=settings.AUTH_USER_MODEL)),
                ('patient', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='patient', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]