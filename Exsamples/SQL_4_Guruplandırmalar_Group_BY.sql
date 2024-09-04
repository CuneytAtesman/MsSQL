

--- GURUPLANDIRMALAR

-- GROUP BY Kullanmak.

-- Her tabloda iliþkili ne varsa sayýsýný almak. Ýstatistik iþlemlerde kullanýlýr.

select OGRSEHIR, count(*) as 'Toplam' from TBLOGRENCILER group by OGRSEHIR
select OGRCINSIYET, count(*) as'Toplam' from TBLOGRENCILER group by OGRCINSIYET

------

select * from TBLNOTLAR
update TBLNOTLAR set Ortalama=(SINAV1+SINAV2+Sýnav3)/3
update TBLNOTLAR set DURUN=1 where ortalama >=50
update TBLNOTLAR set DURUN=0 where ortalama <=50


select OGRKULUP, count(*) from TBLOGRENCILER group by OGRKULUP

-- HAVING KULLANMAK

select OGRSEHIR, count(*) as 'SAYI' from TBLOGRENCILER group by OGRSEHIR HAVING count(*)=2 -- Hangi þehirde 2 öðrenci var.
select OGRKULUP, count(*) from TBLOGRENCILER group by OGRKULUP HAVING OGRKULUP='Yazýlým' or OGRKULUP='Gezi'

