
-- TOP KULLANIMI

select * from TBLOGRENCILER

select top 3* from TBLOGRENCILER -- Üsten ilk 3 taneyi getirir.

select top 3* from TBLOGRENCILER order by OGRID desc -- en alttaki 3 taneyi sýraladý.

-- PERCENT Kullanýmý

select top 60 percent * from TBLOGRENCILER -- Öðrencilerin yüzde 60 ýný getir.

-- IN KUllanýmý

select * from TBLOGRENCILER where OGRSEHIR ='Ýzmir' or OGRSEHIR= 'Ýstanbul' or OGRSEHIR='Bursa' -- Bu þekilde uzun yazmaktan kurtarýr.

select * from TBLOGRENCILER where OGRSEHIR in('Ýzmir','Adana','Bursa')

select * from TBLNOTLAR where SINAV1 in (70,75,85,90) -- parantez içinde yazýlý olanlarý getirir.

select * from TBLNOTLAR where SINAV1 not in (70,75,85,90) -- NOT IN Parantez içinde yazýlý olmayanlarý getirir.


--- BETWEEN KULLANIMI

select * from TBLNOTLAR where ortalama between 75 and 100 -- notlarý 75 ve 100 arasýnda olanlarý getir.
select * from TBLOGRENCILER where OGRAD between 'A' and 'D' -- A ile D arasýnda olanlarý getir.
select * from TBLOGRENCILER where OGRAD not between 'A' and 'D'  -- A ve D arasýnda olmayanlarý getir.

