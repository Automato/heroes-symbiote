from django.contrib.auth.models import AbstractUser
from model_utils.models import TimeStampedModel

from .uuid import UUIDModelMixin


class User(UUIDModelMixin, TimeStampedModel, AbstractUser):
    class Meta:
        app_label = 'api'
