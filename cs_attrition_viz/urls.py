from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from cs_attrition_viz import views

urlpatterns = [
	re_path(r'^$', views.cs_attrition_home, name='home'),
	re_path(r'^$population/', views.cs_attrition_population, name='population'),
	re_path(r'^$salary/', views.cs_attrition_salary, name='salary'),
	re_path(r'^api/get_womens_data', views.get_womens_data, name='get_womens_data'),
	re_path(r'^api/get_mens_data', views.get_mens_data, name='get_mens_data'),
]
