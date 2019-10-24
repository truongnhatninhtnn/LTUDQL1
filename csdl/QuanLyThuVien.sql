create database QuanLyThuVien1
use QuanLyThuVien1
create table NHANVIEN(
MaNhanVien nchar(10) not null,
HoTen nvarchar(50),
NgaySinh datetime,
SDT nchar(20),
DiaChi nvarchar(50),
Quequan nvarchar(50),
primary key(MaNhanVien)
)
create table SACH(
MaSach nchar(10) not null,
TenSach nvarchar(50),
MaTacGia nchar(10) not null,
MaTheLoai nchar(10)not null,
MaNSX nchar(10) not null,
NamSX datetime,
NgayNhap datetime,
GiaTri float,
NguoiTiepNhan nchar(10),
primary key(MaSach)
)
create table TACGIA(
MaTacGia nchar(10) not null,
TenGiacGia nvarchar(50),
NgaySinh datetime,
TheLoaiSach nchar(10),
primary key(MaTacGia)
)
create table THELOAI(
MaTheLoai nchar(10) not null,
TenTheLoai nvarchar(50),
primary key (MaTheLoai)
)
create table NHASANXUAT(
MaNSX nchar(10) not null,
TenNSX nvarchar(50),
DiaChi nvarchar(50),
ThongTinNguoiDaiDien nvarchar(50),
primary key(MaNSX)
)
create table DOCGIA(
MaDocGia nchar(10),
MaThe nchar(10) not null,
HoTen nvarchar(50),
NgaySinh datetime,
DiaChi nvarchar(50),
Email nvarchar(50),
primary key(MaDocGia)
)
create table THEDOCGIA(
MaThe nchar(10) not null,
MaDocGia nchar(10),
NgayBatDau datetime,
NgayKetThuc datetime,
primary key(MaThe)
)
create table MUONSACH(
MaMuonSach nchar(10) not null,
MaThe nchar(10),
MaDocGia nchar(10),
NgayMuon datetime,
NgayTra datetime,
MaSach nchar(10),
MaNhanVien nchar(10),
primary key(MaMuonSach)
)
create table TRASACH(
MaTraSach nchar(10) not null,
MaMuonSach nchar(10) not null,
MaThe nchar(10),
MaSach nchar(10),
MaNhanVien nchar(10),
MaDocGia nchar(10),
NgayMuon datetime,
NgayTra datetime,
primary key(MaTraSach,MaMuonSach)
)
create table TIENPHAT(
MaThe nchar(10) not null,
MaDocGia nchar(10) not null,
MaSach nchar(10) not null,
NgayThuTien datetime,
LyDo nvarchar(50),
TienNo float,
SoTienThu float
primary key(MaThe,MaDocGia,MaSach)
)
alter table SACH add constraint fk_SACH_THELOAI foreign key (MaTheLoai) references THELOAI(MaTheLoai)
alter table SACH add constraint fk_SACH_TACGIA foreign key(MaTacGia) references TACGIA(MaTacGia)
alter table SACH add constraint fk_SACH_NSX foreign key (MaNSX) references NHASANXUAT(MaNSX)
alter table DOCGIA add constraint fk_DOCGIA_THEDOCGIA foreign key (MaThe) references THEDOCGIA(MaThe)
alter table THEDOCGIA add constraint fk_THEDOCGIA_DOCGIA foreign key (MaDocGia) references DOCGIA(MaDocGia)
alter table MUONSACH add constraint fk_MUONSACH_THEDOCGIA foreign key(MaThe) references THEDOCGIA(MaThe)
alter table MUONSACH add constraint fk_MUONSACH_NHANVIEN foreign key(MaNhanVien) references NHANVIEN(MaNhanVien)
alter table MUONSACH add constraint fk_MUONSACH_SACH foreign key(MaSach) references SACH(MaSach)
alter table TRASACH add constraint fk_TRASACH_NHANVIEN foreign key(MaNhanVien) references NHANVIEN(MaNhanVien)
alter table TRASACH add constraint fk_TRASACH_THEDOCGIA foreign key(MaThe) references THEDOCGIA(MaThe)
alter table TRASACH add constraint fk_TRASACH_SACH foreign key(MaSach) references SACH(MaSach)
alter table TRASACH add constraint fl_TRASACH_MUONSACH foreign key(MaMuonSach) references MUONSACH(MaMuonSach)
alter table TIENPHAT add constraint fk_TIENPHAT_THEDOCGIA foreign key (MaThe) references THEDOCGIA(MaThe)
alter table TIENPHAT add constraint fk_TIENPHAT_DOCGIA foreign key (MaDocGia) references DOCGIA(MaDocGia)

