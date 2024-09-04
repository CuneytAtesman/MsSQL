

-- SIFIRDAN YEN� VER� TABANI OLU�TURMAK
-- VER� TABANI KOLONLARINI PLANLAMAK.

-- TRIGGER

/* Silinen ��renciyi Mezun Oldu Tablosuna Kaydetmek veya sipari� al�nd���nda stokdan d��mek.
veya iadeleri tekrar tabloya Triggerle otomatik eklemek*/

-- K�t�phane - Normalizasyona g�re Tablo Yap�s� ��kartmak.

-- tbl_ogrenci / ogrenciID,ogrenciAd,ogrenciSoyad,cinsiyet,DogumTarihi,sinif,puan,aktif
-- tbl_kitap  / kitapID,adi,isbnNo,yazarID,turID,yayineviID

-- tbl_yazar  / yazarID,adiSoyad
-- tbl_tur    /turID,turAdi,
-- tbl_yayinevi / yayineviID,adi,adres,telefon,email
-- tbl_islem  (Ara Tablo) / ogrenciID,kitapID,alinisTarihi,iadeTarihi

/* Bu bilgilere g�re �nce k�t�phane.db yarat�yoruz. 
Yukardaki Normalizasyona g�re tablolar olu�turuyoruz.*/

select * from tbl_ogrenci

/* T�m tablolar olu�turulduktan sonra DB alt�nda Diagramdan Add New Diagram sa� tu�,
tablolar�n hepsini diagrama eklemeli.*/

-- Yay�n evi tur yazar ilk once girilmeli. yoksa di�er veriler girilemez.

select * from tbl_ogrenci
insert into tbl_ogrenci values ('C�neyt','Ate�man','E','1970-09-02','Yaz�l�m',100,1)
insert into tbl_ogrenci values ('�nci','Ate�man','K','1965-01-28','�ngilizce',100,1)
insert into tbl_ogrenci values ('Seray','Korkmaz','K','1996-01-28','�leti�im',100,1)
insert into tbl_ogrenci values ('Miray','Korkmaz','K','1985-06-15','Turizm',100,1)










select * from tbl_kitap

insert into tbl_kitap ('Akl�mdaki Kalimeler','21365478952',3,2,500,2,80)

select * from tbl_yazar
insert into tbl_yazar values ('Sait Faik')
insert into tbl_yazar values ('Orhan Veli')
insert into tbl_yazar values ('Ya�ar Nuri G�ntekin')
insert into tbl_yazar values ('�lhan Sel�uk')
insert into tbl_yazar values ('Orhan B��ak��')

-- kay�t att���nda bu trigger sonu�lar� listeler.
create trigger trg_yazar_listele on tbl_yazar 
after insert 
as
	begin
	select * from tbl_yazar
	end

-- Triggeri devre d��� b�rakmak

disable trigger trg_yazar_listele on tbl_yazar -- aktif olmakdan ��kartt�k.
enable trigger trg_yazar_listele on tbl_yazar  -- Tekrar aktifle�tirdik.
drop trigger trg_yazar_listele -- Triggeri siler.

-- Tabloda 1 den fazla trigger varsa enable veya disable yapmak

enable trigger all on tbl_yazar -- Tablodaki t�m triggerleri aktif eder.
disable trigger all on tbl_yazar -- Tablodaki t�m triggerleri pasif yapar.

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


