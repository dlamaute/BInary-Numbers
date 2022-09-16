from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.db.models import F
from django.contrib import admin
from cs_attrition_viz import models


"""
Actual views
"""

def cs_attrition_home(request):
	return render(request, 'home.html', {})


def cs_attrition_population(request):
	return render(request, 'population.html', {})


def cs_attrition_salary(request):
	return render(request, 'salary.html', {})


"""
Data retrieval methods
"""

# Columns used for the visualizations and those columns' corresponding source notes columns
relevant_data_columns = ['year', 'num_employees_nsf', 'salary_nsf', 'num_recent_grad_employees', 'num_recent_grad_nonstem']
relevant_source_columns = ['year', 'num_employees_nsf_source', 'salary_nsf_source', 'num_recent_grad_employees_source', 'num_recent_grad_nonstem_source']

def data_csv(request):
	cs_women = models.CsWomen.objects.values(
		'year',
		cs_women_num_employees_nsf=F('num_employees_nsf'),
		cs_women_salary_nsf=F('salary_nsf'),
		cs_women_num_recent_grad_employees=F('num_recent_grad_employees'),
		cs_women_num_recent_grad_nonstem=F('num_recent_grad_nonstem'),
	)
	cs_men = models.CsMen.objects.values(
		'year',
		cs_men_num_employees_nsf=F('num_employees_nsf'),
		cs_men_salary_nsf=F('salary_nsf'),
		cs_men_num_recent_grad_employees=F('num_recent_grad_employees'),
		cs_men_num_recent_grad_nonstem=F('num_recent_grad_nonstem'),
	)
	querysets = [cs_women, cs_men]
	return create_csv_from_db_table(admin.ModelAdmin, request, querysets)


def data_sources_csv(request):
	cs_data_sources = models.Sources.objects.values(
		'year',
		'num_employees_nsf_source',
		'salary_nsf_source',
		'num_recent_grad_employees_source',
		'num_recent_grad_nonstem_source',
	)
	return create_csv_from_db_table(admin.ModelAdmin, request, [cs_data_sources])


def womens_data(request):
	women = models.CsWomen.objects.all().values()
	return JsonResponse(list(women), safe=False)


def mens_data(request):
	men = models.CsMen.objects.all().values()
	return JsonResponse(list(men), safe=False)


"""
Helper Functions
"""
def create_csv_from_db_table(modeladmin, request, querysets):
	if not request.user.is_advocacy_member:
		raise PermissionDenied
	response = HttpResponse(
		content_type='text/csv',
		headers={'Content-Disposition': 'attachment; filename="cs_government_gender_data.csv"'},
	)
	csv_writer.csv.writer(response, delimiter=";")
	all_fields = []
	for queryset in querysets:
		metadata = queryset.model._meta
		model = queryset.model
		all_fieldnames.extend(queryset.first().keys())
	csv_writer.writerow(all_fieldnames)
	for i, query_response_object in enumerate(querysets[0]):
		row = []
		for queryset in querysets:
			row.extend([get_attr(queryset[i], field) for field in queryset.first().keys()]) 
		csv_writer.writerow(row)
	return response

