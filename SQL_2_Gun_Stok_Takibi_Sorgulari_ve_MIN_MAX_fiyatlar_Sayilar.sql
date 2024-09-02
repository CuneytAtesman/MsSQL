

-- ORDER BY - DESC - TOP


select * from products order by ProductName desc -- 1 gun tekrar�
select * from products order by unitprice, CategoryID -- alfabetik listelemek i�inde kullan�l�r

select * from Customers order by Country -- ayn� zamanda alfabetik s�ralar

select * from Customers order by Country, city -- �lke ve �lke i�i �ehirleri alfabetik s�ralar.
select * from customers order by Country,city,Address -- �lke,�ehir, adresleri alfabetik s�ralar

-- TOP Kullan�m�  (SELECT TOP *) ba�lar

select top 10 * from Products -- en �stteki ilk 10 �r�n� listeler.






--NULL Kontrol�  IS NULL

select * from Products where QuantityPerUnit is NULL  -- Products edit top tablosundan bir de�eri NULL Yap sorgulat. 1. �r�n fiyat�n� NULL yapt�k.

select * from Products where UnitPrice is NULL -- fiyat�n NULL oldu�unu g�r�rs�n. yani hi� de�er yok bo�luk bile yok.

select * from Products where UnitPrice is not null  -- bo�luk NULL olmayan fiyatlar� listeler. ( is not null) 1. hari� di�erlerini getirir. 1. NULL yapm��t�k.


-------- HAZIR KOMUTLAR  - MIN - MAX

select min (unitprice)  from Products -- En d���k fiyat� g�rmek i�in MIN
select max (UnitPrice) from products -- En y�ksek fiyat� g�rmek i�in kullan�l�r.

select top 10 * from Products order by UnitPrice  -- ilk en d���k fiyatlar�n 10 tanesini s�ralar. 10 yerine 1 yaparsan MIN i�levini g�r�r. stok Filtrelemelerde kullan�l�r.
select top 10 * from products order by unitprice DESC -- en y�ksek fiyatlar�n 10 tanesini s�ralar. 10 yerine 1 yaparsan MAX i�levini g�r�r. stok Filtrelemelerde kullan�l�r.

select top 10 * from products order by UnitsInStock
select top  100* from products order by UnitsInStock DESC -- stok takibinde kullan�labilir. Yaz�l�mda 0 olanlar� k�rm�z� yapabilirsin renkten ilk bak��ta belli olur.

select * from Products order by UnitsInStock  -- stoklar� 0 dan itibaren s�ralamaya ba�lar. stok takibi i�in kullan�l�r.

select top 1 * from Products order by UnitPrice -- En ucuz fiyatl� �r�n�n stok adedini g�sterir t�m bilgiler ile.
select top 1 * from products order by UnitPrice DESC -- En y�ksek fiyatl� �r�n�n stok ve t�m bilgilerini getir.


-- KAYIT VEYA �R�N SIRASINI ALMAK

select * from products  -- 77 �r�n var NORTWND �zerinde

select count (ProductID) from Products -- �r�n say�s�n� bulur.
select count (*) from Products -- bu �ekildede yaz�labilir. iki se�enekte kullan�l�r.


-- ORTALAMA ALMAK SORGULATMAK

select AVG (UnitPrice) from Products/* �r�nlerin fiyat�n�n ortalamas�n� almak. B�t�n fiyatlar� al�p, kay�t s�ralamas�na g�re b�ler.
									Haz�r komutlar kullan�l�rken select sonra Haz�r komut, sorgulanacak de�er parantez i�inde yaz�l�r. tablo ismi eklenir.*/


-- SUM  (STOK TOPLAMA - Toplam �r�n say�s�)

select SUM (UnitsInStock)from products -- Toplam stok say�s�n� sorgular


/*LIKE sorgusu / a ile ba�layanlar� bulmak. a ile bitenleri bulmak. i�inde a ge�enleri bulmak, abc i�inde abc ge�enleri bulmak vs
% i�aret �nce veya sonra ka� karakter oldu�unun �nemi yok demektir.*/

select * from Products where ProductName like 'a%' -- �r�n ismi a ile ba�layanlar
select * from products where ProductName like'%a'  -- �r�n ismi a ile bitenler
select * from products where ProductName like'%a%' -- i�inde a ge�en herhengi bir isim
select * from products where productName like 'c%g' -- c ile ba�lay�p g ile bitenler
select * from products where productName like '%an%'-- ba�� sonu �nemli de�il i�inde an ge�en t�m isimler
select * from products where productName like '_O%' -- ikinci harfi O olanlar. Alt �izgi 1 karakter ikinci karakteri o olanlar� sorgular
select * from products where productName like '__o%' -- 3. harfi O olanlar.
select * from products where productName like '%O__'  -- sondan 3 harf gerideki harfi O olanlar
select * from products where productName like'_O_t%'  -- 2. karakter O, 4. Karakter T olan sorgular


select * from customers where City like '[bsp]%' -- i�inde BSP harfleri ge�en �ehirleri sorgular.
select * from Customers where city like '[bsp]%' order by city -- B ile ba�layanlar, sonra S ile ba�layanlar P ile ba�layanlar� s�ralar.
select top 5 * from customers where city like '[bsp]%' order by city -- sorgulaman�n sadece 5 tanesini getirir. baz� harfler eksik kalabilir.
select * from customers where city not like '[bsp]%' -- BSP ile ba�lamayanlar� sorgula
select * from customers where city like '[a-d]%' order by City -- A ve D ye kadar olan A,B,C,D harfleriniyle ba�layan �ehirleri sorgular.
select * from customers where city not like '[a-d]%'order by City -- A ve D aras�ndaki �ehirleri sorguya dahil etmez.

-- IN sorgu komutu

select * from customers where country = 'Germany' or Country='UK' or country ='France' -- Normal yaz�l�m �ekli. Bu �lkelerden biri varsa sorguya getir.
select * from customers where country in('Germany','UK','France') -- Ayn� kay�tlar� IN le alabiliyoruz. IN kullan�ld���nda VEYA, VEYA, VEYA - OR yerine ge�er.
select * from customers where country not in ('Germany','UK','France') -- Germany, UK, France olmayanlar� sorgular.


-- BETWEEN sorgu komutu

select * from products where UnitPrice >= 10 and UnitPrice <=20  -- Fiyat� 10 veya 10 dan b�y�k olanlar ile fiyat� 20 veya 20 den k���k olanlar� sorgular.
select * from products where unitprice between 10 and 20 -- BETWEEN Kullanarak Bu �ekilde de yaz�labilir.



-- Fiyat 10 ile 20 aras�nda olsun. Ayn� zamanda kategori ID si 1,2,3 olmas�n

select * from Products where (UnitPrice between 10 and 20) and not CategoryID in (1,2,3) order by UnitPrice, CategoryID


-- TAR�H ARALI�I S�PAR�� SORGULAMA

select * from Orders where orderdate between '1996-07-04' and '1996-07-16'  -- yaz�l�mdan stor precedure gelecek. Tarihler de�i�ken olacak. @baslangictarihi , @bitistarihi gibi


-- 0. Kay�ttan 10 �r�n 10 �r�n getir. Yaz�l�mda sayfa kayd�k�a y�klenen kodlamalar.

select * from Products order by productID 
offset 0 rows 
fetch next 10 rows only -- �r�n ba�lang�� numaras� ve ka� de�er g�stereceksin de�i�kenle g�nderilir. @baslangicno , @adet gibi de�i�kenler g�nderilir.











































