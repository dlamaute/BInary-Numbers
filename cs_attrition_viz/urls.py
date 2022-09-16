from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from cs_attrition_viz.views import views

urlpatterns = [
	path('', views.cs_attrition_home, name='home'),
	path('population/', views.cs_attrition_population, name='population'),
	path('salary/', views.cs_attrition_salary, name='salary'),
	path('api/womens_data', views.womens_data, name='womens_data'),
	path('api/mens_data', views.mens_data, name='mens_data'),
	path('data_csv', views.data_csv, name='data_csv'),
	path('data_sources_csv', views.data_sources_csv, name='data_sources_csv'),
]
