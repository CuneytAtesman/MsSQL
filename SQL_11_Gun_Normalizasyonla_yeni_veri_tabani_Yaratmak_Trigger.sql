

-- SIFIRDAN YENÝ VERÝ TABANI OLUÞTURMAK
-- VERÝ TABANI KOLONLARINI PLANLAMAK.

-- TRIGGER

/* Silinen Öðrenciyi Mezun Oldu Tablosuna Kaydetmek veya sipariþ alýndýðýnda stokdan düþmek.
veya iadeleri tekrar tabloya Triggerle otomatik eklemek*/

-- Kütüphane - Normalizasyona göre Tablo Yapýsý Çýkartmak.

-- tbl_ogrenci / ogrenciID,ogrenciAd,ogrenciSoyad,cinsiyet,DogumTarihi,sinif,puan,aktif
-- tbl_kitap  / kitapID,adi,isbnNo,yazarID,turID,yayineviID

-- tbl_yazar  / yazarID,adiSoyad
-- tbl_tur    /turID,turAdi,
-- tbl_yayinevi / yayineviID,adi,adres,telefon,email
-- tbl_islem  (Ara Tablo) / ogrenciID,kitapID,alinisTarihi,iadeTarihi

/* Bu bilgilere göre önce kütüphane.db yaratýyoruz. 
Yukardaki Normalizasyona göre tablolar oluþturuyoruz.*/

select * from tbl_ogrenci

/* Tüm tablolar oluþturulduktan sonra DB altýnda Diagramdan Add New Diagram sað tuþ,
tablolarýn hepsini diagrama eklemeli.*/

-- Yayýn evi tur yazar ilk once girilmeli. yoksa diðer veriler girilemez.

select * from tbl_ogrenci
insert into tbl_ogrenci values ('Cüneyt','Ateþman','E','1970-09-02','Yazýlým',100,1)
insert into tbl_ogrenci values ('Ýnci','Ateþman','K','1965-01-28','Ýngilizce',100,1)
insert into tbl_ogrenci values ('Seray','Korkmaz','K','1996-01-28','Ýletiþim',100,1)
insert into tbl_ogrenci values ('Miray','Korkmaz','K','1985-06-15','Turizm',100,1)










select * from tbl_kitap

insert into tbl_kitap ('Aklýmdaki Kalimeler','21365478952',3,2,500,2,80)

select * from tbl_yazar
insert into tbl_yazar values ('Sait Faik')
insert into tbl_yazar values ('Orhan Veli')
insert into tbl_yazar values ('Yaþar Nuri Güntekin')
insert into tbl_yazar values ('Ýlhan Selçuk')
insert into tbl_yazar values ('Orhan Býçakçý')

-- kayýt attýðýnda bu trigger sonuçlarý listeler.
create trigger trg_yazar_listele on tbl_yazar 
after insert 
as
	begin
	select * from tbl_yazar
	end

-- Triggeri devre dýþý býrakmak

disable trigger trg_yazar_listele on tbl_yazar -- aktif olmakdan çýkarttýk.
enable trigger trg_yazar_listele on tbl_yazar  -- Tekrar aktifleþtirdik.
drop trigger trg_yazar_listele -- Triggeri siler.

-- Tabloda 1 den fazla trigger varsa enable veya disable yapmak

enable trigger all on tbl_yazar -- Tablodaki tüm triggerleri aktif eder.
disable trigger all on tbl_yazar -- Tablodaki tüm triggerleri pasif yapar.

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


