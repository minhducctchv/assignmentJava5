create database Java5
go 
use Java5
go
if object_id('taikhoan') is not null
drop table taikhoan
go 
create table taikhoan
(
idtk int identity not null,
name nvarchar(50) not null,
email nvarchar(50) not null,
pass nvarchar(50) not null,
vaitro bit not null,
constraint pk_taikhoan primary key(idtk)
)

if object_id('sanpham') is not null
drop table sanpham
go 
create table sanpham
(
idsp int identity not null,
tensp nvarchar(50) not null,
sl int not null,
gia money not null,
hinh nvarchar(200) not null,
constraint pk_sanpham primary key(idsp)
)

if object_id('gioct') is not null
drop table gioct
go 
create table gioct
(
idtk int not null,
idsp int not null,
sl int not null,
constraint pk_gioct primary key(idtk, idsp),
constraint fk_taikhoan_gioct foreign key(idtk) references taikhoan,
constraint fk_sanpham_gioct foreign key(idsp) references sanpham
)

insert into sanpham values('sgk lop 1',100,12000,'maygiat.jpg')
select*from sanpham
select*from taikhoan