

-- DDL Komutlarý - Veri Tanýmlama Dili (TABLO ÜZERÝNDE DEÐÝÞÝKLÝKLER YAPAR)

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

 --- ALTER Tablo Düzenlemek KONTENJAN COLUMN eklemek

 alter table TBLDERSLER
 add KONTENJAN smallint

 --- DROP KONTENJAN KOLONUNU SÝLMEK

 alter table TBLDERSLER
 drop column KONTENJAN  -- Komple tabloyu silmek istersek 'drop Table TBLDERSLER' yazmalýyýz.


 





