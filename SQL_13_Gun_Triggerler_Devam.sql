-----------G�NCELLEME OLURSA sipari�i ald� sipari� adedini de�i�tirmek isterse

alter trigger trg_stok_guncelle2 on [order details]
for update
as
	begin
	   
		declare @satisAdedi int, @urunID int,@yenisatisAdedi int

		select @satisAdedi = Quantity, @urunID=productID from deleted

		select @yenisatisAdedi=Quantity, @urunID=productID from inserted

		if(@yenisatisAdedi> @satisAdedi)-- sat�� adedi stoktan fazla olamaz.

			begin
			update products set UnitsInStock=UnitsInStock+(@satisAdedi-@yenisatisAdedi)
			where productID=@urunID
			end

		else
			begin
			update products set UnitsInStock=UnitsInStock-(@satisAdedi+@yenisatisAdedi)
			where productID=@urunID
			end

	end

	-------------------
	update [order details] set quantity =15 where OrderID=10248 and productID=1



	------------ bu triggeri modifiye yap�yoruz. 



	ALTER trigger [dbo].[trg_stok_guncelle2] on [dbo].[Order Details]
for update
as
	begin
	   
		declare @satisAdedi int, @urunID int,@yenisatisAdedi int

		select @satisAdedi = Quantity, @urunID=productID from deleted

		select @yenisatisAdedi=Quantity, @urunID=productID from inserted

		if(@yenisatisAdedi> @satisAdedi)-- sat�� adedi stoktan fazla olamaz.

			begin
			update products set UnitsInStock=UnitsInStock+(@satisAdedi-@yenisatisAdedi)
			where productID=@urunID
			end

		else
			begin
			update products set UnitsInStock=UnitsInStock-(@yenisatisAdedi - @satisAdedi)
			where productID=@urunID
			end

	end

---------------------------------------------- TEST

select * from [Order Details] where OrderID = 10248 and ProductID =1 
select * from products where productID=1 -- product ID 1 olan�n stok ka� 35

update [Order Details] set quantity = 30 where OrderID = 10248 and ProductID =1 -- stok 40 oldu. 

-- sipari�i iptal etmek.

create trigger trg_iptal_et on [order details] 
for delete
as

	begin
	declare @satisAdedi int, @urunID int
	select @satisAdedi= quantity, @urunID = productID from deleted
	update products set UnitsInStock = UnitsInStock + @satisAdedi
	where productID = @urunID
	end

	-- TEST
select * from [Order Details] where OrderID = 10248 and ProductID =1 
select * from products where productID=1 -- product ID 1 olan�n stok ka� �imdi 20 tane var

delete from [Order Details] where OrderID = 10248 and ProductID =1 
select * from products where productID=1



-- INDEXLEME

select * from products order by unitprice
select * from products order by ProductName
select * from products order by UnitsInStock
select * from Orders
/* products tablosuna solda sa� tu� tablo alt�nda index klasorune sa� tu� new index > nonclustered index t�kla add unitprice t�kla
indexleme h�z kazand�r�r*/
select * from Orders where OrderDate between '1996-01-01' and '1996-12-31' order by OrderDate


---- Constraint = KISITLAMALAR

/*		1) Primary KEY = Birincil anahtar k�s�tlama-- ayn� numara bir daha giremez.
		2) Foreing Key (Yabanc�l anahtar)
		3) Check Constraint
		4) Default Contraint
		5) Unique Constraint

		Yeni k�t�phane ad�nda DB a��yoruz 
*/

create table tbl_kitap3
(
kitapID int,
kitapAdi nvarchar (50),
yazarID int,
tarih date
)
-- Tabloyu olu�trduktan sonra primary key eklemek. alterle g�ncelleyebilirsin.
------------------------------

alter table tbl_kitap3 add constraint pk_kitap3 primary key (kitapID)


-----------------------------

create table tbl_kitap2
(
kitapID int,
kitapAdi nvarchar (50),
yazarID int,
tarih date,
constraint pk_kitap1 primary key (kitapID)

)

--------- FORE�GN KEY

create table tbl_yazar3
(
yazarID int identity(1,1)primary key,
yazarAdi nvarchar(50)
)

-- yazar tablosu ile a�a��daki yazar ID birbirine ba�lans�n istiyoruz.

create table tbl_kitap4
(
kitapID int,
kitapAdi nvarchar(50),
yazarID int,
tarih date,
constraint pk_kitapID primary key (kitapID),
constraint fk_yazarID foreign key(yazarID) references tbl_yazar3(yazarID)
)
-------- T�r kolonu ekle

create table tbl_tur 
(
turID int identity (1,1) primary key,
turAdi nvarchar(50)

)

alter table tbl_kitap4 add constraint fk_turID foreign key (turID)
references tbl_tur3(turID)

create table tbl_yayin3
(
yayinId int identity (1,1)primary key,
yayinAdi nvarchar(50),

)
select * from tbl_kitap3
alter table tbl_kitap3 add yayinID int --yeni kolon eklemek
alter table tbl_kitap3 add constraint fk_yayinID foreign key (yayinID)references tbl_yayin3(yayinID)

--------------------------

-- CHECK constraint - Bir alana girce�imiz verileri k�s�tlar. INSERT ve UPDATE i�in �al���r.
-- �rnek 18 ya��ndan k���k olmas�n vs.

create table tbl_ogrenci 
(
ogrenciID int identity(1,1)primary key,
ogrenciAdi nvarchar(50),
yas int,
constraint ch_yas check(yas>18)
)

---
select * from tbl_ogrenci
insert into tbl_ogrenci values('C�neyt',15)-- kaydetmedi
insert into tbl_ogrenci values('C�neyt',25) -- kaydetti

-----------------

create table tbl_personel
(
personelID int identity(1,1)primary key,
personelAdi nvarchar(50),
yas int,
ise_giris_tarihi date, -- YEAR LA �NT CEV�R
constraint ch_tarih check(YEAR(ise_giris_tarihi ) > (YEAR(GETDATE())-70))
)

insert into tbl_personel values ('C�neyt',75,'1953-04-28')
select * from tbl_personel

--- DEFAULT constraint varsay�lan de�er girmek

create table tbl_kitap5
(
kitapID int identity (1,1)primary key,
kitapAdi nvarchar(50) default('C#'),-- varsay�lan C# oldu
tarih date
)

insert into tbl_kitap5 (kitapAdi,tarih)values ('MsSql','1972-04-28')-- design den yap�lan yer. Default Value or Binding alan�na yaz.

select * from tbl_kitap5

---- belirli alanlardan ba�ka girilemez



create table tbl_ogrenci2
(
ogrenciID int primary key identity(1,1),
numarasi nvarchar(20) check (numarasi not Like '123%'),
sehir nvarchar (30) check (sehir IN ('�zmir','Denizli','Ayd�n'))
)

--- UNIQUE Constraint ALana bir daha giri� yap�lamaz TC kimlik gibi

create table tbl_ogretmen
(
ogretmenID int primary key identity(1,1),
ogretmenAdi nvarchar(50),
kodu int
constraint uk_kodu unique (kodu)
)

select * from tbl_ogretmen

insert into tbl_ogretmen (ogretmenAdi,kodu) values ('inci',21)

--- Kategoriler ve alt kategoriler

-- NORTWIND GE�

select * from Categories

 --  CategoryID      -- ADI--          USTID
/*
		1         Arazi                    0
		2         Otomobil                 0
		3         BMW                      2
		4         Motosiklet               0
		5         BMW                      1
*/		


