
-- hepsi burada DB de �al���yoruz.

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
Aktif bit /*�r�n� silmeden g�stermeden bekletmek i�in. silmek yerine aktif kolonunu 0 veya 1 yapars�n.0 olursa kapat�lm�� veya silinmi� gibi.
(�rnek - �r�n stokta bittyse gelene kadar aktifli�ini kald�rabilirsin.*/

)

select * from tbl_person

-- ADO.NET ile kay�t formul�

insert into tbl_person (Adi,Soyadi,Adres,DogumTarihi,SiparisTarihi,Maas,Yas,Stok,Maas_Float,Maas_Money,Aktif)
values      ('Miray','Atesman','�zmir','1987-01-28','2022-11-30 15:08:30',35.23,52,27,20.12,3.92,1)



-- ADO.NET ile UPDATE formul�   -- update tabloadi SET kolon adi = de�eri,(Ba�ka varsa devam) kolon adi = de�eri WHERE

update tbl_person set Adres='�stanbul',stok=5 where personID=2

-- veya
update tbl_person set Adres='�stanbul',stok=5 where Yas>=30 and Yas<=45  -- ya�� 30dan buyuk ve 45 den k���k olanlar� g�ncelle gibi

-- ADO:NET ile DELETE Formul� -- delete from tabloAdi where

delete from tbl_person where PersonID=3  -- yeniden kaydedersen art�k 3 olarak kaydedemeyiz

update tbl_person set Aktif =0 where PersonID=1


-- insert tabloya veri eklemek eksik veri g�ndermek / soyad�n� girmeden veri kaydet / Tablodaki soyad�n� iptal etmeli NULL gider 
-- bo� g�nderirsen db patlar null gitmemeli. Yaz�l�mda bo� gelirse ayarlamak gerekir. NULL yerine bo�luk att�rmak gerekir.

insert into tbl_person (Adi,Adres,DogumTarihi,SiparisTarihi,Maas,Yas,Stok,Maas_Float,Maas_Money,Aktif)
values      ('Miray3','�stanbul','1987-01-28','2022-11-30 15:08:30',35.23,52,27,20.12,3.92,1) 

select * from tbl_person

delete from tbl_person where PersonID=5



-- MAX;MIN;SUM;COUNT;AVG en �ok GROUP BY ile kullan�l�r. HAZIR FONKS�YONLAR
-- Hepsi Burada DB kullan yeni db yarat tbl_Personel

select * from tbl_personel

select ulke,AVG(Maas) as Ortalama from tbl_Personel group by Ulke -- �lkelerin maa� ortalamas�n� al�r.

--25 g�nden devam et