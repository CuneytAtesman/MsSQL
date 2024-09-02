-- NORMALÝZASYON (Normalisation) Tüm Projelere Planlama tablolarý ile baþlanýr.

select * from products where SupplierID = 'Vestel' -- Bu þekilde olsaydý Marka adýyla, yanlýþ yazýldýðýnda aramada çýkmazdý. ID yapmak gerekiyor Markalarý

-- tbl_Ogrenci (OgrenciID,Adi,Adres,telefon,OGRETMENID,bolumID
-- tbl_ogretmen (OgretmenID,Adi,Telefon,email...)
-- tbl_bolum (bolumID,adi,kampus,kurulustarihi)
-- tbl_fakulte (fakulteID,adi,)
-- tbl_sehir (sehirID,adi)
-- tbl_mahalle (mahalleID,adi,ilçeID)
-- tbl_ilce (ilceID,Adi,sehirID)



-- tbl_ilac (ilacID,adi,barkod,uretimtarih,sontarih,ureticiID)
-- tbl_uretici (ureticiID,ureticiadi, vs)


-- tbl_yemek (yemekID,adi,turID) - kayýtlar  
-- tbl_yemekturu (turID,adi) -- kayýtlarý bu þekilde olabilir. etli veya etsiz yemek veya tuzlu, tuzsuz yemek
-- tbl_musteri (musteriID,adi,adresi,telefonu,kackisilik)

-- Tablolarý birleþtirmek

select * from Products inner join Categories on Products.CategoryID = Categories.CategoryID 
-- ürünlerin sorgusunda kategorilerin ayrýntýlý tüm bilgilerini çaðýrdým. 
------------------------------------------------------------------------------------------
select Products.ProductName,Products.UnitPrice,Categories.CategoryName
-- ürün tablosunu seç, ürün ismini çaðýr, ürün fiyatýný çaðýr, kategori tablosundan kategori ismini çaðýr.
-- önce tablo ismi yazýlacak NOKTA konup tablo içinde ki bölüm çaðýrýlacak.
from Products
-- sonra ürün tablosuna kategori inner join ile çaðýrýlacak,
inner join Categories
on Products.CategoryID = Categories.CategoryID
-- ürün tablosuna kategori ID eklenip kategorilerin içinden kategori ID çaðýrýlacak.
----------------------------------------------------------------------------------------------
-- ayný tabloya supplier üretici eklemek
inner join Suppliers
on Products.SupplierID = Suppliers.SupplierID

-- ALIAS KULLANMAK. (KISALTMALAR)

/*AS kullanarak kýsaltma yapýlabiliyor.
Örnek tablonun sonuna as koyarak kýsaltýlabilir. 
Ayný kýsaltma sorgu içinde tekrar gerekirse kýsaltýlarak kullanýlabilir.
*/

select * from products as p inner join Categories as c on p.CategoryID = c.CategoryID

-- as kullanýlmadanda ayný iþlem yapýlabilir (select * from products p)
select * from products  p inner join Categories as c on p.CategoryID = c.CategoryID

--VÝEW YARATMAK

create view vw_urun_kategori_marka_listesi as
select P.ProductName,p.UnitPrice,C.CategoryName
from Products as p
inner join Categories as c
on P.CategoryID = C.CategoryID

select * from vw_urun_kategori_marka_listesi 
-- sonuç hepsi bu satýrda çaðýrýlabiliyor. databasede views klasörünün altýnda oluþturuluyor.

/* DAHA SONRA VIEW içine bir þey eklemek için view klasoru içinden yarattýðýmýz view dosyasýna 
sað klik, (Script view as) > Alter > new query editor window En baþtaki ALTER dönüþmüþ olmalý.
ne eklenecekse bu þekilde eklenir. */

select * from Customers
select customerID as IDler, CompanyName as Þirketismi from Customers -- ID ve CompanyName ismini deðþtirebiliriz. 

-- isimlerde Boþluk burakýlacaksa kçþeli parantez içine yazýlýr. Örnek aþaðýdaki þirket ismi alaný
select customerID as IDler, CompanyName as [Þirket Ýsmi] from Customers




-- KOLON BÝRLEÞTÝRME (Tüm adres bilgilerini tek kolonda göstermek)

select companyName as [Þirket Ýsmi],Address +', ' +PostalCode +', ' +City+', ' +Country as ADRESÝM
from Customers




/* NULL ürün sayýlarýný toplamak. Doðru hesaplama yaptýrmak
NULL deðerei hesaplamaya dahil etmek için 0 atadýk.
*/

select productID, productName,UnitPrice,  ISNULL(UnitsOnOrder,0) from Products
select productName,UnitPrice * (UnitsInStock +ISNULL (UnitsOnOrder,0)) from Products


-- TABLO ÝÇÝNDEKÝ DEÐERLERÝ TÜRKÇELEÞTÝRMEK

select * from Employees
--KOLON BAÞLIKLARINI DEÐÝÞTÝRME
select TitleOfCourtesy as Ünvan,FirstName as Adý,LastName as SoyAdý from Employees

--SÜTUN ÝÇÝ DEÐÝÞÝKLÝKLER

select firstName as Adý, LastName as Soyadý, TitleOfCourtesy as [Türkçe Ünvan], 
[Ýngilizce Ünvan] = case TitleOfCourtesy 
when 'Ms.' then 'Bayan'
When 'Dr.' then 'Doktor'
else 'Sayýn'
end
from Employees

-- SQL kýzarýklýklarý kaldýrmak için bu komutu kullan. CTRL + SHIFT + R

--***************************************************************************************
-- ADO.NET için tabloya, kolona veri kaydetmek
-- (insert into) tablo adý (kolonlarýn ismi) values (kolon deðerleri)

select * from Products order by ProductID desc -- Alttaki kaydý en üstte görmek için sorgulatýyorum.

insert into Products (ProductName,UnitPrice,UnitsInStock)values ('Cüneyt Ürün' , 10,35)

-- GÜNCELLEME FORMULÜ
-- update tablo adý set kolon adý = deðeri where sart
update products set ProductName = 'Atesman', UnitPrice = 500 where ProductID =78  -- hangi ID deðiþecekse sona ekle

--*****************************************************************************************

-- SÝME FORMULÜ
-- delete from products where productID = 78 
delete from products where productID = 78  -- üstte oluþturduðumuz 78 ID sildi.






















