from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class CustomUser(AbstractUser):
    # Add any additional fields you want for your user model
    # Example:
    age = models.PositiveIntegerField(blank=True, null=True)
    