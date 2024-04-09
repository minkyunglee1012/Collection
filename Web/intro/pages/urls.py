# pages/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('menu/<str:menu>/<int:cnt>/', views.menu),
    path('people/<int:num>/', views.people)
]