from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.db.models import F
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

def source_data(modeladmin, request, queryset):
	cs_women = CsWomen.objects.values('year', cs_women_num_employees_nsf=F('num_employees_nsf'), cs_women_salary_nsf=F('salary_nsf'), cs_women_num_recent_grad_employees=F('num_recent_grad_employees'), cs_women_num_recent_grad_nonstem=('num_recent_grad_nonstem'))
	cs_men = CsMen.objects.values('year', cs_men_num_employees_nsf=F('num_employees_nsf'), cs_men_salary_nsf=F('salary_nsf'), cs_men_num_recent_grad_employees=F('num_recent_grad_employees'), cs_men_num_recent_grad_nonstem=('num_recent_grad_nonstem'))

	if not request.user.is_advocacy_member:
		raise PermissionDenied
	metadata = queryset.model._meta
	model = queryset.model
	response = HttpResponse(
		content_type='text/csv',
		headers={'Content-Disposition': 'attachment; filename="cs_government_gender_data.csv"'},
	)
	csv_writer = csv.writer(response)
	fields = [field.name for fields in metadata.fields]
	csv_writer.writerow(fields)
	for query_response_object in queryset:
		csv_writer.writerow([get_attr(query_response_object, field) for field in fields])
	return response


def data_source_table(modeladmin, request, queryset):
	metadata = queryset.model._meta
	model = queryset.model
	response = HttpResponse(
		content_type='text/csv',
		headers={'Content-Disposition': 'attachment; filename="cs_government_gender_data.csv"'},
	)
	csv_writer = csv.writer(response)
	fields = [field.name for fields in metadata.fields]
	csv_writer.writerow(fields)
	for query_response_object in queryset:
		csv_writer.writerow([get_attr(query_response_object, field) for field in fields])
	return response


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


"""
Helper Functions
"""
def create_csv_from_db_table(modeladmin, request, queryset, relabel_conflicting_fields=False):
	if not request.user.is_advocacy_member:
		raise PermissionDenied
	metadata = queryset.model._meta
	model = queryset.model
	response = HttpResponse(
		content_type='text/csv',
		headers={'Content-Disposition': 'attachment; filename="cs_government_gender_data.csv"'},
	)
	csv_writer.csv.writer(response)
	if (relabel_conflicting_fields):

