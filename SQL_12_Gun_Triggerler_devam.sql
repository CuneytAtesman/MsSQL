------------------------------
-- cinsiyeti k�z olanlar kaydedilsin

insert into tbl_ogrenci values
('�smail','Ayd�n','E','1995-05-25','Yaz�l�m',100,1) -- Kay�t normal olarak yap�ld�.

-- Trigger yarat
create trigger tgr_cinsiyet_yalniz_bayan on tbl_ogrenci
for insert
as
if (exists(select * from inserted where cinsiyet = 'E'))
	begin
	raiserror ('Bu s�n�fa sadece bayan kayd� yap�labilir.',1,1)
	rollback transaction
	end

---TEST
insert into tbl_ogrenci values('Pa�a','Ate�man','K','1995-05-25','Yaz�l�m',100,1) -- K oldu�u i�in kaydetti
select * from tbl_ogrenci


------------
--BAYANLAR S�L�NEMES�N

select * from tbl_ogrenci

create trigger trg_kizlar_silinemez on tbl_ogrenci
after delete
as
if (exists(select * from deleted where cinsiyet ='K' and sinifi='Yaz�l�m'))
	begin
	raiserror ('Yaz�l�m s�n�f�ndan Bayan ��renciler Silinemez',2,4)
	rollback transaction
	end

delete from tbl_ogrenci where ogrenciID=9

------------------------------------------------

-- Silinen ��renciyi mezun tablosuna kaydetmek

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
	-- TRIGGER YAPILAMADI HATA VER�YOR.
------------------------------------------------

--- ��rencilerin cinsiyet alan� de�i�tirilmesin

create trigger trg_cinsiyet_degismesin on tbl_ogrenci
after update
as

	begin
		if (exists(select * from inserted,deleted
		where inserted.ogrenciID=deleted.ogrenciID
		and inserted.cinsiyet !=deleted.cinsiyet))

			begin
				raiserror('Cinsiyet De�i�tirilemez',1,1)
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
insert into tbl_tur values ('A�k')
insert into tbl_tur values ('�iir')

select * from tbl_tur

----------

insert into tbl_yayinevi values ('Aka�a','�zmir',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Tay','�stanbul',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Meri�','Adana',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Haberci','Antalya',5360089,'deneme@gmail.com')
insert into tbl_yayinevi values ('Deneme','Mersin',5360089,'deneme@gmail.com')

select * from tbl_yayinevi

-------------------------

insert into tbl_kitap values ('Bilin�alt�','2536145789',2,3,500,2,98)
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
			raiserror ('Sayfa say�s� eskisinden az olamaz',1,1)
			rollback transaction
			end
	end
--------------

select * from tbl_kitap

update tbl_kitap set sayfaSayisi = 900 where kitapID =5 -- hata verir
update tbl_kitap set sayfasayisi = 600 where kitapID =4 -- 500 d� 600 oldu.
-----------------------------------------------------------------------------------

-- KATEGOR� ve �R�N TABLOSUNDAN veya DB den H�� B�R�EY S�L�NEMES�N

create trigger trg_tur_silinemez on tbl_tur
after delete
as

		begin
		raiserror ('T�r Tablosu Silinemez',1,1)
		rollback transaction 
		end
---------------
select * from tbl_tur

delete from tbl_tur

------------ ��renci tablosuna silindi kolonu ekle.

select * from tbl_ogrenci

------ tabloya silindi kolonu eklemek

alter table tbl_ogrenci add silindi bit null -- veya not NUll

alter table tbl_kitap add silindi bit null

---------------
---kitap silinmesin ama silindi kolonuna 0 degeri bassin / �r�n� g�ster veya g�stermede kullan�labilir.

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

-- NORTHWIND A� - sat�lam mal� stok tablosundan d��mek veya iptal edilen sipari�i geri yazmak.

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
			update products set UnitsInStock=UnitsInStock-(@yenisatisAdedi - @satisAdedi)
			where productID=@urunID
			end

	end

	-------------------
	update [order details] set quantity =15 where OrderID=10248 and productID=1

	