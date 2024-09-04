

-- LIKE Komutu
-- Ýstediðimiz deðerin olup olmadýðýný kontrol ediyor.

select * from TBLOGRENCILER where OGRAD like '%a%' -- saðý solu önemli deðil AD içinde a geçenler
select * from TBLOGRENCILER where OGRAD like 'a%' -- ADI A ile baþlayanlar. ilk harfi a olanlar.
select * from TBLOGRENCILER where OGRAD like '%a' -- ADINDA Son harfi a olanlar
select * from TBLOGRENCILER where OGRSEHIR like '%ana%' -- içinde ana geçenler ille yanyana olmalý

select * from TBLOGRENCILER where OGRAD like 'a%' or OGRSOYAD like 'a%' -- ad veya soyadý a ile baþlayanlar
select * from TBLOGRENCILER where OGRAD like 'a%' and OGRCINSIYET like 'Erkek' -- adý a ile baþlayan ve erkek olanlar.

-- NOT LIKE komutu - Ýçermeyen

select * from TBLOGRENCILER where OGRAD not like '%a' -- son harfi a olmayanlar.

-- DISTINCT sorgularý tekrarsýz getirmek. AYný þehirden 10 tane olsada 1 döndürür.

select count (Distinct(OGRSEHIR)) from TBLOGRENCILER 

select distinct OGRSEHIR from TBLOGRENCILER

select distinct OGRKULUP as 'Kulup Sayýsý'from TBLOGRENCILER

select * from TBLOGRENCILER where OGRSEHIR like '%an_%'

select * from TBLOGRENCILER where OGRAD like '[A,B]%' -- ad a yada b ile baþlayanlar

select * from TBLOGRENCILER where OGRAD like '%[T,Y]' -- ad T yada Y ile bitenler

select * from TBLOGRENCILER where OGRKULUP like '%[k-m]' -- k den baþlayýp m ye devam eden sorgular




