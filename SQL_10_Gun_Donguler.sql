
-- NORTHWIND DB de ÇALIÞ
-- DÖNGÜLER 

-- WHILE - 10 Olana Kadar Arttýr

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
select @sayi = count(*) from [order details] -- Tüm kayýtlarý sayý deðiþkenine atadýk.
if @sayi >2000
begin
	print 'Sipariþ Detay Tablosundaki Ürünlerin Sayýsý 2000 den fazladýr'
end

else

begin
	print 'Sipariþ Detay Tablosundaki Ürünlerin Sayýsý 2000 den Azdýr'
end

----------------------

if YEAR (GETDATE()) %2 =0

	begin
	print 'Ýçinde Bulunduðumuz Yýl ikiye Tam Bölünür.'
	end
else
	begin
	print 'Ýçinde Bulunduðumuz Yýl ikiye Tam Bölünmez.'
	end
---------------------------

select AVG(UnitPrice) from Products
-----------------------------
declare @ORTALAMAFIYAT decimal(15,2)
select @ORTALAMAFIYAT = AVG(UnitPrice) from Products
print 'Ortalama Fiyat = ' + CAST(@ORTALAMAFIYAT as nvarchar(5))

if (@ORTALAMAFIYAT > 30)
	begin
	print 'Ortalama Fiyat 30 dan Büyüktür.'
	end

else

	begin
	print 'Ortalama Fiyat 30 dan Küçüktür.'
	end

-- CASE - WHEN - THEN

-- CASE / BETWEEN Arasýndakileri sorgula

select FirstName,HireDate, 'Durum'=
case
	when HireDate between '1994-01-01' and '1994-12-31'
	then 'Yeni Çalýþan'
	when HireDate between '1993-01-01' and '1993-12-31'
	then 'Eski Çalýþan'
	when HireDate between '1992-01-01' and '1992-12-31'
	then 'Çok Eski Çalýþan'
end
from Employees

------------------
-- CONTINUE döngülerde bu sayýyý atla iþlem yapma anlamýnda.

declare @sayi int = 0
while (@sayi <= 4)
begin
	set @sayi = @sayi +1
	if (@sayi = 2) continue
	print @sayi
end
	print 'While Döngüsü Bitti'

--- BREAK -- Döngüyü durdurur.

declare @sayac int
set @sayac = 0
while(@sayac <10)
	begin
		print @sayac
		set @sayac = @sayac + 1
			if (@sayac * @sayac > 10)
				begin
					print 'Sayýnýn Kendisiyle Çarpýmý 10 Deðerini Geçti'
					break
				end

	end

-- HEPSÝ BURADA DB YE GEÇ

-- TRANSACTION - Yanlýþlýkla Silinen kaydý geri almak. Ýþlemi geri alýr.

select * from tbl_person

SELECT 
  FROM [hepsiburada].[dbo].[tbl_person]

  -- Person ID 1 sil 
  begin transaction -- Önce bunu çalýþtýr. 
  delete from tbl_person where personID =2 -- silmen gerekeni sil.
  rollback transaction -- Yanlýþ olduysa bununla geri getir. Begin ile baþlatýp silmezsen geri alamazsýn.

  -- iyi bir sql yazýlýmý ürün silmeye izin vermez. Ayarlardan silinme izni verilmemeli.

  -- NOSQL, MONGODB Hýzlý ama güvenlik sorunu var. Facebook, Twitter, Ýnstagram gibi, Bunlarda Transaction YOK. ÝLÝÞKÝSEL OLMAYAN VERÝ TABANLARI
  -- MSSQL,Oracle,MySql Bunlarda Transaction var. ÝLÝÞKÝSEL VERÝ TABANLARI

  -- COMMIT TRANSACTION / COMMIT Silmeyi onaylar bir daha geri alamazsýn.
  -- TRANSACTION iþlemini geri alýnamaz hale getirmek için COMMIT TRANSACTION komutu kullanýlýr. Artýk geri almaz.

  begin transaction
  delete from tbl_person where personID = 9
  commit transaction -- Silme onaylanmýþ olur.
  rollback transaction

  -- NORTWID DB dön

  -- BÜTÜN TABLONUN YEDEÐÝNÝ ALMAK
  select * into ProductsYEDEK from products
  -- TEST
  select * from ProductsYEDEK

  -- BAZI KOLONLARIN YEDEÐÝNÝ ALMAK
  select ProductID,ProductName,UnitPrice into ProductsYEDEK2Kolonlar from Products
  -- TEST
  select * from ProductsYEDEK2Kolonlar

  -- FÝYATI 10= ile 20= Arasýnda olan ürünlerin yedeðini almak
  select * from products where UnitPrice >= 10 and UnitPrice <=20
  select * from products where UnitPrice between 10 and 20

  -- YEDEK ALMAK
   select * into Products3 from products where UnitPrice >= 10 and UnitPrice <=20
   select * into products4 from products where UnitPrice between 10 and 20

   -- TEST
   select * from Products3
   select * from products4


-- TRUNCATE Kullanmak.

   -- HEPSÝ BURADA DB ye GEÇ

   select * from tbl_person
/* Bu tabloyu komple silersem yeni kayýt 10 dan baþlar. Ama müþteriye 1 den baþlatmak gerekiyor.
Bu tabloyu silerken TRUNCATE Kullanmka gerekir. 
Proje yazarken deneme aklemeleri yapýlmýþsa bunlarý temizlemek için kullanabilirsin.
Müþteriye götüreceðin zaman 1 den baþlatabilirsin.*/

truncate table tbl_person  -- Bu þekilde silersek yeni kayýt 1 numaradan baþlar.
-- tbl_Person VERÝ TABANI SÝLÝNDÝ
-- Tekrar 1 den baþlayarak yeni veri giriyoruz.

insert into tbl_person (adi,soyadi) values ('Cüneyt','Ateþman')
-- TEST
select * from tbl_person -- 1 den baþladý


-- VERÝ TABANI YEDEK ALMAK - NORTWIND'e geç.
/* Saðda NORTHWIND> Sað Tuþ > Tasks > BackUp Týkla / Kayýt Yolunu deðiþtirmek istersen
açýlan pencerede REMOVE yap. Kendi yolunu belirle. Dosya ismi sonuna .bak koy*/

-- VERÝ TABANINI MÜÞTERÝYE veya Baþka MsSQL e yüklemek.
/* Saðda DATABASE ye sað Tuþ
> Restore Databese > Açýlan Pencerede DEVICE týkla > ADD týkla > Dosyayý Bul Týkla > OK > Tekrar OK.
DATABASE Kurulmuþ Olur */








