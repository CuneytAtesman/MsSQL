create database hepsiburada



use hepsiburada -- yazarsak soldaki tablodan hepsiburada seçmek zorunda kalmayýz.
create table tbl_categories
(
categoryID int identity(1,1) primary key, --identity (1,1) yaptýðýmýzda 1 kayýttan baþlayýp 1+1 arttýracak. (Primary key) eklediðimizde ayný kayýttan 2. girilemez
catogoryName nvarchar(50) not NULL  -- not NULL yaparsak isim girilmek zorunda.

)

select * from tbl_Products
select * from tbl_categories

--formul
--insert into tablo adý (Kolonlar) values (kolom deðerleri) ADO.NET yazýyoruz. SQL de yapýlan herþey ADO.NET


insert into tbl_Products 
(ProductName,Price,Kdv,CategoryID,SupplierID,StatusID)
values ('Ürün1',100.35,8,2,1,2)

select * from tbl_categories
select * from tbl_status
select * from tbl_Suppliers

insert into tbl_Suppliers (BrandName,KurulusTarihi,Adres)
values ('Vestel', getdate(),'Ýstanbul')
insert into tbl_Suppliers (BrandName,KurulusTarihi,Adres)
values ('Lenovo', getdate()+2,'Ýzmir')
insert into tbl_Suppliers (BrandName,KurulusTarihi,Adres)
values ('Asus', '2022-11-28', 'Ýzmir')


-- tbl_misafir(misafirID,Adi,Yas;cinsiyet,tcno,telefon,sehirID,ulkeID)
--tbl_sehir (sehirID,SehirAdi)
--tbl_UlkeID (UlkeAdi,Adi,AlanKodu)


--INNER JOIN ( 2 tabloyu baðlamak) Yabancýl anahtar olarak baðlanýr NORTWIND DB için

select * from products as p
inner join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =1

-- left join ürün yoksa veya kategori silinmiþse yine gösterir kategori hariç
select * from products as p
left join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =1

-- right join ürün yoksa veya kategori silinmiþse yine gösterir kategori hariç
select * from products as p
right join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =1


-- full outer join join ürün yoksa veya kategori silinmiþse yine gösterir kategori hariç
select * from products as p
full outer join Categories as c
on p.CategoryID = c.CategoryID where p.ProductID =5


-- inner join ürün tablosundaki ürünün karþýlýðý varsa ürün listelenir.
/* left join - ürün tablosunun hepsini getir. Eðer ürünün kategorisinin karþýlýðý yoksa 
ürünün kategori bilgisi alaný boþ görünür. Ürün görünür kategorisi görünmez. 
kategorisi Silinmiþse bile ürün görünür.*/

/* right join -- Ürün tablosundaki kategori ID nin karþýlýðý olan ürünler görünür ayný zamanda kategori tablosundaki
fazladan olan kategori kayýtlarda listelenir. denem1 denem2 gibi deneme kategorileride çýkar.*/

/* full outer join  -- hem ürün tablosunu, hem kategori listesini tüm kayýtlarý listeler.
ürün olmasada kategorileri listeler.*/

select p.productID, p.ProductName,c.CategoryName, c.Description
from products as p inner join Categories as c on p.categoryID = c.CategoryID






