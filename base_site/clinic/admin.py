from django.contrib import admin
from clinic import models
# Register your models here.

clinic_app = [
    models.appointment.Appointment,
    models.doctor.Doctor,
    models.patient.Patient,
    models.user.User,
    models.user.Role,
]

for model in clinic_app:
    admin.site.register(model)