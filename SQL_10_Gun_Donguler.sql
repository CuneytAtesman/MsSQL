
-- NORTHWIND DB de �ALI�
-- D�NG�LER 

-- WHILE - 10 Olana Kadar Artt�r

declare @count int =0;
while @count < 10
begin
	print @count
	set @count += 1
end

-------------

-- IF ELSE

select count(*) from [order details] -- 2158 Adet Var
------------------------------------

declare @sayi int
select @sayi = count(*) from [order details] -- T�m kay�tlar� say� de�i�kenine atad�k.
if @sayi >2000
begin
	print 'Sipari� Detay Tablosundaki �r�nlerin Say�s� 2000 den fazlad�r'
end

else

begin
	print 'Sipari� Detay Tablosundaki �r�nlerin Say�s� 2000 den Azd�r'
end

----------------------

if YEAR (GETDATE()) %2 =0

	begin
	print '��inde Bulundu�umuz Y�l ikiye Tam B�l�n�r.'
	end
else
	begin
	print '��inde Bulundu�umuz Y�l ikiye Tam B�l�nmez.'
	end
---------------------------

select AVG(UnitPrice) from Products
-----------------------------
declare @ORTALAMAFIYAT decimal(15,2)
select @ORTALAMAFIYAT = AVG(UnitPrice) from Products
print 'Ortalama Fiyat = ' + CAST(@ORTALAMAFIYAT as nvarchar(5))

if (@ORTALAMAFIYAT > 30)
	begin
	print 'Ortalama Fiyat 30 dan B�y�kt�r.'
	end

else

	begin
	print 'Ortalama Fiyat 30 dan K���kt�r.'
	end

-- CASE - WHEN - THEN

-- CASE / BETWEEN Aras�ndakileri sorgula

select FirstName,HireDate, 'Durum'=
case
	when HireDate between '1994-01-01' and '1994-12-31'
	then 'Yeni �al��an'
	when HireDate between '1993-01-01' and '1993-12-31'
	then 'Eski �al��an'
	when HireDate between '1992-01-01' and '1992-12-31'
	then '�ok Eski �al��an'
end
from Employees

------------------
-- CONTINUE d�ng�lerde bu say�y� atla i�lem yapma anlam�nda.

declare @sayi int = 0
while (@sayi <= 4)
begin
	set @sayi = @sayi +1
	if (@sayi = 2) continue
	print @sayi
end
	print 'While D�ng�s� Bitti'

--- BREAK -- D�ng�y� durdurur.

declare @sayac int
set @sayac = 0
while(@sayac <10)
	begin
		print @sayac
		set @sayac = @sayac + 1
			if (@sayac * @sayac > 10)
				begin
					print 'Say�n�n Kendisiyle �arp�m� 10 De�erini Ge�ti'
					break
				end

	end

-- HEPS� BURADA DB YE GE�

-- TRANSACTION - Yanl��l�kla Silinen kayd� geri almak. ��lemi geri al�r.

select * from tbl_person

SELECT 
  FROM [hepsiburada].[dbo].[tbl_person]

  -- Person ID 1 sil 
  begin transaction -- �nce bunu �al��t�r. 
  delete from tbl_person where personID =2 -- silmen gerekeni sil.
  rollback transaction -- Yanl�� olduysa bununla geri getir. Begin ile ba�lat�p silmezsen geri alamazs�n.

  -- iyi bir sql yaz�l�m� �r�n silmeye izin vermez. Ayarlardan silinme izni verilmemeli.

  -- NOSQL, MONGODB H�zl� ama g�venlik sorunu var. Facebook, Twitter, �nstagram gibi, Bunlarda Transaction YOK. �L��K�SEL OLMAYAN VER� TABANLARI
  -- MSSQL,Oracle,MySql Bunlarda Transaction var. �L��K�SEL VER� TABANLARI

  -- COMMIT TRANSACTION / COMMIT Silmeyi onaylar bir daha geri alamazs�n.
  -- TRANSACTION i�lemini geri al�namaz hale getirmek i�in COMMIT TRANSACTION komutu kullan�l�r. Art�k geri almaz.

  begin transaction
  delete from tbl_person where personID = 9
  commit transaction -- Silme onaylanm�� olur.
  rollback transaction

  -- NORTWID DB d�n

  -- B�T�N TABLONUN YEDE��N� ALMAK
  select * into ProductsYEDEK from products
  -- TEST
  select * from ProductsYEDEK

  -- BAZI KOLONLARIN YEDE��N� ALMAK
  select ProductID,ProductName,UnitPrice into ProductsYEDEK2Kolonlar from Products
  -- TEST
  select * from ProductsYEDEK2Kolonlar

  -- F�YATI 10= ile 20= Aras�nda olan �r�nlerin yede�ini almak
  select * from products where UnitPrice >= 10 and UnitPrice <=20
  select * from products where UnitPrice between 10 and 20

  -- YEDEK ALMAK
   select * into Products3 from products where UnitPrice >= 10 and UnitPrice <=20
   select * into products4 from products where UnitPrice between 10 and 20

   -- TEST
   select * from Products3
   select * from products4


-- TRUNCATE Kullanmak.

   -- HEPS� BURADA DB ye GE�

   select * from tbl_person
/* Bu tabloyu komple silersem yeni kay�t 10 dan ba�lar. Ama m��teriye 1 den ba�latmak gerekiyor.
Bu tabloyu silerken TRUNCATE Kullanmka gerekir. 
Proje yazarken deneme aklemeleri yap�lm��sa bunlar� temizlemek i�in kullanabilirsin.
M��teriye g�t�rece�in zaman 1 den ba�latabilirsin.*/

truncate table tbl_person  -- Bu �ekilde silersek yeni kay�t 1 numaradan ba�lar.
-- tbl_Person VER� TABANI S�L�ND�
-- Tekrar 1 den ba�layarak yeni veri giriyoruz.

insert into tbl_person (adi,soyadi) values ('C�neyt','Ate�man')
-- TEST
select * from tbl_person -- 1 den ba�lad�


-- VER� TABANI YEDEK ALMAK - NORTWIND'e ge�.
/* Sa�da NORTHWIND> Sa� Tu� > Tasks > BackUp T�kla / Kay�t Yolunu de�i�tirmek istersen
a��lan pencerede REMOVE yap. Kendi yolunu belirle. Dosya ismi sonuna .bak koy*/

-- VER� TABANINI M��TER�YE veya Ba�ka MsSQL e y�klemek.
/* Sa�da DATABASE ye sa� Tu�
> Restore Databese > A��lan Pencerede DEVICE t�kla > ADD t�kla > Dosyay� Bul T�kla > OK > Tekrar OK.
DATABASE Kurulmu� Olur */








