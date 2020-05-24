from django.db import models
from clinic.models.user import User

class Doctor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE), 
    job_description = models.TextField(max_length=1024, verbose_name='Job Description')
    