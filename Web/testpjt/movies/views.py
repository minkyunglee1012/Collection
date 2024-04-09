from django.shortcuts import render

# Create your views here.
def movies(request):
    favorite_movie = '범죄도시'
    movie_list = ['범죄도시', '극한직업', '기생충', '아바타']
    context = {
        'favorite_movie' : favorite_movie,
        'movie_list' : movie_list
    }
    return render(request, 'movies/movies.html', context)