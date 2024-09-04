

-- LIKE Komutu
-- �stedi�imiz de�erin olup olmad���n� kontrol ediyor.

select * from TBLOGRENCILER where OGRAD like '%a%' -- sa�� solu �nemli de�il AD i�inde a ge�enler
select * from TBLOGRENCILER where OGRAD like 'a%' -- ADI A ile ba�layanlar. ilk harfi a olanlar.
select * from TBLOGRENCILER where OGRAD like '%a' -- ADINDA Son harfi a olanlar
select * from TBLOGRENCILER where OGRSEHIR like '%ana%' -- i�inde ana ge�enler ille yanyana olmal�

select * from TBLOGRENCILER where OGRAD like 'a%' or OGRSOYAD like 'a%' -- ad veya soyad� a ile ba�layanlar
select * from TBLOGRENCILER where OGRAD like 'a%' and OGRCINSIYET like 'Erkek' -- ad� a ile ba�layan ve erkek olanlar.

-- NOT LIKE komutu - ��ermeyen

select * from TBLOGRENCILER where OGRAD not like '%a' -- son harfi a olmayanlar.

-- DISTINCT sorgular� tekrars�z getirmek. AYn� �ehirden 10 tane olsada 1 d�nd�r�r.

select count (Distinct(OGRSEHIR)) from TBLOGRENCILER 

select distinct OGRSEHIR from TBLOGRENCILER

select distinct OGRKULUP as 'Kulup Say�s�'from TBLOGRENCILER

select * from TBLOGRENCILER where OGRSEHIR like '%an_%'

select * from TBLOGRENCILER where OGRAD like '[A,B]%' -- ad a yada b ile ba�layanlar

select * from TBLOGRENCILER where OGRAD like '%[T,Y]' -- ad T yada Y ile bitenler

select * from TBLOGRENCILER where OGRKULUP like '%[k-m]' -- k den ba�lay�p m ye devam eden sorgular




