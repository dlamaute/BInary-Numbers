from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from cs_attrition_viz import views

urlpatterns = [
	path('', views.cs_attrition_home, name='home'),
	path('population/', views.cs_attrition_population, name='population'),
	path('salary/', views.cs_attrition_salary, name='salary'),
]
