

-- HAZIR FONKSIYONLAR KULLANMAK
-- COUNT KULLANMAK
select * from TBLOGRENCILER
select count (*) as 'Toplam Kay�t' from TBLOGRENCILER -- COUNT Say�y� sayar
select count(*) as 'Toplam Ki�i' from TBLOGRENCILER where OGRSEHIR='�stanbul'

-- SUM Kullanmak
select sum(SINAV1) from TBLNOTLAR -- T�M NOTLARIN TOPLAMI 

select sum(SINAV1) as 'S�nav 1',sum (SINAV2) as 'S�nav 2', sum (SINAV3) as 'S�nav 3' from TBLNOTLAR -- T�m sunavlar�n toplam�

-- AVG ORTALAMA ALMAK
select avg (SINAV1) as 'S�nav 1 Ortalamas�', avg (SINAV2) as 'SINAV 2 Ortalamas�', avg (SINAV3) as 'SINAV 3 Ortalamas�' from TBLNOTLAR

-- MAX Kullanmak En y�ksek Puanlar� bulur
select max (SINAV1) as 'S�nav 1 en y�ksek', max (SINAV2) as 'SINAV 2 en y�ksek', max (SINAV3) as 'SINAV 3 en y�ksek' from TBLNOTLAR

-- MIN Kullanmak En y�ksek Puanlar� bulur
select min (SINAV1) as 'S�nav 1 en D���k', min (SINAV2) as 'SINAV 2 en D���k', min (SINAV3) as 'SINAV 3 en D���k' from TBLNOTLAR

