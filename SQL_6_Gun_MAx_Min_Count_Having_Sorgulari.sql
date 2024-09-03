
-- Hepsi burada DB den �al���yoruz.

select * from tbl_Personel
select Ulke,AVG(Maas) from tbl_Personel group by ulke -- AVG ortalamay� verir
select ulke,SUM(maas) from tbl_personel group by Ulke  -- SUM toplam� verir

--Erkekler ve bayanlar�n maaa� ortalamas�

select cinsiyet,AVG(Maas) As [Ortalama Maa�]from tbl_personel group by Cinsiyet

-- Her �lkeden ka� �al��an var?

select ulke, COUNT(*) As [Her �lkede ka� ki�i �al���yor]from tbl_Personel group by Ulke

-- Biden fazla kolon group By 
select ulke, Sehir  from tbl_Personel group by ulke,Sehir -- hangi �lkede ka� �ehir var?
select ulke from tbl_Personel group by Ulke -- hangi �lkeler var?

--Toplam Maa� Hesaplama

select Ulke, SUM(maas) from tbl_personel group by ulke -- Ulkelere g�re maa�lar� topla

-- Veritaban� NORTWIND se� 
select * from employees
select FirstName, lastname, Address + '****' + city +'****' + country from employees --Hangi �ke hangi �ehirden

-- Hepsi burada db ye geri d�n.

--�lkelerin en y�ksek maaa��. 
select ulke,MAX(Maas) from tbl_personel group by ulke 
select ulke,MAX(Yas) from tbl_personel group by ulke --En y�ksek ya�� MAX

select ulke,MIN(Maas) from tbl_personel group by ulke -- En d���k maa� MIN

select ulke,MIN(Maas) from tbl_personel group by ulke order by ulke Desc -- ulkeleri tersten s�rala
select * from tbl_Personel

select ulke,MIN(Maas) As [En D���k Maa�lar� S�rala]from tbl_personel group by ulke order by [En D���k Maa�lar� S�rala]



/*HAVING kullan�m�
 Sadece group By ile kullan�l�r. HAVING where ko�uluna benzer.
 COUNT,SUM,AVG,MAX,MIN ile where kullanamay�z. Onun yerine HAVING kullan�l�r.*/

 -- NORTWIND a�
 select * from Customers
 select * from customers where country = 'Argentina' -- Arjantinde ka� m��teri var a��klamal� getirir.

 select count (CustomerID) As [Ka� M��teri Var?],country from Customers group by Country -- her �lkede ka� m��teri var? Say� getirir.
 select count (CustomerID) As [Ka� M��teri Var?],country from Customers group by Country HAVING count (customerID) >5 
 --5 taneden fazla m��teri olan �lkeleri g�ster.
 --------------------------------------------------------------------------------------------------

 select count (CustomerID) As [Ka� M��teri Var?],country from Customers group by Country HAVING count (customerID) >5 order by [Ka� M��teri Var?]
 --K���kten b�y��e s�ralama

 select count (CustomerID) As [Ka� M��teri Var?],country from Customers group by Country HAVING count (customerID) >5 order by [Ka� M��teri Var?] desc
  -- B�y�kten k����e s�ralama yapar

 select count (CustomerID) As [Ka� M��teri Var?],country from Customers group by Country HAVING count (customerID) >5 order by country 
 -- 5 m��teriden fazla olan �lkeleri alabetik s�rala

 select count (CustomerID) As [Ka� M��teri Var?],country from Customers group by Country HAVING count (customerID) >5 order by country desc

 -- Country nin sonuna desc niye koyduk anlamad�m. 

 ----------------------------------------------------------------------
 
 














