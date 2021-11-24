import gzip
from builtins import print
from importlib.resources import contents

from flask import render_template, redirect, request,session,url_for,jsonify
from flask_login import login_user, login_required
import wikipedia
from werkzeug.utils import secure_filename

from app import app, login, dao, charts
# from app.dao import read_chuyenbay
from app.models import *
import hashlib

# from app.models import Ve
from app.texttospeech import *
from app import app
from gtts import gTTS
import playsound
import os
from bs4 import BeautifulSoup
from bs4.element import Comment
import urllib.request
import requests
import tldextract
from urllib.request import Request, urlopen
db = SQLAlchemy(app=app)

UPLOAD_FOLDER = './static/assets/file/'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
path = "static/assets/audio/"

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/login_admin", methods=['GET', 'POST'])
def login_admin():
    try:
        if request.method == 'POST':
            username = request.form.get("username")
            password = request.form.get("password")
            password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
            user = Admin.query.filter(Admin.username == username.strip(),
                                      Admin.password == password).first()
            session['userinfo'] = user.id
            session['role'] = user.role
            session['token_api'] = user.token_api
            session['name'] = user.name
            if user:
                if user.active == 1:
                    login_user(user=user)
                if user.active == 0:
                    return redirect(url_for('orderDetail'))

    except Exception as e :
        print(e)
        return redirect("/login_admin")
    return redirect("/admin/home")

@app.route("/register", methods=['GET', 'POST'])
def register():
    error = ''
    if request.method =='POST':
        password = request.form.get("password")
        firstname = request.form.get("firstname")
        lastname = request.form.get("lastname")
        fullame = firstname+" "+lastname
        repeatpassword = request.form.get("repeatpassword")
        username = request.form.get("username")
        if repeatpassword != password:
            error = 'Password không trùng khớp'
            return render_template("register.html",error =error)
        text = "select * from admin where username  ='"+username+"'"
        count = db.engine.execute(text).fetchone()
        if count != None:
            error = 'Username đã tồn tại'
            return render_template("register.html", error =error)

        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        now = datetime.now()
        dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
        con = db.engine.execute("INSERT INTO admin(name, active, username, password, create_date) "
                            "VALUES(%s, %s, %s, %s, %s)", (fullame, 1, username, password, dateTime))
        return redirect('admin/home')

    return render_template("register.html", error=error)



@app.route("/admin/home", methods=['GET', 'POST'])
def adminHome():
    data = []
    listVoice = []
    listLanguage =[]
    role = session.get('role')
    name = session.get('name')
    try:
        where = ""
        if session.get('userinfo') != 0:
            admin_id = session['userinfo']
            where = "AND admin_id = " + str(admin_id)
        sql = "SELECT * from history where status != 0 " + where + " AND type = 1 order by id desc"
        listHistoty = db.engine.execute(sql)
        for it in listHistoty:
            time = it['create_date']
            mp3 = it['mp3']
            data.append({
                "id": it['id'],
                "time": time,
                "mp3": mp3
            })
        listVoice = db.engine.execute("SELECT * from voice where status != 0 order by id desc")
        listLanguage = db.engine.execute("SELECT * from language where status != 0 order by id desc")
    except:
        return render_template("admin/index.html", data=data, listVoice=listVoice, listLanguage=listLanguage, role =role, name =name)
    return render_template("admin/index.html", data=data, listVoice =listVoice, listLanguage =listLanguage, role =role, name =name)


@login.user_loader
def user_load(user_id):
    return Admin.query.get(user_id)

@app.route("/logout")
def logout():
    session["user"]=None
    logout_user()
    current_user.is_authenticated
    return render_template("index.html")


@app.route('/chuyen_thanh_giong_noi', methods=['GET','Post'])
def convertSpeech():
    data = []
    if request.method =='POST':
        tts_language = request.form['tts_language']
        text = request.form['tts_text']
        tts_engine = request.form['tts_engine']
        tts_ssml_volume = request.form['tts_ssml_volume']
        tts_ssml_spk_rate = request.form['tts_ssml_spk_rate']
        print("tts_ssml_spk_rate: "+ tts_ssml_spk_rate)
        path = "static/assets/audio/"
        if tts_language == 'vi':
            if tts_engine == "standard":
                speak(text, tts_ssml_volume, tts_ssml_spk_rate)
                fileAudio = saveMp3(text, tts_ssml_volume, tts_ssml_spk_rate)
                now = datetime.now()
                admin_id = session['userinfo']
                dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
                con = db.engine.execute("INSERT INTO history(mp3, content,status, admin_id, type, create_date) "
                                        "VALUES(%s, %s, %s, %s, %s, %s)",(fileAudio, text,1, admin_id, 1, dateTime))
            elif tts_engine == "neural_1":
                tts_resource_ids = request.form['tts_resource_ids']
                fileAudio = speakApiFpt(text, tts_resource_ids)
                now = datetime.now()
                admin_id = session['userinfo']
                dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
                con = db.engine.execute("INSERT INTO history(mp3, content, status, admin_id,type,  create_date) "
                                        "VALUES(%s, %s, %s, %s, %s)",(fileAudio,text, 1, admin_id,1, dateTime))
            elif tts_engine == "neural_2":
                tts_resource_ids = request.form['tts_resource_ids']
                print(tts_resource_ids)
                fileAudio = speakApiZalo(text, tts_resource_ids, tts_ssml_spk_rate)
                now = datetime.now()
                admin_id = session['userinfo']
                dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
                con = db.engine.execute("INSERT INTO history(mp3, content, status, admin_id,type,  create_date) "
                                        "VALUES(%s, %s, %s, %s, %s, %s)",(fileAudio, text,1, admin_id,1, dateTime))
        else:
            tts = gTTS(text, lang=tts_language)
            filemilisecond = round(time.time() * 1000)
            fileAudio = str(filemilisecond) + ".mp3"
            print(path + fileAudio)
            tts.save(path + fileAudio)
            # playsound.playsound(path + filename)
            now = datetime.now()
            admin_id = session['userinfo']
            dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
            con = db.engine.execute("INSERT INTO history(mp3, content,status, admin_id, type, create_date) "
                                    "VALUES(%s, %s, %s, %s, %s, %s)", (fileAudio, text, 1, admin_id, 1, dateTime))
    return path + fileAudio

@app.route('/admin/listpaper', methods=['GET'])
def listpaper():
    data = listDataPaper()
    role = session.get('role')
    name = session.get('name')
    return render_template("/admin/listpaper.html", data = data, role =role, name=name)

@app.route('/admin/upload', methods=['GET', "post"])
def uploadFile():
    if request.method == 'POST':
        file = request.files['file']
        filetemp = file.filename.split('.')
        if filetemp[len(filetemp) - 1] != 'docx' and filetemp[len(filetemp) - 1] != 'doc':
            error = 'File upload không hợp lệ, chỉ nhận file .doc hoặc .docx'
            return render_template("/admin/uploadfile.html", error =error)
        if file:
            tts_ssml_volume = request.form['tts_ssml_volume']
            tts_ssml_spk_rate = request.form['tts_ssml_spk_rate']
            filename = secure_filename(file.filename)
            path = os.path.join(app.config['UPLOAD_FOLDER'])
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            file = path + filename
            content = readFileDocx(file)
            fileAudio = saveMp3(content, tts_ssml_volume, tts_ssml_spk_rate)
            now = datetime.now()
            admin_id = session['userinfo']
            dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
            con = db.engine.execute("INSERT INTO history(mp3, status, admin_id, type, create_date) "
                                    "VALUES(%s, %s, %s, %s, %s)",(fileAudio, 1, admin_id, 2, dateTime))

    where = ""
    if session.get('userinfo')  != 0 :
        admin_id = session['userinfo']
        where = "AND admin_id = "+str(admin_id)
    sql = "SELECT * from history where status != 0 "+where+" AND type = 2 order by id asc"
    listHistoty = db.engine.execute(sql)
    role = session.get('role')
    name = session.get('name')
    return render_template("/admin/uploadfile.html", listHistoty = listHistoty, role=role, name=name)



@app.route('/admin/crawpaper', methods=["post"])
def crawpaper():
    url = request.form['url']
    id = request.form['id']
    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")
    titles = soup.find("h1", class_="article-title").text
    text = crawData("https://tuoitre.vn", url)
    fileAudio = saveMp3(text, 1.0, -50)
    now = datetime.now()
    dateTime = now.strftime("%Y/%m/%d %H:%M:%S")

    count = db.engine.execute("SELECT * from paper where id="+id).fetchall()
    if count != 0:
        n = db.engine.execute("UPDATE paper set mp3 = '"+fileAudio+"' WHERE id = "+id)
    else:
        con = db.engine.execute("INSERT INTO paper(title, url, mp3, data_id, active, create_date) "
                            "VALUES(%s, %s, %s, %s, %s, %s)", (titles, url, fileAudio, 0, 1, dateTime))
    data = listDataPaper()
    return path + fileAudio

@app.route('/admin/detailhistory', methods=['GET', 'post'])
def detailhistory():
    id_history = request.args.get('id_history')
    sql = "SELECT * from history where id = " + id_history
    detail = db.engine.execute(sql)
    data = []
    for iii in detail:
        data.append({
            "content": iii['content'],
            "mp3": iii['mp3']
        })
    role = session.get('role')
    name = session.get('name')
    return render_template("/admin/detailhistory.html", data = data, role = role, name=name)


@app.route('/admin/wiki', methods=['GET', 'post'])
def wiki():
    path = "static/assets/audio/"
    if request.method == 'POST':
        try:
            text = request.form['text']
            wikipedia.set_lang('vi')
            contents = wikipedia.summary(text).split('\n')
            audio = saveMp3(contents[0] + ". Đây là nội dung tôi vừa tìm được cảm ơn bạn đã lắng nghe", 0, -50)
        except Exception as e:
            print(e)
            audio = saveMp3(f"Tôi không định nghĩa được thuật ngữ của bạn !!!", 0, 0)
        return path+audio
    role = session.get('role')
    name = session.get('name')
    return render_template("/admin/wiki.html", role =role, name=name)

@app.route('/supperadmin/listuser', methods=['GET', 'post'])
def supperadminlistuser():
    role = session.get('role')
    name = session.get('name')
    sql = "SELECT * from admin where role != " + str(session.get('userinfo')) + " order by id asc"
    listuser = db.engine.execute(sql)
    return render_template("/supper_admin/listuser.html", role =role, name = name, listuser=listuser)



@app.route('/supperadmin/detailuser', methods=['GET', 'post'])
def detailuser():
    id_user = request.args.get('id_user')
    role = session.get('role')
    name = session.get('name')
    data = []
    if request.method == 'GET':
        sql = "SELECT * from admin where id = " + str(id_user) + " order by id asc"
        detail = db.engine.execute(sql)
        for iii in detail:
            data.append({
                "name": iii['name'],
                "username": iii['username'],
                "create_date": iii['create_date'],
                "token_api": iii['token_api'],
                "id": iii['id'],
                "role": iii['role']
            })
    if request.method == 'POST':
        name = request.form['name']
        username = request.form['username']
        token_api = ''
        if role == 1:
            token_api = request.form['token_api']
        sql = "UPDATE admin set name = '"+name+"' ,  username = '"+username+"' ,  token_api = '"+token_api+"' where id = " + str(id_user) + " order by id asc"
        detail = db.engine.execute(sql)
        return redirect("/supperadmin/detailuser?id_user="+id_user)
    return render_template("/supper_admin/detailuser.html", role =role,name=name, data=data)

@app.route('/supperadmin/listhistory', methods=['GET', 'post'])
def listHistory():
    id_user = request.args.get('id_user')
    role = session.get('role')
    name = session.get('name')
    data = []
    if request.method == 'GET':
        sql = "SELECT * from history order by id asc"
        listHistory = db.engine.execute(sql)
        for iii in listHistory:
            sql1 = "SELECT * from admin where id = " + str(iii['admin_id'])
            detail = db.engine.execute(sql1)
            username = ""
            for item in detail:
                username = item['name']

            data.append({
                "id": iii['id'],
                "time": iii['create_date'],
                "mp3": iii['mp3'],
                "content": iii['content'],
                "username": username
            })
    return render_template("/supper_admin/listhistory.html", role =role, name =name, data=data)

@app.route('/supperadmin/listadmin', methods=['GET', 'post'])
def listadmin():
    role = session.get('role')
    name = session.get('name')
    sql = "SELECT * from admin where role = 1 order by id desc"
    listuser = db.engine.execute(sql)
    return render_template("/supper_admin/listadmin.html", role =role, name = name, listuser=listuser)

@app.route('/supperadmin/adduser', methods=['GET', 'post'])
def adduser():
    data = []
    role = session.get('role')
    name = session.get('name')
    if request.method == 'POST':
        fullame = request.form['name']
        username = request.form['username']
        password = request.form['password']
        role = 1;
        now = datetime.now()
        dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        con = db.engine.execute("INSERT INTO admin(name, active, username, password, create_date, role) "
                                "VALUES(%s, %s, %s, %s, %s, %s)", (fullame, 1, username, password, dateTime, role))
    return render_template("/supper_admin/adduser.html", role=role, name=name, data=data)
def tag_visible(element):
    if element.parent.name in ['style', 'script', 'head', 'footer', 'title', 'meta', '[document]']:
        return False
    if isinstance(element, Comment):
        return False
    return True

@app.route('/get_text', methods=['GET', 'post'])
def url_to_text():
    link = request.form['url']
    ext = tldextract.extract(link)
    domain = ext.domain
    url = Request(link, headers={'User-Agent': 'Mozilla/5.0'})
    html = urlopen(link).read()
    if domain == 'zingnews':
        html = gzip.decompress(html)
    content = ''
    text = text_from_html(html, content, link, domain)
    return text

def text_from_html(body, content, link, domain):
    try:
        sql = "SELECT * from domain_tag where domain = '" + str(domain) + "' and status =1"
        detail = db.engine.execute(sql)
        tag_main = ''
        tag_class = ''
        tag_content = ''
        type = ''
        for iii in detail:
            tag_main = iii['tag']
            tag_class = iii['class']
            tag_content = iii['content']
            type = iii['type']
        print(tag_main)
        print(tag_class)
        print(tag_content)
        print(type)
        soup = BeautifulSoup(body, 'html.parser')
        soup = soup.body
        if type == 1:
            soup = soup.find_all(tag_main, class_=tag_class)
        else:
            soup = soup.find_all(tag_main, id=tag_class)
        soup = soup[0].find_all(tag_content)
        for link in soup:
            link = link.findAll(text=True)
            visible_texts = filter(tag_visible, link)
            content += u"".join(t.strip() for t in visible_texts)+" "
    except Exception as e:
        print(e)
        soup = BeautifulSoup(body, 'html.parser')
        soup = soup.body
        link = soup.findAll(text=True)
        visible_texts = filter(tag_visible, link)
        content += ". "+u" ".join(t.strip() for t in visible_texts)
    return content

@app.route('/get_content_url', methods=['GET', 'post'])
def get_content_url():
    data = []
    listVoice = []
    listLanguage = []
    role = session.get('role')
    name = session.get('name')
    try:
        where = ""
        if session.get('userinfo') != 0:
            admin_id = session['userinfo']
            where = "AND admin_id = " + str(admin_id)
        sql = "SELECT * from content_url where status != 0 " + where + " AND type = 1 order by id desc"
        listHistoty = db.engine.execute(sql)
        for it in listHistoty:
            time = it['create_date']
            mp3 = it['mp3']
            data.append({
                "id": it['id'],
                "time": time,
                "mp3": mp3
            })
        listVoice = db.engine.execute("SELECT * from voice where status != 0 order by id asc")
        listLanguage = db.engine.execute("SELECT * from language where status != 0 order by id asc")
    except:
        return render_template("admin/getcontenturl.html", data=data, listVoice=listVoice, listLanguage=listLanguage, role=role,
                               name=name)
    return render_template("/admin/getcontenturl.html", data=data, listVoice=listVoice, listLanguage=listLanguage, role=role,
                               name=name)

@app.route('/speakContentUrl', methods=['GET','Post'])
def speakContentUrl():
    if request.method == 'POST':
        tts_language = request.form['tts_language']
        text = request.form['tts_text']
        tts_ssml_volume = request.form['tts_ssml_volume']
        tts_ssml_spk_rate = request.form['tts_ssml_spk_rate']
        path = "static/assets/audio/"
        if tts_language == 'vi':
            fileAudio = saveMp3(text, tts_ssml_volume, tts_ssml_spk_rate)
            now = datetime.now()
            admin_id = session['userinfo']
            dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
            con = db.engine.execute("INSERT INTO content_url(mp3, content,status, admin_id, type, create_date) "
                                    "VALUES(%s, %s, %s, %s, %s, %s)", (fileAudio, text, 1, admin_id, 1, dateTime))
        else:
            tts = gTTS(text, lang=tts_language)
            filemilisecond = round(time.time() * 1000)
            fileAudio = str(filemilisecond) + ".mp3"
            print(path + fileAudio)
            tts.save(path + fileAudio)
            now = datetime.now()
            admin_id = session['userinfo']
            dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
            con = db.engine.execute("INSERT INTO content_url(mp3, content,status, admin_id, type, create_date) "
                                    "VALUES(%s, %s, %s, %s, %s, %s)", (fileAudio, text, 1, admin_id, 1, dateTime))
    return path + fileAudio

@app.route('/supperadmin/addtagcontent', methods=['GET', 'post'])
def addtagcontent():
    data = []
    role = session.get('role')
    name = session.get('name')
    if request.method == 'POST':
        domain = request.form['text_domain']
        ext = tldextract.extract(domain)
        text_domain = ext.domain
        text_tag = request.form['text_tag']
        text_class = request.form['text_class']
        text_content = request.form['text_content']
        type = request.form['type']
        now = datetime.now()
        dateTime = now.strftime("%Y/%m/%d %H:%M:%S")
        con = db.engine.execute("INSERT INTO domain_tag(domain, tag, class, content, type, status, create_date) "
                                "VALUES(%s, %s, %s, %s, %s, %s, %s)", (text_domain, text_tag, text_class, text_content, type, 1, dateTime))
        return redirect("/supperadmin/listtagcontent", code=302)
    return render_template("/supper_admin/addtagcontent.html", role=role, name=name)

@app.route('/supperadmin/listtagcontent', methods=['GET', 'post'])
def listtagcontent():
    role = session.get('role')
    name = session.get('name')
    sql = "SELECT * from domain_tag"
    listdomain_tag = db.engine.execute(sql)
    return render_template("/supper_admin/listtagcontent.html", role =role, name = name, listdomain_tag=listdomain_tag)

@app.route('/supperadmin/detailtagcontent', methods=['GET', 'post'])
def detailtagcontent():
    id = request.args.get('id')
    role = session.get('role')
    name = session.get('name')
    data = []
    if request.method == 'GET':
        sql = "SELECT * from domain_tag where id = " + str(id)
        detail = db.engine.execute(sql)
        for iii in detail:
            data.append({
                "domain": iii['domain'],
                "tag": iii['tag'],
                "class": iii['class'],
                "content": iii['content'],
                "id": iii['id'],
                "status": iii['status'],
                "type": iii['type']
            })
    if request.method == 'POST':
        text_tag = request.form['text_tag']
        text_class = request.form['text_class']
        text_content = request.form['text_content']
        type = request.form['type']
        status = request.form['gridRadios']
        if role == 1:
            token_api = request.form['token_api']
        sql = "UPDATE domain_tag set tag = '"+text_tag+"' ,type = '"+type+"' ,  class = '"+text_class+"' ,  content = '"+text_content+"' ,  status = '"+status+"' where id = " + str(id)
        detail = db.engine.execute(sql)
        return redirect("/supperadmin/detailtagcontent?id="+id)
    print(data)
    return render_template("/supper_admin/detailtagcontent.html", role =role,name=name, data=data)
if __name__=="__main__":
    app.run(debug=True)

