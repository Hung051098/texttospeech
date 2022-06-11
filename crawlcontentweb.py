
import tldextract
import os
from bs4 import BeautifulSoup
from bs4.element import Comment
import urllib.request
import requests
import tldextract
from urllib.request import Request, urlopen
def add(index):
    print(index)
    link = "https://tamlinh247.vn/con-duong-ba-chu-Akay-Hau/chuong-"+str(index)
    req = Request(link, headers={'User-Agent': 'Mozilla/5.0'})
    body = urlopen(req).read()
    content = ''
    content += " </br>=====================CHƯƠNG " + str(index) +"============================= </br>"
    tag_main = 'div'
    tag_class = 'content_wrap'
    tag_content = 'div'
    type = '1'
    soup = BeautifulSoup(body, 'html.parser')
    soup = soup.body
    
    
    soup = soup.find_all(tag_main, class_=tag_class)
    soup = soup[1].find_all(tag_content)
    for link in soup:
        link = link.findAll(text=True)
        visible_texts = filter(tag_visible, link)
        content += u"".join(t.strip() for t in visible_texts)+" "
    return content


def tag_visible(element):
    if element.parent.name in ['style', 'script', 'head', 'footer', 'title', 'meta', '[document]']:
        return False
    if isinstance(element, Comment):
        return False
    return True

for x in range(1289, 1465):
    f = open("demofile2.html", "a",encoding="utf-8")
    f.write(add(x))
    f.close()
    
