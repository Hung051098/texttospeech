from builtins import print
from datetime import datetime

from flask import render_template, redirect, request,session,url_for,jsonify
import pyttsx3
import requests
from flask_sqlalchemy import SQLAlchemy
from gtts import gTTS
from playsound import playsound
import urllib3
from pydub import AudioSegment
from bs4 import BeautifulSoup
import urllib.request
import time
import json
import os
import docx
from app import app
db = SQLAlchemy(app=app)
from app import fileNameZalo




# chuyển văn bản thành âm thanh
def speakApiFpt(text, voice):
    url = 'https://api.fpt.ai/hmi/tts/v5'
    payload = text
    headers = {
        'api-key': '5FDA9C0jqXEFTklw9wym7StpTH3U0qD7',
        'speed': '',
        'voice': voice
    }

    response = requests.request('POST', url, data=payload.encode('utf-8'), headers=headers)
    data = response.json()
    key_async = data['async']
    print(key_async)
    fileAudio = download_file(key_async, fileNameZalo)
    return

def speakApiZalo(text, voice, speed):
    url = 'https://api.zalo.ai/v1/tts/synthesize'
    speedid = 1
    if speed == '-150':
        speedid = 0.8
    if speed == '-100' :
        speedid = 0.9
    if speed == '-50' :
        speedid = 1
    if speed == "0" :
        speedid = 1.1
    if speed == "50" :
        speedid = 1.2
    data = {
        'input': text,
        'speaker_id': voice,
        'speed': speedid
    }
    headers = {
        'apikey': session.get("token_api")
    }
    response = requests.post(url, data=data, headers=headers)
    response = response.json()
    err_code = response['error_code']
    if err_code == 0:
        print(err_code)
        data = response['data']
        url = data['url']
        fileAudio = download_file(url,fileNameZalo)
    else:
        fileAudio = ""
    return fileAudio

# chuyển văn bản thành âm thanh
def speak(text, volume1 , rate1):
    # text = request.POST['inp']
    engine = pyttsx3.init()
    voices = engine.getProperty('voices')
    rate = engine.getProperty('rate')
    volume = engine.getProperty('volume')
    engine.setProperty('volume', volume + float(volume1))
    engine.setProperty('rate', rate + int(rate1))
    engine.setProperty('voice', voices[1].id)
    # engine.say(text)
    engine.runAndWait()


def crawData(baseUrl, url):
    content = ""
    try:
        response = requests.get(url)
        soup = BeautifulSoup(response.content, "html.parser")
        titles = soup.find("h1", class_="article-title").text
        sapo = soup.find("h2", class_="sapo").text
        bodys = soup.find("div", id="main-detail-body")
        i = 0;
        main = ""
        while i < len(bodys):
            try:
                main += bodys.findChildren("p", recursive=False)[i].text + "..."
            except:
                main += ''
            i += 1
        content = titles + " " + sapo + " " + main
    except:
        content = 'Tôi không lấy được thông tin bài báo'
    return content


def crawTitleData(baseUrl, url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")
    titles = soup.findAll('h3', class_='title-news')
    links = [link.find('a').attrs["href"] for link in titles]
    title = [link.find('a').attrs["title"] for link in titles]
    i = 0
    fisrtPaper = db.engine.execute("SELECT url from paper where active = 1 order by id asc limit 1")
    urlPaper = ''
    for it in fisrtPaper:
        urlPaper = it['url']
    urlA = urlPaper.split('-')
    urlB = urlA[len(urlA) - 1]
    urlC = urlB.split('.')
    a = links[0].split('-')
    b = a[len(a) - 1]
    c = b.split('.')
    print("c: ", c[0])
    print("urlC: " + urlC[0])
    check = 1
    if c[0] == urlC[0]:
        check = 0
    if check == 1:
        db.engine.execute("truncate table paper")
        for item in title:
            if i == 0:
                fisrtPaper = db.engine.execute("update paper set active = 0")
            l = "https://tuoitre.vn" + links[i];
            text = crawData("https://tuoitre.vn", l)
            fileAudio = "chua"
            now = datetime.now()
            dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
            con = db.engine.execute("INSERT INTO paper(title, url, mp3, data_id, active, create_date) "
                                    "VALUES(%s, %s, %s, %s, %s, %s)",(item, links[i], fileAudio, c[0], 1, dateTime))
            i += 1
    return True

def listDataPaper():
    count = db.engine.execute("SELECT * from paper where active != 0 order by id desc").fetchall()
    if count != 0:
        crawTitleData("https://tuoitre.vn", "https://tuoitre.vn/tin-moi-nhat.htm")
    data = []
    listPaper = db.engine.execute("SELECT * from paper where active != 0 order by id desc")
    for it in listPaper:
        id = it['id']
        url = it['url']
        title = it['title']
        mp3 = it['mp3']
        data.append({
            "title": title,
            "url": url,
            "mp3": mp3,
            "id": id
        })
    return data
def saveMp3(text, volume1 , rate1):
    engine = pyttsx3.init()
    voices = engine.getProperty('voices')
    rate = engine.getProperty('rate')
    volume = engine.getProperty('volume')
    engine.setProperty('volume', volume + float(volume1))
    engine.setProperty('rate', rate + int(rate1))
    engine.setProperty('voice', voices[1].id)
    path = "static/assets/audio/"
    filemilisecond = round(time.time() * 1000)
    filename = str(filemilisecond) + ".mp3"
    engine.save_to_file(text, path+filename)
    engine.runAndWait()
    return filename


def download_file(url, fileNameZalo=fileNameZalo):
    path = "static/assets/audio/"
    try:
        filemilisecond = round(time.time() * 1000)
        if fileNameZalo == "":
            fileNameZalo = str(filemilisecond) + ".mp3"
            print("fileNameZalo: "+ fileNameZalo)
        file = path+fileNameZalo
        urllib.request.urlretrieve(url, file)
    except:
        download_file(url, fileNameZalo)
    return fileNameZalo

def readFileDocx(file):
    doc = docx.Document(file)
    completeText = []
    for paragraph in doc.paragraphs:
        completeText.append(paragraph.text)
    return '/n' .join(completeText)