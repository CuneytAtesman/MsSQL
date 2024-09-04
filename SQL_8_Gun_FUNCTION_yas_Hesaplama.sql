

--FUNCTION
-- Verilen tarihlerde ya� hesaplama

select getdate() -- �u an tarih saat saniye

-------------------------------------------------------
create function fn_yas_hesapla(@tarih Date)
returns int
as
begin

declare @sonuc int
set @sonuc =DATEDIFF(Year,@tarih,getdate())
return @sonuc
end

-- TEST 
select dbo.fn_yas_hesapla('1970') -- parametreyi tek t�rnak i�inde gir. de�i�ken koyabilirsin.

select firstName as Ad�, LastName as Soyad�, BirthDate as [Do�um Tarihi], dbo.fn_yas_hesapla(BirthDate) as [Ka� Ya��nda] from Employees

--- 2 parametre almak. 1. parametrenin, 2. parametreye tam b�l�n�p b�l�nmedi�ini bulsun

create function fn_tam_bolunurmu (@s1 int,@s2 int)
returns nvarchar(10)
as
begin
declare @mesaj nvarchar(10)
if (@s1 % @s2 =0)
set @mesaj = 'B�l�n�r'
else
set @mesaj ='B�l�nmez'
return @mesaj
end

-- TEST

select dbo.fn_tam_bolunurmu (50,2)

--- VER�LEN KATEGOR�LERE A�T KA� �R�N VAR?

alter function fn_kategorili_urunadet(@kategoriID int)
returns int
as
begin
declare @sayac int
select @sayac = COUNT(p.productID) from products as p
where CategoryID = @kategoriID
return @sayac
end

--- TEST

select CategoryID,CategoryName,dbo.fn_kategorili_urunadet(CategoryID) as [�r�n Adet] from Categories
------------------------

-- Sipari�ler aras�ndadi ��k�� ve teslim tarihini bulmak

select *from Orders

select *, DATEDIFF(DAY,ShippedDate,RequiredDate)as [Teslim Tarihi] from Orders

-- Fonksiyon i�ine at
create function fn_teslim_tarihi (@shippedDate date, @requiredDate date)
returns int
as
begin
declare @sonuc int
set @sonuc = DATEDIFF(DAY,@shippedDate,@RequiredDate)
return @sonuc
end
-- TEST
select *,dbo.fn_teslim_tarihi(shippedDate,requiredDate) as [Teslim Tarihi] from Orders

-----------------------------------------------------

-- ID si verilen bir �al��an ka� adet sipari� alm��t�r?

select * from Employees
select * from Orders
select * from [Order Details] where orderID=11083
select * from Customers
select * from orders order by orderID desc
insert into [Order Details] values (11083,10,31,4,0)
select * from [Order Details] order by orderID desc


-- �nce sorguyu yaz
select e.firstName, e.LastName, od.Quantity from Employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where e.EmployeeID = 10

-------------
insert into Employees(FirstName,LastName)values ('C�neyt','Ate�man')
insert into Orders (CustomerID,EmployeeID) values ('ALFKI',10)--10 benim dbde benim ismim 10 da oldu�u i�in yaz�ld�. kendi db nizde ka�taysan�z onu yazmal�s�n.
insert into [Order Details] values (11083,10,31,4,0)


insert into Orders (CustomerID,EmployeeID) values ('AROUT',10)
insert into [Order Details] values (11083,60,31,40,0)

---------Fonksiyona at

Create function fn_satis_adedi_bul (@EmployeeID int)
returns int
as
begin
declare @adet int
select @adet = SUM (od.Quantity) from orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
where EmployeeID = @EmployeeID
return @adet
end

---------- TEST
select dbo.fn_satis_adedi_bul (10)
select FirstName,LastName,dbo.fn_satis_adedi_bul (EmployeeID) from Employees

-------------------------------------------------------



