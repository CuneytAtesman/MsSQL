select * from Products

-- NORTWIND / PROCEDURE - CRUD - CREATE

create procedure sp_Product_Insert
(
@ProductName nvarchar(40),
@UnitPrice money,
@UnitsInStock smallint

)
as
insert into products (ProductName,UnitPrice,UnitsInStock)
values (@ProductName,@UnitPrice,@UnitsInStock)

--Nortwind-Programmability klasorunde (sp_Product_Insert) stor prosedur olustu
-- Test
execute sp_Product_Insert 'Televizyon',100,40 -- eklemeyi yap
select * from Products order by ProductID desc -- En �stte ��kar sorgula

-- Daha sonra Bir kolon daha eklemek istersek
-- Stor Poesediri sa� tu�la a�. ALterle a�. �rnek ReorderLeveli eklemek

/*ALTER procedure [dbo].[sp_Product_Insert]
(
@ProductName nvarchar(40),
@UnitPrice money,
@UnitsInStock smallint,
@ReorderLevel smallint

)
as
insert into products (ProductName,UnitPrice,UnitsInStock,ReorderLevel)
values (@ProductName,@UnitPrice,@UnitsInStock,@ReorderLevel)
GO
*/

exec sp_Product_Insert 'Masa',1000,500,1 -- Ekleme yap
select *from Products order by ProductID desc -- Sorgula

-- Stor Procedure'de UPDATE


create procedure sp_Product_Update_Yap 
(
@ProductName nvarchar(40),
@UnitPrice money,
@UnitInStock smallint,
@ProductID int
)
as
update products set ProductName=@ProductName, UnitPrice=@UnitPrice,UnitsInStock=@UnitInStock where ProductID=@ProductID


-- Stor procedure DELETE

create procedure sp_Product_Delete
(
@productID int
)
as
delete from products where ProductID=@productID
-- sadece productID silmek i�in
-- �rnek
execute sp_Product_Delete 80 -- 80 nolu ID yi siler. Uzun uzun yazmadan stor prosed�rden k�sa yolla silme ger�ekle�ir.
--Update, �nsert, Delete i�in stor prosed�rler i�lemi k�salt�r.
select * from products order by ProductID desc -- 80 nolu ID silindi


-- Stor prosedur SELECT

create procedure sp_Products_Select
(
@UnitPrice_baslangic money,
@UnitPrice_bitis money
)
as
select * from Products where UnitPrice > @UnitPrice_baslangic and UnitPrice < @UnitPrice_bitis

-- yaratt�ktan sonra sorgula

execute sp_Products_Select 10,20 -- fiyatlar 10 ve 20 aras�nda olanlar� sorgulad�


