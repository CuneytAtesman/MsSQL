

--- ORDER BY kullanmak / sýralama 

select * from TBLOGRENCILER

select * from TBLOGRENCILER order by OGRAD -- ALfabetik sýralama yapar
select * from TBLOGRENCILER order by OGRAD asc -- A dan z ye sýralar
select * from TBLOGRENCILER order by OGRAD desc -- z den a ya doðru sýralar.

select * from TBLOGRENCILER order by OGRCINSIYET asc -- desc

select * from TBLOGRENCILER order by OGRSEHIR asc -- desc

select distinct OGRKULUP from TBLOGRENCILER order by OGRKULUP desc


