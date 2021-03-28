from typing import re

import pyttsx3
from django.http import HttpResponse
from django.shortcuts import render, redirect


def index(request):
    return render(request, "index.html")


# chuyển văn bản thành âm thanh
def some(request):
    text = request.GET['inp']
    print(text)
    engine = pyttsx3.init()
    voices = engine.getProperty('voices')
    rate = engine.getProperty('rate')
    volume = engine.getProperty('volume')
    engine.setProperty('volume', volume - 0.0)  # tu 0.0 -> 1.0
    engine.setProperty('rate', rate - 50)
    engine.setProperty('voice', voices[1].id)
    engine.say(text)
    engine.runAndWait()
    return redirect('/')
