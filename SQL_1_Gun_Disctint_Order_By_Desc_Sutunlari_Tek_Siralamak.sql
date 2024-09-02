

-- BU �ALI�MALAR NORTHWIND i�in OLU�TURULDU




select * from products where UnitPrice >=50 and UnitPrice <=100 and SupplierID=7 and CategoryID=8
select * from Categories

select * from products where categoryID = 5 or SupplierID=4

select distinct UnitPrice from Products -- unitprice yan�na virg�lle ne istersen ekleyip sorgulatabilirsin. ka� de�i�ik fiyat var 

select * from Customers

select distinct country from Customers

select distinct country,City from Customers /* tablonun i�inde tek sutun getirmek i�in distinct kullan�l�r. ka� �e�it �lke var. ayn� �kleler tek say� ��kar
												�ehir ve �lke yaz�l�rsa �lke tek ��kmaz o �lkede bulunan her �ehrin yan�nda �lke ��kar. il�e yaz�l�rsada ayn�. sadece
												�lke sorgulan�rsa veya �ehir sorgulan�rsa ayn� �lke veya �ehirden 10 tanede olsa 1 tanesini sonu� d�nd�r�r.*/

select distinct customerID from Customers

select distinct city from Customers
select * from products where productId=4

select * from products where ProductName = 'Chang' -- string kay�t aranacaksa '' tek t�rnak i�aretleri aras�na yaz�l�r.

select * from products where productName = 'Chang'

select * from products where productID=10  -- sadece 10 numaral� ID gelsin

select * from products where productID != 10  -- 10 numaray� getirme. sorguya dahil etme.

select * from products where ProductID >=10  -- 10 dahil �st�n� getir. sadece > olursa 11 den ba�lar

select * from products where ProductID<=10  -- 10 dahil 10 dan k���k olanlar� getir. sacede < varsa 9 dan a�a�� gider

select * from products where UnitPrice >10
select * from products where UnitPrice <10


--**************************************************************************************
--AND - OR - NOT Sorgular� tan�mlamank

select * from Customers

select * from Customers where Country = 'Germany' and city= 'Berlin' -- AND kullan�m� �lke Germany ayn� zamanda �ehir Berlin olanlar� sorgular. �ehir berlin �lke almanya olanlar� listele

-- OR Kullan�m�

select * from customers where city = 'Berlin' or city = 'M�nchen' or city= 'London'  -- OR kullan�m� ondan yada yada bndan varsa onlar� getir.

-- NOT Kullan�m�

select * from customers where not country = 'Germany' -- �lkesi Germany olmayanlar s�ralans�n

select * from customers where Country != 'Germany'   -- bu �ekildede yaz�labilir. NOT i�in 2 sat�rda ayn� sonucu verir.



-- (   )   PARANTEZ KULLANIMI

select * from customers where Country = 'Germany' and (city = 'berlin' or city = 'M�nchen')

/* Herhangi bir tablo i�inde tablo ba�l��� i�indekileri sorgulamak i�in parantez kullan. 
and kullan�rsan illede kar��l��� olmas� gerekiyor Almanya ve Berlin. OR kullan�rsan Almanyada ki t�m �ehirleri listeler.
�ehirler or olabilir ama ALmanya i�inde sorgulad���m�z i�in ALmanya AND olmal�, i�i i�in or olabilir.*/



-- ORDER BY - DESC - TOP KUllan�m�

-- ORDER BY (S�ralama) 
-- DESC En y�ksekden a�a�� do�ru s�ralar sona eklenir.

select * from Products order by UnitPrice -- ORDER BY (S�rala Demek) Ucuzdan pahal�ya do�ru s�ralarma yapar. Yada en k���kden b�y��e do�ru s�ralar. G�sterim bu �ekilde olur normal s�ralamas� de�i�mez.


select * from products order by ReorderLevel -- s�f�rdan ba�lay�p yukar� s�ralar. En ufaktan ba�lar.

select * from products order by Unitprice desc /* DESC kullan�rsan pahal�dan d����e g�re s�ralama yapar veya en b�y�kden en k����e do�ru s�ralama yapar.
												DESC yerine ASC yazarsan normal s�ralama yapar. Ama yazmay�p b�rak�rsanda ayn�  normal s�ralamay� yapar.*/


select * from products order by unitprice, CategoryID -- 2 S�t�n veya daha fazlas�n� s�ralamak istersen alfabetik gibi. veya en d���k fiyat olan kategorileride s�ralar.






