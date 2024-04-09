from django.shortcuts import render

# Create your views here.
def menu(request, cnt, menu):
    context = {
        'menu' : menu,
        'cnt': cnt
    }
    return render(request, 'pages/dinner.html', context)

def people(request, num):
    context = {
        'num' : num
    }
    return render(request, 'pages/dinner.html', context)