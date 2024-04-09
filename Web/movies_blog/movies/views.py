from django.shortcuts import render

# Create your views here.
def movies(request):
    return render(request, 'movies/movies.html')

def add_movie(request):
    return render(request, 'movies/add_movie.html')

def save_movie(request):
    data = request.GET
    context = {
        'movie_text': data.get('movie_text')
    }
    return render(request, 'movies/movies.html', context)

def detail(request):
    movie_text = request.GET.get('movie_text')
    context = {
        'movie_text': movie_text
    }
    return render(request, 'movies/detail.html', context)