from django.shortcuts import render
import random

# Create your views here.
def lotto(request):
    lotto_numbers = random.sample(range(1, 16), 6)
    return render(request, 'pages/lotto.html', {'lotto_numbers' : lotto_numbers})
