from django.shortcuts import render
from django.http import JsonResponse
from cs_attrition_viz import models


def cs_attrition_home(request):
	return render(request, 'home.html', {})


def cs_attrition_population(request):
	return render(request, 'population.html', {})


def cs_attrition_salary(request):
	return render(request, 'salary.html', {})


def womens_data(request):
	women = models.CsWomen.objects.all().values()
	return JsonResponse(list(women), safe=False)


def mens_data(request):
	men = models.CsMen.objects.all().values()
	# context = {
	# 	'women': women,
	# 	'men': men
	# }
	return JsonResponse(list(men), safe=False)