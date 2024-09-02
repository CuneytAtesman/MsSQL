-- NORMAL�ZASYON (Normalisation) T�m Projelere Planlama tablolar� ile ba�lan�r.

select * from products where SupplierID = 'Vestel' -- Bu �ekilde olsayd� Marka ad�yla, yanl�� yaz�ld���nda aramada ��kmazd�. ID yapmak gerekiyor Markalar�

-- tbl_Ogrenci (OgrenciID,Adi,Adres,telefon,OGRETMENID,bolumID
-- tbl_ogretmen (OgretmenID,Adi,Telefon,email...)
-- tbl_bolum (bolumID,adi,kampus,kurulustarihi)
-- tbl_fakulte (fakulteID,adi,)
-- tbl_sehir (sehirID,adi)
-- tbl_mahalle (mahalleID,adi,il�eID)
-- tbl_ilce (ilceID,Adi,sehirID)



-- tbl_ilac (ilacID,adi,barkod,uretimtarih,sontarih,ureticiID)
-- tbl_uretici (ureticiID,ureticiadi, vs)


-- tbl_yemek (yemekID,adi,turID) - kay�tlar  
-- tbl_yemekturu (turID,adi) -- kay�tlar� bu �ekilde olabilir. etli veya etsiz yemek veya tuzlu, tuzsuz yemek
-- tbl_musteri (musteriID,adi,adresi,telefonu,kackisilik)

-- Tablolar� birle�tirmek

select * from Products inner join Categories on Products.CategoryID = Categories.CategoryID 
-- �r�nlerin sorgusunda kategorilerin ayr�nt�l� t�m bilgilerini �a��rd�m. 
------------------------------------------------------------------------------------------
select Products.ProductName,Products.UnitPrice,Categories.CategoryName
-- �r�n tablosunu se�, �r�n ismini �a��r, �r�n fiyat�n� �a��r, kategori tablosundan kategori ismini �a��r.
-- �nce tablo ismi yaz�lacak NOKTA konup tablo i�inde ki b�l�m �a��r�lacak.
from Products
-- sonra �r�n tablosuna kategori inner join ile �a��r�lacak,
inner join Categories
on Products.CategoryID = Categories.CategoryID
-- �r�n tablosuna kategori ID eklenip kategorilerin i�inden kategori ID �a��r�lacak.
----------------------------------------------------------------------------------------------
-- ayn� tabloya supplier �retici eklemek
inner join Suppliers
on Products.SupplierID = Suppliers.SupplierID

-- ALIAS KULLANMAK. (KISALTMALAR)

/*AS kullanarak k�saltma yap�labiliyor.
�rnek tablonun sonuna as koyarak k�salt�labilir. 
Ayn� k�saltma sorgu i�inde tekrar gerekirse k�salt�larak kullan�labilir.
*/

select * from products as p inner join Categories as c on p.CategoryID = c.CategoryID

-- as kullan�lmadanda ayn� i�lem yap�labilir (select * from products p)
select * from products  p inner join Categories as c on p.CategoryID = c.CategoryID

--V�EW YARATMAK

create view vw_urun_kategori_marka_listesi as
select P.ProductName,p.UnitPrice,C.CategoryName
from Products as p
inner join Categories as c
on P.CategoryID = C.CategoryID

select * from vw_urun_kategori_marka_listesi 
-- sonu� hepsi bu sat�rda �a��r�labiliyor. databasede views klas�r�n�n alt�nda olu�turuluyor.

/* DAHA SONRA VIEW i�ine bir �ey eklemek i�in view klasoru i�inden yaratt���m�z view dosyas�na 
sa� klik, (Script view as) > Alter > new query editor window En ba�taki ALTER d�n��m�� olmal�.
ne eklenecekse bu �ekilde eklenir. */

select * from Customers
select customerID as IDler, CompanyName as �irketismi from Customers -- ID ve CompanyName ismini de��tirebiliriz. 

-- isimlerde Bo�luk burak�lacaksa k��eli parantez i�ine yaz�l�r. �rnek a�a��daki �irket ismi alan�
select customerID as IDler, CompanyName as [�irket �smi] from Customers




-- KOLON B�RLE�T�RME (T�m adres bilgilerini tek kolonda g�stermek)

select companyName as [�irket �smi],Address +', ' +PostalCode +', ' +City+', ' +Country as ADRES�M
from Customers




/* NULL �r�n say�lar�n� toplamak. Do�ru hesaplama yapt�rmak
NULL de�erei hesaplamaya dahil etmek i�in 0 atad�k.
*/

select productID, productName,UnitPrice,  ISNULL(UnitsOnOrder,0) from Products
select productName,UnitPrice * (UnitsInStock +ISNULL (UnitsOnOrder,0)) from Products


-- TABLO ���NDEK� DE�ERLER� T�RK�ELE�T�RMEK

select * from Employees
--KOLON BA�LIKLARINI DE���T�RME
select TitleOfCourtesy as �nvan,FirstName as Ad�,LastName as SoyAd� from Employees

--S�TUN ��� DE����KL�KLER

select firstName as Ad�, LastName as Soyad�, TitleOfCourtesy as [T�rk�e �nvan], 
[�ngilizce �nvan] = case TitleOfCourtesy 
when 'Ms.' then 'Bayan'
When 'Dr.' then 'Doktor'
else 'Say�n'
end
from Employees

-- SQL k�zar�kl�klar� kald�rmak i�in bu komutu kullan. CTRL + SHIFT + R

--***************************************************************************************
-- ADO.NET i�in tabloya, kolona veri kaydetmek
-- (insert into) tablo ad� (kolonlar�n ismi) values (kolon de�erleri)

select * from Products order by ProductID desc -- Alttaki kayd� en �stte g�rmek i�in sorgulat�yorum.

insert into Products (ProductName,UnitPrice,UnitsInStock)values ('C�neyt �r�n' , 10,35)

-- G�NCELLEME FORMUL�
-- update tablo ad� set kolon ad� = de�eri where sart
update products set ProductName = 'Atesman', UnitPrice = 500 where ProductID =78  -- hangi ID de�i�ecekse sona ekle

--*****************************************************************************************

-- S�ME FORMUL�
-- delete from products where productID = 78 
delete from products where productID = 78  -- �stte olu�turdu�umuz 78 ID sildi.






















