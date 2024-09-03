
-- Hepsi burada DB den çalýþýyoruz.

select * from tbl_Personel
select Ulke,AVG(Maas) from tbl_Personel group by ulke -- AVG ortalamayý verir
select ulke,SUM(maas) from tbl_personel group by Ulke  -- SUM toplamý verir

--Erkekler ve bayanlarýn maaaþ ortalamasý

select cinsiyet,AVG(Maas) As [Ortalama Maaþ]from tbl_personel group by Cinsiyet

-- Her ülkeden kaç çalýþan var?

select ulke, COUNT(*) As [Her ülkede kaç kiþi çalýþýyor]from tbl_Personel group by Ulke

-- Biden fazla kolon group By 
select ulke, Sehir  from tbl_Personel group by ulke,Sehir -- hangi ülkede kaç þehir var?
select ulke from tbl_Personel group by Ulke -- hangi ülkeler var?

--Toplam Maaþ Hesaplama

select Ulke, SUM(maas) from tbl_personel group by ulke -- Ulkelere göre maaþlarý topla

-- Veritabaný NORTWIND seç 
select * from employees
select FirstName, lastname, Address + '****' + city +'****' + country from employees --Hangi üke hangi þehirden

-- Hepsi burada db ye geri dön.

--ülkelerin en yüksek maaaþý. 
select ulke,MAX(Maas) from tbl_personel group by ulke 
select ulke,MAX(Yas) from tbl_personel group by ulke --En yüksek yaþý MAX

select ulke,MIN(Maas) from tbl_personel group by ulke -- En düþük maaþ MIN

select ulke,MIN(Maas) from tbl_personel group by ulke order by ulke Desc -- ulkeleri tersten sýrala
select * from tbl_Personel

select ulke,MIN(Maas) As [En Düþük Maaþlarý Sýrala]from tbl_personel group by ulke order by [En Düþük Maaþlarý Sýrala]



/*HAVING kullanýmý
 Sadece group By ile kullanýlýr. HAVING where koþuluna benzer.
 COUNT,SUM,AVG,MAX,MIN ile where kullanamayýz. Onun yerine HAVING kullanýlýr.*/

 -- NORTWIND aç
 select * from Customers
 select * from customers where country = 'Argentina' -- Arjantinde kaç müþteri var açýklamalý getirir.

 select count (CustomerID) As [Kaç Müþteri Var?],country from Customers group by Country -- her ülkede kaç müþteri var? Sayý getirir.
 select count (CustomerID) As [Kaç Müþteri Var?],country from Customers group by Country HAVING count (customerID) >5 
 --5 taneden fazla müþteri olan ülkeleri göster.
 --------------------------------------------------------------------------------------------------

 select count (CustomerID) As [Kaç Müþteri Var?],country from Customers group by Country HAVING count (customerID) >5 order by [Kaç Müþteri Var?]
 --Küçükten büyüðe sýralama

 select count (CustomerID) As [Kaç Müþteri Var?],country from Customers group by Country HAVING count (customerID) >5 order by [Kaç Müþteri Var?] desc
  -- Büyükten küçüðe sýralama yapar

 select count (CustomerID) As [Kaç Müþteri Var?],country from Customers group by Country HAVING count (customerID) >5 order by country 
 -- 5 müþteriden fazla olan Ülkeleri alabetik sýrala

 select count (CustomerID) As [Kaç Müþteri Var?],country from Customers group by Country HAVING count (customerID) >5 order by country desc

 -- Country nin sonuna desc niye koyduk anlamadým. 

 ----------------------------------------------------------------------
 
 














