

--- ORDER BY kullanmak / s�ralama 

select * from TBLOGRENCILER

select * from TBLOGRENCILER order by OGRAD -- ALfabetik s�ralama yapar
select * from TBLOGRENCILER order by OGRAD asc -- A dan z ye s�ralar
select * from TBLOGRENCILER order by OGRAD desc -- z den a ya do�ru s�ralar.

select * from TBLOGRENCILER order by OGRCINSIYET asc -- desc

select * from TBLOGRENCILER order by OGRSEHIR asc -- desc

select distinct OGRKULUP from TBLOGRENCILER order by OGRKULUP desc


