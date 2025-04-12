from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello, Akash! Welcome to your blog!")

from django.shortcuts import render
from .models import BlogPost

def home(request):
    posts = BlogPost.objects.all().order_by('-date_posted')
    return render(request, 'blog/home.html', {'posts': posts})
