

-- ID Birle�tirme i�lemleri - Kullan�c�n�n anlayaca�� �ekilde.

select NOTID,OGRAD as '��renci Ad�',OGRSOYAD as '��renci Soyad�', DERSAD as 'Ders Ad�',SINAV1,SINAV2,SINAV3,ORTALAMA,DURUM from tblnotlar inner join TBLDERSLER on TBLNOTLAR.DERS=TBLDERSLER.DERSID
inner join TBLOGRENCILER on TBLNOTLAR.OGRENCI=TBLOGRENCILER.OGRID

-- ALT SORGULAR

select * from TBLNOTLAR

update TBLNOTLAR set ortalama=(SINAV1+SINAV2+SINAV3)/3 where DERS=1
update TBLNOTLAR set DURUM=1 where ORTALAMA>=50
update TBLNOTLAR set DURUM=0 where ORTALAMA<=50

-- ALT SORGU -- Dersler tablosunda ismi matematik olan dersi g�r�ntelemek istiyoruz.

select * from TBLNOTLAR where ders=1 -- Bu �ekilde bunu g�rebiliriz.

-- SUB QUERY olarak sorgulayabiliriz.

SELECT * FROM TBLNOTLAR WHERE DERS=(SELECT DERSID FROM TBLDERSLER where DERSAD='Matematik')
SELECT * FROM TBLNOTLAR WHERE DERS=(SELECT DERSID FROM TBLDERSLER where DERSAD='Algorithma')

select upper ('merhaba')
select lower ('MERHABA')

select upper (OGRAD) as '��renci Ad�', upper (OGRSOYAD)as 'Soyad' from TBLOGRENCILER

select replace ('Merhaba bug�n hava so�uk', 'a','e')

select CHARINDEX ('a', 'SQL derslerine devam ediyoruz',20)
select len ('SQL derslerine devam ediyouz')

create database SatisVT 

use SatisVT

create table TBLKATEGORI 
(
KATEGORIID tinyint identity (1,1) primary key,
KATEGORIAD varchar(50)
)

select * from TBLKATEGORI

create table TBLURUNLER
(
URUNID int identity (1,1) primary key,
URUNAD varchar(50),
URUNMARKA varchar(50),
KATEGORI tinyint,
URUNALISFIYAT decimal (18,2),
URUNSATISFIYAT decimal (18,2),
URUNSTOK smallint check (URUNSTOK>0),
URUNDURUM bit default '1'
)

select * from TBLURUNLER

create table TBLPERSONEL
(
PERSONAELID smallint identity (1,1)primary key,
PERSONELADSOYAD varchar(50)
)

select * from TBLPERSONEL

create table TBLMUSTERI 
(
MUSTERIID int primary key identity (1,1),
MUSTERIAD VARCHAR (50),
MUSTERISOYAD VARCHAR(50),
MUSTERIULKE VARCHAR(50),
MUSTERIBAKIYE decimal (18,2)
)

select * from TBLMUSTERI

create table TBLHAREKET
(
HAREKETID int primary key identity (1,1),
URUN int,
MUSTERI smallint,
ADET int,
TUTAR decimal (18,2),
TARIH SMALLDATETIME
)

select * from TBLHAREKET

truncate table tblurunler


insert into TBLKATEGORI (KATEGORIAD) values ('B�LG�SAYAR')
insert into TBLKATEGORI (KATEGORIAD) values ('BEYAZE�YA')
insert into TBLKATEGORI (KATEGORIAD) values ('K���K EV ALETLER�')
insert into TBLKATEGORI (KATEGORIAD) values ('TELEV�ZYON')
insert into TBLKATEGORI (KATEGORIAD) values ('TELEFON')

select * from TBLKATEGORI


insert into TBLURUNLER (URUNAD,URUNMARKA,KATEGORI,URUNALISFIYAT,URUNSATISFIYAT,URUNSTOK) values
('BUZDOLABI','SIEMENS',2,4356,4588,10)

select * from TBLURUNLER