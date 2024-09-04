

use DbYeni
-----------------------------------
create table TBLMUSTERI
(
ID INT primary key IDENTITY (1,1),
AD nvarchar(50),
SOYAD nvarchar(50),
SEHIR nvarchar(50),
BAKIYE decimal(18,2)
)
------------------------------------
create table TBLKATEGORI
(
KATEGORIID INT primary key IDENTITY (1,1),
AD nvarchar(50),
)
------------------------------------
create table TBLURUN
(
URUNID INT primary key IDENTITY (1,1),
AD nvarchar(50),
ALISFIYAT Decimal (18,2),
SATISFIYAT Decimal (18,2),
STOK smallint,
DURUM bit,
KATEGORI int
)
-----------------------------------
create table TBLSATIS
(
SATISID INT primary key IDENTITY (1,1),
MUSTERI int,
URUN int,
TARIH date
)


select count(*) from TBLURUN

create trigger ARTTIR
ON TBLURUN
AFTER INSERT
AS
UPDATE TBLSTOK SET TOPLAMURUN+=1 

------------------------------
create trigger AZALT
ON TBLURUN
AFTER DELETE
AS
UPDATE TBLSTOK SET TOPLAMURUN-=1 

------------------------------
update TBLSTOK set TOPLAMURUN= (select sum(Stok) from TBLURUN)


drop trigger AZALT

create trigger ARTTIR1
ON TBLURUN
AFTER INSERT
AS
DECLARE @STOKSAYI INT
SELECT @STOKSAYI=STOK FROM inserted
UPDATE TBLSTOK SET TOPLAMURUN+=@STOKSAYI

select * from TBLSTOK

create trigger AZALT11
ON TBLURUN
AFTER DELETE
AS
DECLARE @STOKSAYI INT
SELECT @STOKSAYI=STOK FROM DELETED
UPDATE TBLSTOK SET TOPLAMURUN=TOPLAMURUN-@STOKSAYI

------------

insert into TBLURUN(AD,STOK) VALUES ('MIXER',80)

-- ROLLBACK ÝPTAL EDER

BEGIN TRANSACTION
INSERT INTO TBLKATEGORI (AD) VALUES ('TV')
INSERT INTO TBLKATEGORI (AD) VALUES ('HALI')
SELECT * FROM TBLKATEGORI
ROLLBACK


-- COMMIT   10 ekleme yapacaksan 100 taneside sorunsuz olmalý

select * from TBLURUN

CREATE FUNCTION STOKARTTIR (@ADET INT)
RETURNS INT
AS
BEGIN
RETURN @ADET+26

END

select AD,STOK,DBO.STOKARTTIR(STOK) from TBLURUN

alter function kucukharf(@isim nvarchar(50))
returns nvarchar (50)
as
begin
return lower(@isim)
end

select dbo.kucukharf(AD),STOK from TBLURUN