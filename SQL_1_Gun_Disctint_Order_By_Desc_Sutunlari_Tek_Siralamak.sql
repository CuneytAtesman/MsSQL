

-- BU ÇALIÞMALAR NORTHWIND için OLUÞTURULDU




select * from products where UnitPrice >=50 and UnitPrice <=100 and SupplierID=7 and CategoryID=8
select * from Categories

select * from products where categoryID = 5 or SupplierID=4

select distinct UnitPrice from Products -- unitprice yanýna virgülle ne istersen ekleyip sorgulatabilirsin. kaç deðiþik fiyat var 

select * from Customers

select distinct country from Customers

select distinct country,City from Customers /* tablonun içinde tek sutun getirmek için distinct kullanýlýr. kaç çeþit ülke var. ayný ükleler tek sayý çýkar
												þehir ve ülke yazýlýrsa ülke tek çýkmaz o ülkede bulunan her þehrin yanýnda ülke çýkar. ilçe yazýlýrsada ayný. sadece
												ülke sorgulanýrsa veya þehir sorgulanýrsa ayný ülke veya þehirden 10 tanede olsa 1 tanesini sonuç döndürür.*/

select distinct customerID from Customers

select distinct city from Customers
select * from products where productId=4

select * from products where ProductName = 'Chang' -- string kayýt aranacaksa '' tek týrnak iþaretleri arasýna yazýlýr.

select * from products where productName = 'Chang'

select * from products where productID=10  -- sadece 10 numaralý ID gelsin

select * from products where productID != 10  -- 10 numarayý getirme. sorguya dahil etme.

select * from products where ProductID >=10  -- 10 dahil üstünü getir. sadece > olursa 11 den baþlar

select * from products where ProductID<=10  -- 10 dahil 10 dan küçük olanlarý getir. sacede < varsa 9 dan aþaðý gider

select * from products where UnitPrice >10
select * from products where UnitPrice <10


--**************************************************************************************
--AND - OR - NOT Sorgularý tanýmlamank

select * from Customers

select * from Customers where Country = 'Germany' and city= 'Berlin' -- AND kullanýmý ülke Germany ayný zamanda þehir Berlin olanlarý sorgular. þehir berlin ülke almanya olanlarý listele

-- OR Kullanýmý

select * from customers where city = 'Berlin' or city = 'München' or city= 'London'  -- OR kullanýmý ondan yada yada bndan varsa onlarý getir.

-- NOT Kullanýmý

select * from customers where not country = 'Germany' -- Ülkesi Germany olmayanlar sýralansýn

select * from customers where Country != 'Germany'   -- bu þekildede yazýlabilir. NOT için 2 satýrda ayný sonucu verir.



-- (   )   PARANTEZ KULLANIMI

select * from customers where Country = 'Germany' and (city = 'berlin' or city = 'München')

/* Herhangi bir tablo içinde tablo baþlýðý içindekileri sorgulamak için parantez kullan. 
and kullanýrsan illede karþýlýðý olmasý gerekiyor Almanya ve Berlin. OR kullanýrsan Almanyada ki tüm þehirleri listeler.
Þehirler or olabilir ama ALmanya içinde sorguladýðýmýz için ALmanya AND olmalý, içi için or olabilir.*/



-- ORDER BY - DESC - TOP KUllanýmý

-- ORDER BY (Sýralama) 
-- DESC En yüksekden aþaðý doðru sýralar sona eklenir.

select * from Products order by UnitPrice -- ORDER BY (Sýrala Demek) Ucuzdan pahalýya doðru sýralarma yapar. Yada en küçükden büyüðe doðru sýralar. Gösterim bu þekilde olur normal sýralamasý deðiþmez.


select * from products order by ReorderLevel -- sýfýrdan baþlayýp yukarý sýralar. En ufaktan baþlar.

select * from products order by Unitprice desc /* DESC kullanýrsan pahalýdan düþüðe göre sýralama yapar veya en büyükden en küçüðe doðru sýralama yapar.
												DESC yerine ASC yazarsan normal sýralama yapar. Ama yazmayýp býrakýrsanda ayný  normal sýralamayý yapar.*/


select * from products order by unitprice, CategoryID -- 2 Sütün veya daha fazlasýný sýralamak istersen alfabetik gibi. veya en düþük fiyat olan kategorileride sýralar.






