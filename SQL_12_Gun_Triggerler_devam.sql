------------------------------
-- cinsiyeti kýz olanlar kaydedilsin

insert into tbl_ogrenci values
('Ýsmail','Aydýn','E','1995-05-25','Yazýlým',100,1) -- Kayýt normal olarak yapýldý.

-- Trigger yarat
create trigger tgr_cinsiyet_yalniz_bayan on tbl_ogrenci
for insert
as
if (exists(select * from inserted where cinsiyet = 'E'))
	begin
	raiserror ('Bu sýnýfa sadece bayan kaydý yapýlabilir.',1,1)
	rollback transaction
	end

---TEST
insert into tbl_ogrenci values('Paþa','Ateþman','K','1995-05-25','Yazýlým',100,1) -- K olduðu için kaydetti
select * from tbl_ogrenci


------------
--BAYANLAR SÝLÝNEMESÝN

select * from tbl_ogrenci

create trigger trg_kizlar_silinemez on tbl_ogrenci
after delete
as
if (exists(select * from deleted where cinsiyet ='K' and sinifi='Yazýlým'))
	begin
	raiserror ('Yazýlým sýnýfýndan Bayan Öðrenciler Silinemez',2,4)
	rollback transaction
	end

delete from tbl_ogrenci where ogrenciID=9

------------------------------------------------

-- Silinen öðrenciyi mezun tablosuna kaydetmek

create table tbl_mezun (ogrAd nvarchar(50),ogrSoyad nvarchar (50))

select * from tbl_mezun
delete from tbl_mezun


-----------------------------------------------------

create trigger trg_silinen_to_tblmezun on tbl_ogrenci
after delete
as
	begin
	insert into tbl_mezun select ogrAd,ogrSoyad from deleted
	end
	-- TRIGGER YAPILAMADI HATA VERÝYOR.
------------------------------------------------

--- Öðrencilerin cinsiyet alaný deðiþtirilmesin

create trigger trg_cinsiyet_degismesin on tbl_ogrenci
after update
as

	begin
		if (exists(select * from inserted,deleted
		where inserted.ogrenciID=deleted.ogrenciID
		and inserted.cinsiyet !=deleted.cinsiyet))

			begin
				raiserror('Cinsiyet Deðiþtirilemez',1,1)
				rollback transaction
			end
	end

------------
select * from tbl_ogrenci

update tbl_ogrenci set cinsiyet='E' where ogrenciID=2

------------------------------------------
insert into tbl_tur values ('Polisiye')
insert into tbl_tur values ('Gerilim')
insert into tbl_tur values ('Macera')
insert into tbl_tur values ('Aþk')
insert into tbl_tur values ('Þiir')

select * from tbl_tur

----------

insert into tbl_yayinevi values ('Akaþa','Ýzmir',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Tay','Ýstanbul',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Meriç','Adana',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Haberci','Antalya',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Deneme','Mersin',5360089,'deneme@gmail.com')

select * from tbl_yayinevi

-------------------------

insert into tbl_kitap values ('Bilinçaltý','2536145789',2,3,500,2,98)
insert into tbl_kitap values ('Talmud','2536146952',2,3,2500,2,100)

select * from tbl_kitap
select * from tbl_yazar

---------------------------

create trigger trg_sayfa_sayisi_kontrol on tbl_kitap
after update
as
	begin
	if (exists(select * from inserted, deleted where inserted.sayfaSayisi < deleted.sayfaSayisi))
			begin
			raiserror ('Sayfa sayýsý eskisinden az olamaz',1,1)
			rollback transaction
			end
	end
--------------

select * from tbl_kitap

update tbl_kitap set sayfaSayisi = 900 where kitapID =5 -- hata verir
update tbl_kitap set sayfasayisi = 600 where kitapID =4 -- 500 dü 600 oldu.
-----------------------------------------------------------------------------------

-- KATEGORÝ ve ÜRÜN TABLOSUNDAN veya DB den HÝÇ BÝRÞEY SÝLÝNEMESÝN

create trigger trg_tur_silinemez on tbl_tur
after delete
as

		begin
		raiserror ('Tür Tablosu Silinemez',1,1)
		rollback transaction 
		end
---------------
select * from tbl_tur

delete from tbl_tur

------------ Öðrenci tablosuna silindi kolonu ekle.

select * from tbl_ogrenci

------ tabloya silindi kolonu eklemek

alter table tbl_ogrenci add silindi bit null -- veya not NUll

alter table tbl_kitap add silindi bit null

---------------
---kitap silinmesin ama silindi kolonuna 0 degeri bassin / ürünü göster veya göstermede kullanýlabilir.

create trigger trg_aktif_pasif on tbl_kitap 
instead of delete
as

		begin
		update tbl_kitap set silindi=0 where kitapID in(select kitapID from deleted)
		end

--
select * from tbl_kitap
delete from tbl_kitap where kitapID=5

-- silindiye tarih eklemek

alter table tbl_tur add tarih datetime null 
select * from tbl_tur

create trigger trg_tur_guncelle_kontrol on tbl_tur
after update
as

	begin
	update tbl_tur set tarih = GETDATE () where turID in (select turID from deleted)
	end

--
select * from tbl_tur
update tbl_tur set turAdi = 'Deneme' where turID=2

---------------------------

-- NORTHWIND AÇ - satýlam malý stok tablosundan düþmek veya iptal edilen sipariþi geri yazmak.

select * from products
select * from [Order Details]
------------------------------------------
create trigger trg_stok_guncelle on [order details]
for insert
as
	begin
		declare @satisAdedi int, @urunID int
		select @satisAdedi = Quantity, @urunID=productID from inserted

		update products set UnitsInStock = UnitsInStock -@satisAdedi
		where ProductID = @urunID
	end

	--------------------------
	select * from Products
	select * from [Order Details]
insert into [Order Details] values (10248,1,18.00,20,0)

-----------GÜNCELLEME OLURSA sipariþi aldý sipariþ adedini deðiþtirmek isterse

alter trigger trg_stok_guncelle2 on [order details]
for update
as
	begin
	   
		declare @satisAdedi int, @urunID int,@yenisatisAdedi int

		select @satisAdedi = Quantity, @urunID=productID from deleted

		select @yenisatisAdedi=Quantity, @urunID=productID from inserted

		if(@yenisatisAdedi> @satisAdedi)-- satýþ adedi stoktan fazla olamaz.

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

	-------------------
	update [order details] set quantity =15 where OrderID=10248 and productID=1

	