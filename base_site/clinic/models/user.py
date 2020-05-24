from django.db import models
from django.contrib.auth.models import AbstractUser

class Role(models.Model):
    name = models.CharField(max_length=64, verbose_name="Role")

class User(AbstractUser):
    role = models.ManyToManyField(Role)