

/* UNION sorgusu  (NORTWIND üzerinden)


 2 veya daha fazla sorgunun sonuçlarýný birleþtirmek için kulanýlýr.
 Deðer tek tabloda döner. */

 select * from customers where city = 'London' -- customers tabloda 6 kayýt var
 select * from Suppliers where city = 'London' -- Suppliers tabloda 1 kayýt var / 2 ayrý tablodan þehir birleþtiriyoruz.

 select city from Customers union select city from Suppliers
 select city from Customers union select city from Suppliers order by City -- Ayný þehirden kaç tane varsa 1 tane yazar.
 select city from Customers union all select city from Suppliers order by City -- UNION ALL olursa 7 tane londra yazar.
 -- 2 tablodaki þehirleri aldý ve hepsini tek tek gösterdi.

 ---------------------------------------------------------------------------------------

 /* EXISTS Sorgusu Alt sorgudan (Parantez içindeki)dönen sonuca göre iþlem yapar. Varsa sýrala anlamýnda.
	EXISTS yerine NOT EXSISTS kullanýlabilir. */

	select SupplierID,CompanyName from Suppliers where exists (select ProductName,UnitPrice from products where UnitPrice > 20) order by SupplierID -- sonuç var
	select SupplierID,CompanyName from Suppliers where not exists (select ProductName,UnitPrice from products where UnitPrice > 2220) order by SupplierID
	-- sonuç döndürmüyorsa Not Exists kullan.
-------------------------------------------------------------------------------------------


 /* VIEW sorgusu. En çok kullanýldýðý yerler: JOIN ile tablolarý birleþtirmek. Hýzlý SELECT */

 select * from products -- Bu ürün tablosunu daha hýzlý yüklemek için view yaratýp oradan çaðýrabiliriz.

 create view vw_urunleri_listele as select * from Products -- view yaratýldý

 select * from vw_urunleri_listele -- Yazýlým tarafýndan bu þekilde çaðýrýlýr. 
 ------------------------------------------------------------------------------------------

 /* View ürün listesi içinden belirli kolonlarý göstermek.
 1- soldan view kalsorunu aç
 2- vw_urunleri_listele view sað týkla
 3- script view as - seç
 4- ALTER to - týkla
 5- New Query Editor windowsa týkla

çýkan sonuç aþaðýdaki gibi olur.

SET QUOTED_IDENTIFIER ON
GO

 ALTER view [dbo].[vw_urunleri_listele] as select * from Products
GO

Göstermek istediklerini ekleyebilirsin. ÖRNEK:

SET QUOTED_IDENTIFIER ON
GO

 ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName from Products
GO

-- ProductID ve ProductName göstersin istiyorsam. Deðiþtirip sorgu penceresinin hepsini seçip execute yap. */

select * from vw_urunleri_listele -- sonuç sadece productID ve ProductName gelir. Gereksiz kolonlarý göstermemek için ve daha hýzlandýrmak için kullan.

/*
ALTER view [dbo].[vw_urunleri_listele] as select ProductID,ProductName,UnitPrice,CategoryName from Products
 inner join Categories on Products.CategoryID = Categories.CategoryID -- categori eklemek istersen inner join ile akleyebilirsin. 
 as kullanarak kýsaltabilirsin.
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

  -- view içinde order by kullanýlmaz. 

  select * from vw_urunleri_listele order by ProductName -- view kullandýðýn yerde order by yapabilirsin.
  select * from Products
  
  -- INSERT-UPDATE_DELETE kullanlmaz. Sadece SELECT kullanýlýr.
  -- Ýsimsiz kolon býrakýlmaz. Mesela SUM kullanacaksak AS ile isim vermeliyiz.
  -- Parametre almaz. 
  select * from products where UnitPrice > 20 and UnitPrice < 40
  select * from vw_urunleri_listele where UnitPrice > 20 and UnitPrice < 40

  26 dersten devam et