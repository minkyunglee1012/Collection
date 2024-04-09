from django.shortcuts import render

# Create your views here.
def index(request):
    context = {
        'name' : '이민경',
        'result' : 10
    }
    return render(request, 'articles/index.html', context)

def movies(request):
    favorite_movie = '범죄도시'
    movie_list = ['범죄도시', '극한직업', '기생충', '아바타']
    context = {
        'favorite_movie' : favorite_movie,
        'movie_list' : movie_list
    }
    return render(request, 'articles/movies.html', context)

def save_review(request):
    data = request.GET
    context = {
        'review_text': data.get('review_text')
    }
    return render(request, 'articles/save_review.html', context)