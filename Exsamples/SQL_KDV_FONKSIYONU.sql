

-- KDV FONKSÝYONU

create function KDV(@FIYAT decimal(18,2))
returns decimal(18,2)
as
begin
return @FIYAT*1.18
end

select AD,SATISFIYAT,DBO.KDV(SATISFIYAT)as 'KDV' from TBLURUN


-- TABLO BAZLI FONKSIYONLAR

create function URUNBILGI(@URID INT)
returns table
as
return select * from TBLURUN where URUNID=@URID

select * from dbo.URUNBILGI(4)

-- INDEXLEME HIZ KAZANDIRMAK BUYUK VERI TABLOLARINDA SELECT SORGUSUNDAN DAHA HIZLI ÇALIÞIR.

-- CLUSTERED (KÜMELENMÝÞ) INDEX



-- NONCLUSTERED INDEX 1 tabloda birden fazla index tanýmlanabilir. Hem yazar hemde yazar.
-- Tablo altýndan Indexes seçeneðine týklayýp > new > non-clustered seçilir. Add yapýp istedðin kolonlarý dahil et.

create table tablo1
(
ID int identity (1,1),
AD varchar (20)
)

declare @sayac int=1
while @sayac < 250001
begin
insert tablo1
select 'kitap' + CAST (@sayac as varchar(20))
set @sayac=@sayac+1
end

select * from tablo1
----------------------------------------------
create clustered index TABLOKAYITGETIR
ON tablo1(ID)

select * from tablo1 where ID=210387
----------------------------------------

create table JOBTABLOSU
(
ID int identity(1,1),
METIN varchar(20)
)

select * from JOBTABLOSU