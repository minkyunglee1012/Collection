from django.urls import path
from . import views

# articles/urls.py
app_name = 'articles'
urlpatterns = [
    path('index/', views.index, name='index'),
    path('detail/<int:article_id>', views.detail, name = 'detail'),
    path('edit/<int:article_id>', views.edit, name='edit'),
    path('create/', views.create, name='create'),
    path('save/', views.save, name='save'),
    path('update/<int:article_id>', views.update, name='update'),
    path('delete/<int:article_id>', views.delete, name='delete')
]
