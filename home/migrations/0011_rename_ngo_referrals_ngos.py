# Generated by Django 4.2.1 on 2023-05-29 19:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0010_remove_referrals_ngo_referrals_ngo'),
    ]

    operations = [
        migrations.RenameField(
            model_name='referrals',
            old_name='ngo',
            new_name='ngos',
        ),
    ]
