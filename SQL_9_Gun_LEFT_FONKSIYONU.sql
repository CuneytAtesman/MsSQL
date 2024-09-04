-- KARAKTER FONKS�YONLARI NORTWIND �zerinden
-- SOLDAN 5 KARAKTER VER�R
select LEFT ('www.atesman.com',5) -- sonuc  www.a
--SA�DAN 5 KARAKTER VER�R
select RIGHT ('www.atesman.com',5) -- sonuc n.com
--B�T�N KARAKTERLER�N SAYISINI VER�R
select LEN ('www.atesman.com') -- sonuc 15 karakter
--B�T�N KARAKTERLER� K���K YAZAR
select LOWER ('www.atesman.com')
--B�T�N KARAKTERLER� B�Y�K YAZAR
select UPPER ('www.atesman.com')
--LTRIM soldaki bo�luklar� al�r
select ltrim ('     c�neyt')
--RTRIM sa�daki bo�luklar� al�r
select LTRIM (' c�neyt     ')
--TRIM sa�daki ve soldaki t�m bo�luklar� al�r
select TRIM('    c�neyt    ')
--REVERSE tersden yazar 
select reverse ('www.atesman.com')
--SUBSTRING 5. karakterden 10. karaktere kadar al
select substring ('www.atesman.com',5,10)
/* STUFF 4.karakterden itibaren 9 karaktere kadar olan b�l�m� bununla de�i�tir. 
Ayn� siteyi farkl� domainlerde yay�nlamaya yard�mc� olur.*/
select STUFF ('www.atesman.com',4,8,'CuneytAtesman')
--CONCAT birle�tirme yapar
select concat ('C�neyt',' Ate�man')
-- PATINDEX i�inde a ge�en leri g�ster
select FirstName, PATINDEX ('%a%',FirstName)from Employees
-- REPLACE - De�i�tir X yerine bunu koy
select REPLACE ('5 saat sonra x ','X','GS-BJK Ma��na Gidiyorum')

---------------------------------------------
--MATEMAT�KSEL / SAYISAL FONKS�YONLAR

-- ABS Mutlak De�er say� eksi olsada art�s�n� verir
select ABS(-3)
select ABS (3)
insert into Products (productName,UnitPrice,UnitsInStock)
values
('�r�n100'-100,20)


-- HEPS� BURADA DB VE TABLOYA GE� PERSON TABLOSUNDA �ALI� �ST SOLDAN SE�

insert into tbl_person (adi,soyadi,yas)
values
('Ahmet','Demir',-26)

--TEST
select * from tbl_person

-- YAS ALANINA EKS� DE�ER G�R�LMES�N

insert into tbl_person (adi,soyadi,yas)
values
('Sel�uk','ASLAN',ABS(-20)) -- ABS Koyarsan eksi girilmez. Normal 20 girer.

--TEST

select * from tbl_person

-- POWER �st al�r
select POWER (3,2) -- 3 � 2 defa kendisiyle �arpmak demek 3*3 sonu� 9
select POWER (3,5) -- 3 � 5 kere �arpar 243 - /3*3 =9 / 9*3 = 27 / 27*3 = 81 / 81*3 = 243


-- SQUARE Kendisini kendisiyle �arpar karesini al�r

select SQUARE (8) -- 64

-- SQRT KareK�k Al�r

select SQRT (25) -- 25 sonucuna ula�mak i�in ka�la ka�� �arpmak gerekir -- sonu� 5

-- ROUND Yuvarlama
select ROUND (2848.2435,2) --sonu� 2435 35 , 50'den k���k oldu�u i�in a�a��ya yuvarlayacak 2848.2400,00 sonu� verecek
select ROUND (2848.2475,2) -- Sonu� 2475 75 50'den b�y�k oldu�u i�in yukar� yuvarlayacak  2848.25,00 sonu� verecek

-- RAND Convert etmek
select CAST (RAND() * 100 as int) -- mesela g�n�n �r�n�n� rastgele de�i�ik g�stermek i�in kullan�labilir
select RAND() -- 0 la 1 aras�nda rastgele say� �retir.

-- CEILING Tam say�y� yukar� yuvarlar
select CEILING (25.17) -- Tam say�y� yukar� yuvarlar sonu� 26
-- FLOOR Tam say�y� a�a�� yuvarlar
select FLOOR (25.17) -- A�a�� yuvarlar sonu� 25

-- SIGN Pazitif mi? Nagetif mi? Yoksa 0 m� oldu�unu s�yler
select SIGN(255.5) -- sonu� 1.0
select SIGN (-255.5) -- sonu� -1.0
select SIGN (0) -- sonu� 0

-- AVG Ortalama almak  / NORTHWIND a�
select AVG(UnitPrice) from products -- �r�n fiyatlar�n�n ortalamas�n� verir
-- fiyat kolonunu toplar kay�t s�ras�na b�ler ortalama al�r.

-- COUNT Say� bulmak
select COUNT(*) from products -- ka� �r�n var say� olarak verir.
select COUNT(*)from Customers -- ka� m��teri var say� olarak g�sterir.

-- MAX En y�ksek fiyat yada say� bul
select MAX(UnitPrice)from Products -- �r�n tablosundaki en y�ksek fiyat� sorgular
-- MIN En d���k fiyat� veya say�y� bulur
select MIN(UnitPrice)from Products

-- SUM t�m�n� topar
select SUM(UnitsInStock)from Products -- t�m stok miktar�n� g�sterir.

-- NEWID Ana sayfada farkl� �r�nler g�stermek
select top 4 * from Products order by NEWID()-- her yenilemede farkl� �r�nlerden 4 adet g�sterir.


-- TAR�HSEL HAZIR FONKS�YONLAR
select GETDATE() -- �u anki tarihi ve saati verir.

-- sipari� tarihi veya randevu tarihi girmek
insert into Employees (FirstName,LastName,HireDate)
values
('Deniz','Y�ld�r�m', GETDATE()+2)-- 2 g�n sonras� randevu

----------

insert into Employees (FirstName,LastName,HireDate)
values
('Aslan','Demirci', GETDATE()) -- �u anki sipari� tarihi

-- TEST
select * from Employees

-- Merkezi saat genellikle LONDRA
select GETUTCDATE() -- GMT-UTC 00:00 LONDRA SAAT�

-- SADECE YIL B�LG�S�N� ALMAK
select YEAR(GETDATE()) -- �imdiki zaman�n sadece y�l�
select YEAR(GETDATE())+2 -- 2 y�l sonras�n� ba�mak i�in +2 eklenebilir.

-- Sedce G�N almak
select DAY(GETDATE())
select DAY(GETDATE())+5

-- Sadece AY almak
select MONTH(GETDATE())

-- DETAYLAR ALMAK
select DATEPART(YEAR,GETDATE())
select DATEPART(MONTH,GETDATE())
select DATEPART(DAY,GETDATE())
select DATEPART(HOUR,GETDATE())
select DATEPART(MINUTE,GETDATE()) -- �u kadar dakikada giri� yapmazsan logout i�in kullan�labilir.
select DATEPART(SECOND,GETDATE())

-- KAYITLARI T�RK�E GET�RMEK

select DATENAME(dw,getdate())
set language turkish -- dil ayar�n� t�rk�e de�i�tirir.
set language german -- dil ayar�n� Almanca de�i�tirir.
set language English -- dil ayar�n� �ngilizce de�i�tirir.

-- TEST
select DATENAME(dw,getdate())

-- DATEADD Tarih ekle

select DATEADD(DAY,2,GETDATE()) -- Tarihe 2 g�n ekler.
select DATEADD(DAY,-2,GETDATE()) -- Tarihten 2 g�n eksiltir.

-- ISDATE 

select ISDATE('2012-02-29') -- Bu tarih ge�erliyse 1 verir - True
select ISDATE('2012-02-32') -- Tarihte 32 g�n �eken ay yok tarih ge�ersiz 0 verir - False gibi.

if ISDATE ('2022-04-31')=1
print 'Ge�erli Tarih'
else
print 'Ge�ersiz Tarih'

------------------------------

-- COALESCE
select * from customers
select companyname,Region,address,coalesce(Region,Address,'�leti�im Bilgisi Yok') from Customers
-- Region kolonu NULL ise adresi ver Region ve Adreste NULL ise "ileti�im bilgisi yok" yazar.

-- ISNUMERIC
select ISNUMERIC('A') -- Numara de�ilse 0 d�nd�r�r.
select ISNUMERIC('5') -- Numara varsa 1 d�nd�r�r.








