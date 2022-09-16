from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.db import transaction

from models import AdvocacyMember

class SignUpForm(UserCreationForm):

	class Meta(UserCreationForm.Meta):
		model = AdvocacyMember

	@transaction.atomic
    def save(self):
        user = super().save(commit=False)
        user.is_advocacy_member = True
        user.save()
        advocacy_member = AdvocacyMember.objects.create(user=user)
        return user
