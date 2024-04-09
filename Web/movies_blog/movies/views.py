from django.shortcuts import render

# Create your views here.
def movies(request):
    return render(request, 'movies/movies.html')

def add_movie(request):
    return render(request, 'movies/add_movie.html')