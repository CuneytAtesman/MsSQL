

-- ORDER BY - DESC - TOP


select * from products order by ProductName desc -- 1 gun tekrarý
select * from products order by unitprice, CategoryID -- alfabetik listelemek içinde kullanýlýr

select * from Customers order by Country -- ayný zamanda alfabetik sýralar

select * from Customers order by Country, city -- ülke ve ülke içi þehirleri alfabetik sýralar.
select * from customers order by Country,city,Address -- ülke,þehir, adresleri alfabetik sýralar

-- TOP Kullanýmý  (SELECT TOP *) baþlar

select top 10 * from Products -- en üstteki ilk 10 ürünü listeler.






--NULL Kontrolü  IS NULL

select * from Products where QuantityPerUnit is NULL  -- Products edit top tablosundan bir deðeri NULL Yap sorgulat. 1. ürün fiyatýný NULL yaptýk.

select * from Products where UnitPrice is NULL -- fiyatýn NULL olduðunu görürsün. yani hiç deðer yok boþluk bile yok.

select * from Products where UnitPrice is not null  -- boþluk NULL olmayan fiyatlarý listeler. ( is not null) 1. hariç diðerlerini getirir. 1. NULL yapmýþtýk.


-------- HAZIR KOMUTLAR  - MIN - MAX

select min (unitprice)  from Products -- En düþük fiyatý görmek için MIN
select max (UnitPrice) from products -- En yüksek fiyatý görmek için kullanýlýr.

select top 10 * from Products order by UnitPrice  -- ilk en düþük fiyatlarýn 10 tanesini sýralar. 10 yerine 1 yaparsan MIN iþlevini görür. stok Filtrelemelerde kullanýlýr.
select top 10 * from products order by unitprice DESC -- en yüksek fiyatlarýn 10 tanesini sýralar. 10 yerine 1 yaparsan MAX iþlevini görür. stok Filtrelemelerde kullanýlýr.

select top 10 * from products order by UnitsInStock
select top  100* from products order by UnitsInStock DESC -- stok takibinde kullanýlabilir. Yazýlýmda 0 olanlarý kýrmýzý yapabilirsin renkten ilk bakýþta belli olur.

select * from Products order by UnitsInStock  -- stoklarý 0 dan itibaren sýralamaya baþlar. stok takibi için kullanýlýr.

select top 1 * from Products order by UnitPrice -- En ucuz fiyatlý ürünün stok adedini gösterir tüm bilgiler ile.
select top 1 * from products order by UnitPrice DESC -- En yüksek fiyatlý ürünün stok ve tüm bilgilerini getir.


-- KAYIT VEYA ÜRÜN SIRASINI ALMAK

select * from products  -- 77 ürün var NORTWND üzerinde

select count (ProductID) from Products -- ürün sayýsýný bulur.
select count (*) from Products -- bu þekildede yazýlabilir. iki seçenekte kullanýlýr.


-- ORTALAMA ALMAK SORGULATMAK

select AVG (UnitPrice) from Products/* Ürünlerin fiyatýnýn ortalamasýný almak. Bütün fiyatlarý alýp, kayýt sýralamasýna göre böler.
									Hazýr komutlar kullanýlýrken select sonra Hazýr komut, sorgulanacak deðer parantez içinde yazýlýr. tablo ismi eklenir.*/


-- SUM  (STOK TOPLAMA - Toplam Ürün sayýsý)

select SUM (UnitsInStock)from products -- Toplam stok sayýsýný sorgular


/*LIKE sorgusu / a ile baþlayanlarý bulmak. a ile bitenleri bulmak. içinde a geçenleri bulmak, abc içinde abc geçenleri bulmak vs
% iþaret önce veya sonra kaç karakter olduðunun önemi yok demektir.*/

select * from Products where ProductName like 'a%' -- Ürün ismi a ile baþlayanlar
select * from products where ProductName like'%a'  -- ürün ismi a ile bitenler
select * from products where ProductName like'%a%' -- içinde a geçen herhengi bir isim
select * from products where productName like 'c%g' -- c ile baþlayýp g ile bitenler
select * from products where productName like '%an%'-- baþý sonu önemli deðil içinde an geçen tüm isimler
select * from products where productName like '_O%' -- ikinci harfi O olanlar. Alt çizgi 1 karakter ikinci karakteri o olanlarý sorgular
select * from products where productName like '__o%' -- 3. harfi O olanlar.
select * from products where productName like '%O__'  -- sondan 3 harf gerideki harfi O olanlar
select * from products where productName like'_O_t%'  -- 2. karakter O, 4. Karakter T olan sorgular


select * from customers where City like '[bsp]%' -- içinde BSP harfleri geçen þehirleri sorgular.
select * from Customers where city like '[bsp]%' order by city -- B ile baþlayanlar, sonra S ile baþlayanlar P ile baþlayanlarý sýralar.
select top 5 * from customers where city like '[bsp]%' order by city -- sorgulamanýn sadece 5 tanesini getirir. bazý harfler eksik kalabilir.
select * from customers where city not like '[bsp]%' -- BSP ile baþlamayanlarý sorgula
select * from customers where city like '[a-d]%' order by City -- A ve D ye kadar olan A,B,C,D harfleriniyle baþlayan þehirleri sorgular.
select * from customers where city not like '[a-d]%'order by City -- A ve D arasýndaki þehirleri sorguya dahil etmez.

-- IN sorgu komutu

select * from customers where country = 'Germany' or Country='UK' or country ='France' -- Normal yazýlým þekli. Bu ülkelerden biri varsa sorguya getir.
select * from customers where country in('Germany','UK','France') -- Ayný kayýtlarý IN le alabiliyoruz. IN kullanýldýðýnda VEYA, VEYA, VEYA - OR yerine geçer.
select * from customers where country not in ('Germany','UK','France') -- Germany, UK, France olmayanlarý sorgular.


-- BETWEEN sorgu komutu

select * from products where UnitPrice >= 10 and UnitPrice <=20  -- Fiyatý 10 veya 10 dan büyük olanlar ile fiyatý 20 veya 20 den küçük olanlarý sorgular.
select * from products where unitprice between 10 and 20 -- BETWEEN Kullanarak Bu þekilde de yazýlabilir.



-- Fiyat 10 ile 20 arasýnda olsun. Ayný zamanda kategori ID si 1,2,3 olmasýn

select * from Products where (UnitPrice between 10 and 20) and not CategoryID in (1,2,3) order by UnitPrice, CategoryID


-- TARÝH ARALIÐI SÝPARÝÞ SORGULAMA

select * from Orders where orderdate between '1996-07-04' and '1996-07-16'  -- yazýlýmdan stor precedure gelecek. Tarihler deðiþken olacak. @baslangictarihi , @bitistarihi gibi


-- 0. Kayýttan 10 ürün 10 ürün getir. Yazýlýmda sayfa kaydýkça yüklenen kodlamalar.

select * from Products order by productID 
offset 0 rows 
fetch next 10 rows only -- ürün baþlangýç numarasý ve kaç deðer göstereceksin deðiþkenle gönderilir. @baslangicno , @adet gibi deðiþkenler gönderilir.











































