
-- TOP KULLANIMI

select * from TBLOGRENCILER

select top 3* from TBLOGRENCILER -- �sten ilk 3 taneyi getirir.

select top 3* from TBLOGRENCILER order by OGRID desc -- en alttaki 3 taneyi s�ralad�.

-- PERCENT Kullan�m�

select top 60 percent * from TBLOGRENCILER -- ��rencilerin y�zde 60 �n� getir.

-- IN KUllan�m�

select * from TBLOGRENCILER where OGRSEHIR ='�zmir' or OGRSEHIR= '�stanbul' or OGRSEHIR='Bursa' -- Bu �ekilde uzun yazmaktan kurtar�r.

select * from TBLOGRENCILER where OGRSEHIR in('�zmir','Adana','Bursa')

select * from TBLNOTLAR where SINAV1 in (70,75,85,90) -- parantez i�inde yaz�l� olanlar� getirir.

select * from TBLNOTLAR where SINAV1 not in (70,75,85,90) -- NOT IN Parantez i�inde yaz�l� olmayanlar� getirir.


--- BETWEEN KULLANIMI

select * from TBLNOTLAR where ortalama between 75 and 100 -- notlar� 75 ve 100 aras�nda olanlar� getir.
select * from TBLOGRENCILER where OGRAD between 'A' and 'D' -- A ile D aras�nda olanlar� getir.
select * from TBLOGRENCILER where OGRAD not between 'A' and 'D'  -- A ve D aras�nda olmayanlar� getir.

