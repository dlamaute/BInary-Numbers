from django.shortcuts import render

# Create your views here.
def cs_attrition_home(request):
	return render(request, 'home.html', {})
