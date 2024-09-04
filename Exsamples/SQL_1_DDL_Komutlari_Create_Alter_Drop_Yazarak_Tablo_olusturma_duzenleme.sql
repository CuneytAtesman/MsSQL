

-- DDL Komutlar� - Veri Tan�mlama Dili (TABLO �ZER�NDE DE����KL�KLER YAPAR)

/* 
 1 create, 
 2 Alter, 
 3 Drop */

 --- CREATE Tablo Yaratmak
 create table TBLDERSLER
 (
 DERSID tinyint,
 DERSAD varchar(20),
 )

 --- ALTER Tablo D�zenlemek KONTENJAN COLUMN eklemek

 alter table TBLDERSLER
 add KONTENJAN smallint

 --- DROP KONTENJAN KOLONUNU S�LMEK

 alter table TBLDERSLER
 drop column KONTENJAN  -- Komple tabloyu silmek istersek 'drop Table TBLDERSLER' yazmal�y�z.


 





