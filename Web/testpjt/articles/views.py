from django.shortcuts import render, redirect
from .models import Article

# Create your views here.
def index(request):
    articles = Article.objects.all()
    context = {
        'articles' : articles
    }
    return render(request, 'articles/index.html', context)

def detail(request, article_id):
    article = Article.objects.get(pk=article_id)
    context = {
        'article' : article
    }
    return render(request, 'articles/detail.html', context)

def create(request):
    return render(request, 'articles/create.html')

def save(request):
    data = request.POST
    # 방법 1) 인스턴스 생성해서 데이터 추가
    # article = Article()
    # article.title = data.get('title')
    # article.content = data.get('content')
    # article.save()

    # 방법 2) QuerySet API 이용해서 데이터 추가
    new_article = Article.objects.create(title=data.get('title'), content=data.get('content'))

    return redirect('articles:detail', article_id=new_article.pk)

def edit(request, article_id):
    article = Article.objects.get(pk=article_id)
    context = {
      'article':article
      }
    return render(request, 'articles/edit.html', context)

def update(request,article_id):
    data = request.POST
    Article.objects.filter(pk=article_id).update(
        title=data.get('title'), content = data.get('content'))
    return redirect('articles:detail', article_id=article_id)

def delete(request, article_id):
    data = request.POST
    delete_article = Article.objects.filter(pk=article_id).delete()
    return redirect('articles:index')





# def movies(request):
#     favorite_movie = '범죄도시'
#     movie_list = ['범죄도시', '극한직업', '기생충', '아바타']
#     context = {
#         'favorite_movie' : favorite_movie,
#         'movie_list' : movie_list
#     }
#     return render(request, 'articles/movies.html', context)

# def save_review(request):
#     data = request.GET
#     context = {
#         'review_text': data.get('review_text')
#     }
#     return render(request, 'articles/save_review.html', context)