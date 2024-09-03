

/* UNION sorgusu  (NORTWIND �zerinden)


 2 veya daha fazla sorgunun sonu�lar�n� birle�tirmek i�in kulan�l�r.
 De�er tek tabloda d�ner. */

 select * from customers where city = 'London' -- customers tabloda 6 kay�t var
 select * from Suppliers where city = 'London' -- Suppliers tabloda 1 kay�t var / 2 ayr� tablodan �ehir birle�tiriyoruz.

 select city from Customers union select city from Suppliers
 select city from Customers union select city from Suppliers order by City -- Ayn� �ehirden ka� tane varsa 1 tane yazar.
 select city from Customers union all select city from Suppliers order by City -- UNION ALL olursa 7 tane londra yazar.
 -- 2 tablodaki �ehirleri ald� ve hepsini tek tek g�sterdi.

 ---------------------------------------------------------------------------------------

 /* EXISTS Sorgusu Alt sorgudan (Parantez i�indeki)d�nen sonuca g�re i�lem yapar. Varsa s�rala anlam�nda.
	EXISTS yerine NOT EXSISTS kullan�labilir. */

	select SupplierID,CompanyName from Suppliers where exists (select ProductName,UnitPrice from products where UnitPrice > 20) order by SupplierID -- sonu� var
	select SupplierID,CompanyName from Suppliers where not exists (select ProductName,UnitPrice from products where UnitPrice > 2220) order by SupplierID
	-- sonu� d�nd�rm�yorsa Not Exists kullan.
-------------------------------------------------------------------------------------------


 /* VIEW sorgusu. En �ok kullan�ld��� yerler: JOIN ile tablolar� birle�tirmek. H�zl� SELECT */

 select * from products -- Bu �r�n tablosunu daha h�zl� y�klemek i�in view yarat�p oradan �a��rabiliriz.

 create view vw_urunleri_listele as select * from Products -- view yarat�ld�

 select * from vw_urunleri_listele -- Yaz�l�m taraf�ndan bu �ekilde �a��r�l�r. 
 ------------------------------------------------------------------------------------------

 /* View �r�n listesi i�inden belirli kolonlar� g�stermek.
 1- soldan view kalsorunu a�
 2- vw_urunleri_listele view sa� t�kla
 3- script view as - se�
 4- ALTER to - t�kla
 5- New Query Editor windowsa t�kla

��kan sonu� a�a��daki gibi olur.

SET QUOTED_IDENTIFIER ON
GO

 ALTER view [dbo].[vw_urunleri_listele] as select * from Products
GO

G�stermek istediklerini ekleyebilirsin. �RNEK:

SET QUOTED_IDENTIFIER ON
GO

 ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName from Products
GO

-- ProductID ve ProductName g�stersin istiyorsam. De�i�tirip sorgu penceresinin hepsini se�ip execute yap. */

select * from vw_urunleri_listele -- sonu� sadece productID ve ProductName gelir. Gereksiz kolonlar� g�stermemek i�in ve daha h�zland�rmak i�in kullan.

/*
ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName,UnitPrice,CategoryName from Products
 inner join Categories on Products.CategoryID = Categories.CategoryID -- categori eklemek istersen inner join ile akleyebilirsin. 
 as kullanarak k�saltabilirsin.
 */

 select * from vw_urunleri_listele -- ProductID, ProductName, UnitPrice, CategoryName kolon gelir.

 
 ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName,UnitPrice,CategoryName from Products
 inner join Categories on Products.CategoryID = Categories.CategoryID
GO


 ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName,UnitPrice,CategoryName,CompanyName from Products as p
 inner join Categories as c on p.CategoryID = c.CategoryID
 inner join Suppliers as s on p.SupplierID = s.supplierID
GO

/* ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName,UnitPrice,CategoryName, CompanyName from Products as p
 inner join Categories as c on P.CategoryID = C.CategoryID
 inner join Suppliers on as s on p.SupplierID = s.supplierID
GO

Company Name de ekledik */
 
  select * from vw_urunleri_listele

  -- view i�inde order by kullan�lmaz. 

  select * from vw_urunleri_listele order by ProductName -- view kulland���n yerde order by yapabilirsin.
  select * from Products
  
  -- INSERT-UPDATE_DELETE kullanlmaz. Sadece SELECT kullan�l�r.
  -- �simsiz kolon b�rak�lmaz. Mesela SUM kullanacaksak AS ile isim vermeliyiz.
  -- Parametre almaz. 
  select * from products where UnitPrice > 20 and UnitPrice < 40
  select * from vw_urunleri_listele where UnitPrice > 20 and UnitPrice < 40

  26 dersten devam et