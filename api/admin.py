from django.contrib import admin

# Register your models here.
from .models import (
    User,
)


class TimeStampedModelAdmin(admin.ModelAdmin):
    readonly_fields = ('created, modified')


admin.site.register(User, TimeStampedModelAdmin)
