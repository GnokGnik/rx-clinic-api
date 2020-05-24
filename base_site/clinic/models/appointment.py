from django.db import models
from django.contrib.auth.models import User
from clinic.models.patient import Patient
from clinic.models.doctor import Doctor

class Appointment(models.Model):
    request = models.TextField(verbose_name="Purpose of appointment", default='')
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE,  default=1)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE, default=1) 


    