create database hepsiburada



use hepsiburada -- yazarsak soldaki tablodan hepsiburada se�mek zorunda kalmay�z.
create table tbl_categories
(
categoryID int identity(1,1) primary key, --identity (1,1) yapt���m�zda 1 kay�ttan ba�lay�p 1+1 artt�racak. (Primary key) ekledi�imizde ayn� kay�ttan 2. girilemez
catogoryName nvarchar(50) not NULL  -- not NULL yaparsak isim girilmek zorunda.

)

select * from tbl_Products
select * from tbl_categories

--formul
--insert into tablo ad� (Kolonlar) values (kolom de�erleri) ADO.NET yaz�yoruz. SQL de yap�lan her�ey ADO.NET


insert into tbl_Products 
(ProductName,Price,Kdv,CategoryID,SupplierID,StatusID)
values ('�r�n1',100.35,8,2,1,2)

select * from tbl_categories
select * from tbl_status
select * from tbl_Suppliers

insert into tbl_Suppliers (BrandName,KurulusTarihi,Adres)
values ('Vestel', getdate(),'�stanbul')
insert into tbl_Suppliers (BrandName,KurulusTarihi,Adres)
values ('Lenovo', getdate()+2,'�zmir')
insert into tbl_Suppliers (BrandName,KurulusTarihi,Adres)
values ('Asus', '2022-11-28', '�zmir')


-- tbl_misafir(misafirID,Adi,Yas;cinsiyet,tcno,telefon,sehirID,ulkeID)
--tbl_sehir (sehirID,SehirAdi)
--tbl_UlkeID (UlkeAdi,Adi,AlanKodu)


--INNER JOIN ( 2 tabloyu ba�lamak) Yabanc�l anahtar olarak ba�lan�r NORTWIND DB i�in

select * from products as p
inner join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =1

-- left join �r�n yoksa veya kategori silinmi�se yine g�sterir kategori hari�
select * from products as p
left join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =1

-- right join �r�n yoksa veya kategori silinmi�se yine g�sterir kategori hari�
select * from products as p
right join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =1


-- full outer join join �r�n yoksa veya kategori silinmi�se yine g�sterir kategori hari�
select * from products as p
full outer join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =5


-- inner join �r�n tablosundaki �r�n�n kar��l��� varsa �r�n listelenir.
/* left join - �r�n tablosunun hepsini getir. E�er �r�n�n kategorisinin kar��l��� yoksa 
�r�n�n kategori bilgisi alan� bo� g�r�n�r. �r�n g�r�n�r kategorisi g�r�nmez. 
kategorisi Silinmi�se bile �r�n g�r�n�r.*/

/* right join -- �r�n tablosundaki kategori ID nin kar��l��� olan �r�nler g�r�n�r ayn� zamanda kategori tablosundaki
fazladan olan kategori kay�tlarda listelenir. denem1 denem2 gibi deneme kategorileride ��kar.*/

/* full outer join  -- hem �r�n tablosunu, hem kategori listesini t�m kay�tlar� listeler.
�r�n olmasada kategorileri listeler.*/

select p.productID, p.ProductName,c.CategoryName, c.Description
from products as p inner join Categories as c on p.categoryID = c.CategoryID






