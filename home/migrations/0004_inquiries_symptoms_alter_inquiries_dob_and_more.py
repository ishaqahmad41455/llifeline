# Generated by Django 4.2.1 on 2023-05-29 04:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0003_inquiries'),
    ]

    operations = [
        migrations.AddField(
            model_name='inquiries',
            name='symptoms',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='inquiries',
            name='dob',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='inquiries',
            name='message',
            field=models.TextField(blank=True, null=True),
        ),
    ]
