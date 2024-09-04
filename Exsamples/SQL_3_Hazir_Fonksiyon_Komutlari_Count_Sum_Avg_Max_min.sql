

-- HAZIR FONKSIYONLAR KULLANMAK
-- COUNT KULLANMAK
select * from TBLOGRENCILER
select count (*) as 'Toplam Kayýt' from TBLOGRENCILER -- COUNT Sayýyý sayar
select count(*) as 'Toplam Kiþi' from TBLOGRENCILER where OGRSEHIR='Ýstanbul'

-- SUM Kullanmak
select sum(SINAV1) from TBLNOTLAR -- TÜM NOTLARIN TOPLAMI 

select sum(SINAV1) as 'Sýnav 1',sum (SINAV2) as 'Sýnav 2', sum (SINAV3) as 'Sýnav 3' from TBLNOTLAR -- Tüm sunavlarýn toplamý

-- AVG ORTALAMA ALMAK
select avg (SINAV1) as 'Sýnav 1 Ortalamasý', avg (SINAV2) as 'SINAV 2 Ortalamasý', avg (SINAV3) as 'SINAV 3 Ortalamasý' from TBLNOTLAR

-- MAX Kullanmak En yüksek Puanlarý bulur
select max (SINAV1) as 'Sýnav 1 en yüksek', max (SINAV2) as 'SINAV 2 en yüksek', max (SINAV3) as 'SINAV 3 en yüksek' from TBLNOTLAR

-- MIN Kullanmak En yüksek Puanlarý bulur
select min (SINAV1) as 'Sýnav 1 en Düþük', min (SINAV2) as 'SINAV 2 en Düþük', min (SINAV3) as 'SINAV 3 en Düþük' from TBLNOTLAR

