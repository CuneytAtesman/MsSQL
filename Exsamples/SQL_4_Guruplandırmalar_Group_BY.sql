

--- GURUPLANDIRMALAR

-- GROUP BY Kullanmak.

-- Her tabloda ili�kili ne varsa say�s�n� almak. �statistik i�lemlerde kullan�l�r.

select OGRSEHIR, count(*) as 'Toplam' from TBLOGRENCILER group by OGRSEHIR
select OGRCINSIYET, count(*) as'Toplam' from TBLOGRENCILER group by OGRCINSIYET

------

select * from TBLNOTLAR
update TBLNOTLAR set Ortalama=(SINAV1+SINAV2+S�nav3)/3
update TBLNOTLAR set DURUN=1 where ortalama >=50
update TBLNOTLAR set DURUN=0 where ortalama <=50


select OGRKULUP, count(*) from TBLOGRENCILER group by OGRKULUP

-- HAVING KULLANMAK

select OGRSEHIR, count(*) as 'SAYI' from TBLOGRENCILER group by OGRSEHIR HAVING count(*)=2 -- Hangi �ehirde 2 ��renci var.
select OGRKULUP, count(*) from TBLOGRENCILER group by OGRKULUP HAVING OGRKULUP='Yaz�l�m' or OGRKULUP='Gezi'

