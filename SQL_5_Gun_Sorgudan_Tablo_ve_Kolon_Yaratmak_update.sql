
-- hepsi burada DB de çalışıyoruz.

create table tbl_person
(
personID int identity(1,1) primary key,
Adi nvarchar(50) not NULL,
Soyadi nvarchar(60),
Adres nvarchar (MAX),
DogumTarihi date,
SiparisTarihi datetime,
Maas decimal(10,2),
Yas smallint,
Stok bigint,
Maas_Float float,
Maas_Money money,
Aktif bit /*ürünü silmeden göstermeden bekletmek için. silmek yerine aktif kolonunu 0 veya 1 yaparsın.0 olursa kapatılmış veya silinmiş gibi.
(örnek - Ürün stokta bittyse gelene kadar aktifliğini kaldırabilirsin.*/

)

select * from tbl_person

-- ADO.NET ile kayıt formulü

insert into tbl_person (Adi,Soyadi,Adres,DogumTarihi,SiparisTarihi,Maas,Yas,Stok,Maas_Float,Maas_Money,Aktif)
values      ('Miray','Atesman','İzmir','1987-01-28','2022-11-30 15:08:30',35.23,52,27,20.12,3.92,1)



-- ADO.NET ile UPDATE formulü   -- update tabloadi SET kolon adi = değeri,(Başka varsa devam) kolon adi = değeri WHERE

update tbl_person set Adres='İstanbul',stok=5 where personID=2

-- veya
update tbl_person set Adres='İstanbul',stok=5 where Yas>=30 and Yas<=45  -- yaşı 30dan buyuk ve 45 den küçük olanları güncelle gibi

-- ADO:NET ile DELETE Formulü -- delete from tabloAdi where

delete from tbl_person where PersonID=3  -- yeniden kaydedersen artık 3 olarak kaydedemeyiz

update tbl_person set Aktif =0 where PersonID=1


-- insert tabloya veri eklemek eksik veri göndermek / soyadını girmeden veri kaydet / Tablodaki soyadını iptal etmeli NULL gider 
-- boş gönderirsen db patlar null gitmemeli. Yazılımda boş gelirse ayarlamak gerekir. NULL yerine boşluk attırmak gerekir.

insert into tbl_person (Adi,Adres,DogumTarihi,SiparisTarihi,Maas,Yas,Stok,Maas_Float,Maas_Money,Aktif)
values      ('Miray3','İstanbul','1987-01-28','2022-11-30 15:08:30',35.23,52,27,20.12,3.92,1) 

select * from tbl_person

delete from tbl_person where PersonID=5



-- MAX;MIN;SUM;COUNT;AVG en çok GROUP BY ile kullanılır. HAZIR FONKSİYONLAR
-- Hepsi Burada DB kullan yeni db yarat tbl_Personel

select * from tbl_personel

select ulke,AVG(Maas) as Ortalama from tbl_Personel group by Ulke -- ülkelerin maaş ortalamasını alır.

--25 günden devam et