from django.urls import path
from cs_attrition_viz import views

urlpatterns = [
	path('', views.cs_attrition_home, name='home'),
]