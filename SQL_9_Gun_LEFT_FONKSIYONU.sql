-- KARAKTER FONKSÝYONLARI NORTWIND Üzerinden
-- SOLDAN 5 KARAKTER VERÝR
select LEFT ('www.atesman.com',5) -- sonuc  www.a
--SAÐDAN 5 KARAKTER VERÝR
select RIGHT ('www.atesman.com',5) -- sonuc n.com
--BÜTÜN KARAKTERLERÝN SAYISINI VERÝR
select LEN ('www.atesman.com') -- sonuc 15 karakter
--BÜTÜN KARAKTERLERÝ KÜÇÜK YAZAR
select LOWER ('www.atesman.com')
--BÜTÜN KARAKTERLERÝ BÜYÜK YAZAR
select UPPER ('www.atesman.com')
--LTRIM soldaki boþluklarý alýr
select ltrim ('     cüneyt')
--RTRIM saðdaki boþluklarý alýr
select LTRIM (' cüneyt     ')
--TRIM saðdaki ve soldaki tüm boþluklarý alýr
select TRIM('    cüneyt    ')
--REVERSE tersden yazar 
select reverse ('www.atesman.com')
--SUBSTRING 5. karakterden 10. karaktere kadar al
select substring ('www.atesman.com',5,10)
/* STUFF 4.karakterden itibaren 9 karaktere kadar olan bölümü bununla deðiþtir. 
Ayný siteyi farklý domainlerde yayýnlamaya yardýmcý olur.*/
select STUFF ('www.atesman.com',4,8,'CuneytAtesman')
--CONCAT birleþtirme yapar
select concat ('Cüneyt',' Ateþman')
-- PATINDEX içinde a geçen leri göster
select FirstName, PATINDEX ('%a%',FirstName)from Employees
-- REPLACE - Deðiþtir X yerine bunu koy
select REPLACE ('5 saat sonra x ','X','GS-BJK Maçýna Gidiyorum')

---------------------------------------------
--MATEMATÝKSEL / SAYISAL FONKSÝYONLAR

-- ABS Mutlak Deðer sayý eksi olsada artýsýný verir
select ABS(-3)
select ABS (3)
insert into Products (productName,UnitPrice,UnitsInStock)
values
('Ürün100'-100,20)


-- HEPSÝ BURADA DB VE TABLOYA GEÇ PERSON TABLOSUNDA ÇALIÞ ÜST SOLDAN SEÇ

insert into tbl_person (adi,soyadi,yas)
values
('Ahmet','Demir',-26)

--TEST
select * from tbl_person

-- YAS ALANINA EKSÝ DEÐER GÝRÝLMESÝN

insert into tbl_person (adi,soyadi,yas)
values
('Selçuk','ASLAN',ABS(-20)) -- ABS Koyarsan eksi girilmez. Normal 20 girer.

--TEST

select * from tbl_person

-- POWER Üst alýr
select POWER (3,2) -- 3 ü 2 defa kendisiyle çarpmak demek 3*3 sonuç 9
select POWER (3,5) -- 3 ü 5 kere çarpar 243 - /3*3 =9 / 9*3 = 27 / 27*3 = 81 / 81*3 = 243


-- SQUARE Kendisini kendisiyle çarpar karesini alýr

select SQUARE (8) -- 64

-- SQRT KareKök Alýr

select SQRT (25) -- 25 sonucuna ulaþmak için kaçla kaçý çarpmak gerekir -- sonuç 5

-- ROUND Yuvarlama
select ROUND (2848.2435,2) --sonuç 2435 35 , 50'den küçük olduðu için aþaðýya yuvarlayacak 2848.2400,00 sonuç verecek
select ROUND (2848.2475,2) -- Sonuç 2475 75 50'den büyük olduðu için yukarý yuvarlayacak  2848.25,00 sonuç verecek

-- RAND Convert etmek
select CAST (RAND() * 100 as int) -- mesela günün ürününü rastgele deðiþik göstermek için kullanýlabilir
select RAND() -- 0 la 1 arasýnda rastgele sayý üretir.

-- CEILING Tam sayýyý yukarý yuvarlar
select CEILING (25.17) -- Tam sayýyý yukarý yuvarlar sonuç 26
-- FLOOR Tam sayýyý aþaðý yuvarlar
select FLOOR (25.17) -- Aþaðý yuvarlar sonuç 25

-- SIGN Pazitif mi? Nagetif mi? Yoksa 0 mý olduðunu söyler
select SIGN(255.5) -- sonuç 1.0
select SIGN (-255.5) -- sonuç -1.0
select SIGN (0) -- sonuç 0

-- AVG Ortalama almak  / NORTHWIND aç
select AVG(UnitPrice) from products -- Ürün fiyatlarýnýn ortalamasýný verir
-- fiyat kolonunu toplar kayýt sýrasýna böler ortalama alýr.

-- COUNT Sayý bulmak
select COUNT(*) from products -- kaç ürün var sayý olarak verir.
select COUNT(*)from Customers -- kaç müþteri var sayý olarak gösterir.

-- MAX En yüksek fiyat yada sayý bul
select MAX(UnitPrice)from Products -- ürün tablosundaki en yüksek fiyatý sorgular
-- MIN En düþük fiyatý veya sayýyý bulur
select MIN(UnitPrice)from Products

-- SUM tümünü topar
select SUM(UnitsInStock)from Products -- tüm stok miktarýný gösterir.

-- NEWID Ana sayfada farklý ürünler göstermek
select top 4 * from Products order by NEWID()-- her yenilemede farklý ürünlerden 4 adet gösterir.


-- TARÝHSEL HAZIR FONKSÝYONLAR
select GETDATE() -- þu anki tarihi ve saati verir.

-- sipariþ tarihi veya randevu tarihi girmek
insert into Employees (FirstName,LastName,HireDate)
values
('Deniz','Yýldýrým', GETDATE()+2)-- 2 gün sonrasý randevu

----------

insert into Employees (FirstName,LastName,HireDate)
values
('Aslan','Demirci', GETDATE()) -- þu anki sipariþ tarihi

-- TEST
select * from Employees

-- Merkezi saat genellikle LONDRA
select GETUTCDATE() -- GMT-UTC 00:00 LONDRA SAATÝ

-- SADECE YIL BÝLGÝSÝNÝ ALMAK
select YEAR(GETDATE()) -- þimdiki zamanýn sadece yýlý
select YEAR(GETDATE())+2 -- 2 yýl sonrasýný baþmak için +2 eklenebilir.

-- Sedce GÜN almak
select DAY(GETDATE())
select DAY(GETDATE())+5

-- Sadece AY almak
select MONTH(GETDATE())

-- DETAYLAR ALMAK
select DATEPART(YEAR,GETDATE())
select DATEPART(MONTH,GETDATE())
select DATEPART(DAY,GETDATE())
select DATEPART(HOUR,GETDATE())
select DATEPART(MINUTE,GETDATE()) -- þu kadar dakikada giriþ yapmazsan logout için kullanýlabilir.
select DATEPART(SECOND,GETDATE())

-- KAYITLARI TÜRKÇE GETÝRMEK

select DATENAME(dw,getdate())
set language turkish -- dil ayarýný türkçe deðiþtirir.
set language german -- dil ayarýný Almanca deðiþtirir.
set language English -- dil ayarýný Ýngilizce deðiþtirir.

-- TEST
select DATENAME(dw,getdate())

-- DATEADD Tarih ekle

select DATEADD(DAY,2,GETDATE()) -- Tarihe 2 gün ekler.
select DATEADD(DAY,-2,GETDATE()) -- Tarihten 2 gün eksiltir.

-- ISDATE 

select ISDATE('2012-02-29') -- Bu tarih geçerliyse 1 verir - True
select ISDATE('2012-02-32') -- Tarihte 32 gün çeken ay yok tarih geçersiz 0 verir - False gibi.

if ISDATE ('2022-04-31')=1
print 'Geçerli Tarih'
else
print 'Geçersiz Tarih'

------------------------------

-- COALESCE
select * from customers
select companyname,Region,address,coalesce(Region,Address,'Ýletiþim Bilgisi Yok') from Customers
-- Region kolonu NULL ise adresi ver Region ve Adreste NULL ise "iletiþim bilgisi yok" yazar.

-- ISNUMERIC
select ISNUMERIC('A') -- Numara deðilse 0 döndürür.
select ISNUMERIC('5') -- Numara varsa 1 döndürür.








