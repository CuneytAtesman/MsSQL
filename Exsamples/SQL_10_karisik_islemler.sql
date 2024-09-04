

create procedure KritikSeviye
AS
SELECT * from TBLURUNLER where URUNSTOK>10





----------------------------------
create table KASA
(
TOPLAM decimal (18,2)
)

insert into TBLKASA VALUES (0)

select * from TBLKASA

UPDATE TBLKASA set TOPLAM=(select SUM(TUTAR)from TBLHAREKET)

----------------------------------

create table TBLSAYAC
(
ISLEM int
)

insert into TBLSAYAC values (0)
select * from TBLSAYAC

update tblsayac set ISLEM=(select count(*)from TBLHAREKET)

create trigger ISLEMARTIS on TBLHAREKET AFTER INSERT AS update TBLSAYAC set ISLEM=ISLEM+1

create table TBLTOPLAMKATEGORI
(
ADET tinyint
)

update TBLTOPLAMKATEGORI set ADET=(SELECT count(*)from TBLKATEGORI)

select * from TBLTOPLAMKATEGORI

create trigger KATEGORIARTIS
on TBLKATEGORI
AFTER INSERT
AS
UPDATE TBLTOPLAMKATEGORI set ADET+=1

select * from TBLKATEGORI

create trigger KATEGORIAZALIS
on TBLKATEGORI
AFTER DELETE
AS
UPDATE TBLTOPLAMKATEGORI set ADET-=1

----------------------------------------

create view test1
as
select * from TBLKATEGORI

select * from test3

create procedure stokkritikseviye 
AS
select urunad,urunmarka,urunstok,urunstok=
case
when urunstok>=1 and urunstok <=5 then 'Kritik Seviye'
when urunstok>=6 and urunstok <=10 then 'Takviye Yapýlmalý'
when urunstok>=10 then 'Yeterli Seviye'
end

from TBLURUNLER

select stokkritikseviye

Select MUSTERIULKE,COUNT(*)from TBLMUSTERI group by MUSTERIULKE




