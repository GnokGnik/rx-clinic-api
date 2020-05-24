from django.db import models
from clinic.models.user import User

class Patient(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)