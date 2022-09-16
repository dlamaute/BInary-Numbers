from django.contrib.auth import login
from django.shortcuts import redirect
from django.views.generic import CreateView

from ..forms import SignUpForm
from ..models import AdvocacyMember

class AdvocacyMemberSignUpView(CreateView):
	model = AdvocacyMember
	form_class = SignUpForm
	template_name = 'registration/signup.html'

	def get_context_data(self, **kwargs):
		kwargs['user_type'] = 'advocacy_member'
		return super().get_context_data(**kwargs)

	def form_valid(self, form):
		advocacy_member = form.save()
		login(self.request, advocacy_member)
		return redirect('home')
