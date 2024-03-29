from msilib import type_nullable

from docx import text
from flask.views import MethodView
from sqlalchemy import Column, Integer, String, Float, Time, ForeignKey, Boolean,Date, DateTime
from sqlalchemy.orm import relationship

from app import db, admin

from flask import render_template
from flask import redirect

from flask_admin.contrib.sqla import ModelView
from flask_admin import BaseView, expose
from flask_login import UserMixin,current_user, logout_user

from flask_wtf import FlaskForm
from wtforms import SelectField



class Admin(db.Model, UserMixin):
    __tablename__ = "admin"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    active = Column(Boolean, default=True)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    role = Column(Integer)
    create_date = Column(DateTime)
    token_api = Column(String(50), nullable=False)


    def __str__(self):
        return self.name

class SupperAdmin(db.Model, UserMixin):
    __tablename__ = "supper_admin"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    active = Column(Boolean, default=True)
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    create_date = Column(DateTime)

    def __str__(self):
        return self.name


class paper(db.Model, UserMixin):
    __tablename__ = "paper"

    id = Column(Integer, primary_key=True, autoincrement=True)
    title = Column(String(255))
    url = Column(String(255))
    mp3 = Column(String(100))
    data_id = Column(Float)
    active = Column(Boolean, default=True)
    create_date = Column(DateTime)


    def __str__(self):
        return self.name


class hítory(db.Model, UserMixin):
    __tablename__ = "history"

    id = Column(Integer, primary_key=True, autoincrement=True)
    mp3 = Column(String(100))
    content = Column(db.Text(10000000))
    status = Column(Boolean, default=True)
    admin_id = Column(Integer)
    type = Column(Integer)
    create_date = Column(DateTime)


    def __str__(self):
        return self.name


class voice(db.Model, UserMixin):
    __tablename__ = "voice"

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255))
    mp3 = Column(String(255))
    data_name = Column(String(255))
    data_id = Column(String(255))
    status = Column(Boolean, default=True)
    create_date = Column(DateTime)


    def __str__(self):
        return self.name


# class KhachHang(db.Model):
#     __tablename__ = "khachhang"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     Quy_Danh = Column(String(100), nullable=False)
#     Ten_Khach_Hang = Column(String(200), nullable=False)
#     Dia_Chi = Column(String(200), nullable=True)
#     CMND = Column(Integer, nullable=False)
#     Email = Column(String(50), nullable=False)
#     SDT = Column(Integer, nullable=False)
#     Ghi_Chu = Column(String(50), nullable=False)
#     Phieu_Dat_Cho = relationship('PhieuDatCho', backref='khachhang', lazy=True)
#     Hanh_Ly = relationship('HanhLy', backref='khachhang', lazy=True)
#     def __str__(self):
#         return self.Ten_Khach_Hang
#
# class HanhLy(db.Model):
#     __tablename__ = "hanhly"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     Thong_Tin_Hanh_Ly = Column(String(150),nullable=False)
#
#     Khach_Hang_id = Column(Integer, ForeignKey(KhachHang.id), nullable=False)
#
# class SanBay(db.Model):
#     __tablename__ = "sanbay"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     Ten_San_Bay = Column(String(100), nullable=True)
#     San_Bay_Trung_Gian = relationship('SanBayTrungGian', backref='sanbay', lazy=False)
#     chuyen_bay = db.relationship('ChuyenBay', primaryjoin='or_(SanBay.id==ChuyenBay.San_Bay_Di_id, SanBay.id==ChuyenBay.San_Bay_Den_id)',
#                               lazy = False) #'dynamic')
#
#     def __str__(self):
#         return self.Ten_San_Bay
#
# class ChuyenBay(db.Model):
#     __tablename__ = "chuyenbay"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     name=Column(String(100),nullable=False)
#     Thoi_Gian_Bay = Column(Time, nullable=True)
#     Ngay_Bay = Column(Date, nullable=True)
#     Thoi_Gian_Ha = Column(Time, nullable=True)
#     Ngay_Ha_Canh = Column(Date, nullable=True)
#     So_Luong_Ghe_Loai_1 = Column(Integer, default= 60, nullable=False)
#     So_Luong_Ghe_Loai_2 = Column(Integer, default= 70,  nullable=False)
#     Gia_Ve_Loai_1 = Column(Float, nullable=False)
#     Phieu_Dat_Cho_id = relationship('PhieuDatCho', backref='chuyenbay', lazy=True)
#     San_Bay_TG_id = relationship('SanBayTrungGian', backref='chuyenbay', lazy=True)
#
#     San_Bay_Di_id = Column(Integer, ForeignKey('sanbay.id'), nullable=False)
#     San_Bay_Den_id = Column(Integer, ForeignKey('sanbay.id'), nullable=False)
#
#     San_Bay_Di = db.relationship('SanBay', foreign_keys='ChuyenBay.San_Bay_Di_id')
#     San_Bay_Den = db.relationship('SanBay', foreign_keys='ChuyenBay.San_Bay_Den_id')
#
#     def __str__(self):
#         return self.name
#
# class PhieuDatCho(db.Model):
#     __tablename__ = "phieudatcho"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     Khach_Hang_id = Column(Integer, ForeignKey(KhachHang.id), nullable=False)
#     Ma_Chuyen_Bay_id = Column(Integer, ForeignKey(ChuyenBay.id), nullable=False)
#     Gia_Tien = Column(Float, nullable=False)
#     Thoi_Gian_Dat_ve = Column(Date, nullable=True)
#     #Thoi_Gian_Huy_Ve =Column(Date, nullable=False)
#     Tinh_Trang_Chua_Thanh_Toan = Column(Integer, nullable= True, default=0)
#     Tinh_Trang_Da_Thanh_Toan = Column(Integer, nullable= True,default= 1)
#     Ve_id = relationship('Ve', backref='PhieuDatCho', lazy=True)
#
#
# class LichSuGiaoDich(db.Model):
#     __tablename__ = "lichsugiaodich"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     Ma_Chuyen_Bay = Column(Integer, ForeignKey(ChuyenBay.id), nullable=False)
#     Ngay_Bay = Column(Date, nullable=True)
#     Ma_Phieu_Dat_Cho_id = Column(Integer, ForeignKey(PhieuDatCho.id), nullable=False)
#
#
# class SanBayTrungGian(db.Model):
#     __tablename__ = "sanbaytrunggian"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     San_Bay_Id = Column(Integer, ForeignKey(SanBay.id), nullable=False)
#     Ma_Chuyen_Bay = Column(Integer, ForeignKey(ChuyenBay.id), nullable=False)
#     Thoi_Gian_Dung_Toi_Thieu = Column(Time, nullable=False)
#     Thoi_Gian_Dung_Toi_Da = Column(Time, nullable=False)
#
#
# class Ve(db.Model):
#     __tablename__ = "ve"
#     id = Column(Integer, primary_key=True, autoincrement=True)
#     Ma_Phieu_Dat_Cho_id = Column(Integer, ForeignKey(PhieuDatCho.id), nullable=False)
#     Thoi_Gian_Dat_ve = Column(Date, nullable=True)
#     Gia_Tien = Column(Float, nullable=False)
#
# class AuthenticatedView(ModelView):
#     def is_accessible(self):
#         return current_user.is_authenticated
#
# class SanBayModelView(AuthenticatedView):
#     column_display_pk = True
#     can_create = True
#     can_export = True
#     form_columns = ('Ten_San_Bay',)
#
# class SanBayTGModelView(AuthenticatedView):
#        column_display_pk = True
#        can_create = True
#        can_export = True
#        can_delete = False
#
#
# class ChuyenBayModelView(AuthenticatedView):
#     can_create = True
#     can_export = True
#     form_columns = ('San_Bay_Di','San_Bay_Den','name','Ngay_Bay','Thoi_Gian_Bay','So_Luong_Ghe_Loai_1','Gia_Ve_Loai_1','Thoi_Gian_Ha','Ngay_Ha_Canh')
#
#
#
#
# class AboutUsView(BaseView):
#     @expose("/")
#     def index(self):
#         return self.render("admin/chart.html")
#
#     def is_accessible(self):
#         return current_user.is_authenticated
#
# class OrderDetail(BaseView):
#     @expose("/")
#     def index(self):
#         q = ChuyenBay.query.all()
#         return self.render("admin/OrderDetail.html",q=q)
#     def is_accessible(self):
#         return current_user.is_authenticated
#
#
# class PhieuDatCho_view(BaseView):
#     @expose("/")
#     def phieudatcho(self):
#         q = PhieuDatCho.query.all()
#         return self.render("admin/PhieuDatCho.html",q=q)
#     def is_accessible(self):
#         return current_user.is_authenticated
#
#
# class Ve_view(BaseView):
#     @expose("/")
#     def Ve(self):
#         q = Ve.query.all()
#         return self.render("admin/Ve.html",q=q)
#     def is_accessible(self):
#         return current_user.is_authenticated
#
# class LogoutView(BaseView):
#     @expose("/")
#     def index(self):
#         logout_user()
#         return redirect("/admin")
#
#     def is_accessible(self):
#         return current_user.is_authenticated
#
# class Form(FlaskForm):
#     San_Bay_Di = SelectField('San_Bay_Di', choices=[])
#     San_Bay_Den = SelectField('San_Bay_Den', choices=[])


# admin.add_view(SanBayModelView(SanBay, db.session))
# admin.add_view(SanBayTGModelView(SanBayTrungGian, db.session))
# admin.add_view(ChuyenBayModelView(ChuyenBay, db.session))
# admin.add_view(OrderDetail(name ="Chi Tiết Chuyến Bay"))
# admin.add_view(PhieuDatCho_view(name ="Chi Tiết Phiếu Đặt Chỗ"))
# admin.add_view(Ve_view(name ="Chi Tiết Số Lượng Vé"))
# admin.add_view(AboutUsView(name="Thống Kê"))
# admin.add_view(LogoutView(name="Logout"))


if __name__ == "__main__":
    db.create_all()
