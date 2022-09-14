from django.shortcuts import render
from cs_attrition_viz import models


def cs_attrition_home(request):
	return render(request, 'home.html', {})


def cs_attrition_population(request):
	women = models.CsWomen.objects.all()
	men = models.CsMen.objects.all()
	context = {
		'women': women,
		'men': men
	}
	return render(request, 'population.html', context)


def cs_attrition_salary(request):
	women = models.CsWomen.objects.all()
	men = models.CsMen.objects.all()
	context = {
		'women': women,
		'men': men
	}
	return render(request, 'salary.html', context)
