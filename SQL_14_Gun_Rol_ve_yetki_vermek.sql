
-- NORTWIND A�

-- DML - DDL - DCL
----------------------------------
-- DML / (Data Manupulation Language=veri i�leme dili)
-- CRUD = insert, delete,update, select
-----------------------------------------------
-- DDL / (Data Definition Language = veri tan�mlama dili)
-- Create Table, ALter Table, Drop Tablo

-- DCL / (Data Control Language = veri Kontrol dili)
-- DCL komutlar�n� kullanabilmek i�in yetki olanlar (Loginleri yetkileri ay�rmak)
-- (sysadmin,dbcreator, db_owner, db_securityadmin)

-- grant: izin rol vermek i�in kullan�l�r.
-- deny: izin rol veremeyiz
-- revoke: daha �nce verilen t�m k�s�tlamalar� ve izinleri iptal eder.
-- Kimler �al��t�rabilir: = sys_admin, dbowner, db_securityadmin

-- S�STEMDE K�MLER OLDU�UNU G�RMEK ���N SORGULAMA YAPMAK

select * from sys.sql_logins

select LOGINPROPERTY ('sa','dayUntilExpiration') -- login �m�rlerini sorgulamak.

--job (Lisansl� sql lerde kullan�labilir)
--------------------------------------------------

-- LOGIN A�MAK

/* sa�da security alt�nda login klasorune sa� tu� newlogin,isimyaz, �ifre vermek istersen SQLServer authentication i�aretle. 
isime yetki vermek i�in sa�tu� > properties a��lan pencerede sa�da server roller var onlardan se�ebilirsin. 
daha sonra usermapping den hangi db yi kullanmas�n� istersen onu se�ersin. veri taban�n� se�ti�inde alt�nda hangi rolleri verebilece�in ��kar.*/

/* sisteme ait yetkiler oldu�u gibi. DB lerin kendi i�indede yetkilendirme yap�labilir. 
DB ile ilgili roller veya yaz�l�m ile ilgili roller DB-security alt�ndan verilebilir.*/

/* sistem de disk yarat�labilir. ve bu disklere b�y�k veriler konulabilir. 
�RNEK:   1 product
		2 sipari� - sipari� detay - devaml� kullan�lan i�in yeni disk a��labilir.
		3 kategori
		4 marka */

		-- BULK admin = (Genelde d��ardan exel dosyas� gibi dosya �ekme i�lemleri i�in kullan�lan yetki.)
		/*  dbcreator = veri taban� olu�turucusu. / silebilir, olu�urabilir, create edebilir, g�ncelleme yapabilir. 
		Yaz�l�mc�lara test i�in verilen yetki budur.*/

		-- DISKADMIN = veri taban� dosyalar�n� bu y�netir.
		-- PROCESS ADMIN = prosesleri y�netir. (Diskler yava�lay�nca baz� acil olmayan i�leri ertelemek i�in kullan�l�r.)
		-- PUBLIC = standart ayarlarla giri� yapanlara varsay�lan olarak verilen yetki.
		/* SECURITY ADMIN = Login bilgilerini y�netir. (Login yetkileri ile ilgili)SQL server hesab� olu�turabilir.
			silebilir, �ifreleri s�f�rlayabilir.*/

		-- SERVER ADMIN = ANabilgisayar� baslat/durdur yapabilir.
		-- SETUP ADMIN = Kurulum y�neticisi. Ba�ka veri taban� kullanabilir.
		-- SYSADMIN = Serverdeki her i�i yapabilir. T�m yetkilere sahiptir. (ADMIN)
		-- DB_ACCESSADMIN = Veri taban�nda kullan�c�lara, veri taban�na eri�im yetkisi atayabilen y�netici.
		-- db_Backupoperator = Veri taban�n�n yede�ini almaya yetkilidir.
		-- DB_datareader = Kullan�c�lar�n select sorgusunu �al��t�rmas�na izin verir. Sadece okuyabilir.
		-- db_datawriter = kullan�c�lar�n insert, delete, update sorgusunu �al��t�rmas�na izin verir.
		-- db_ddladmin = DDL komutlar�n� �al��t�rmas�na izin verir.
		-- db_denydatareader = kullan�c�lar�n select sorgusunu �al��t�rmas�n� k�s�tlar.
		-- db_denydatawriter = kullan�c�lar�n insert, delete, update sorgusunu �al��t�rmas�n� k�s�tlar.
		-- db_owner = veritaba�n�nda en y�ksek yetkili budur. siler, ekler, g�nceller,ba�lat�p durdurabilir.
		-- db_securityadmin = kural yetkilerini y�netir. 1- her�eyi g�rs�n 2- maa�lar� g�rmesin vs gibi.

		-- haz�r stor prosedurler kullan�labilir. 
		exec sp_addrolemember @rolename'bulkadmin',@membername='sedat' 
		-- Kural atamas� yapan, kuraldan ��karan 
		exec sp_droprolemember
		-- Kural yetki listesi sorgular
		exec sp_helpdbfixedrole

-- VER� TABANINA EXEL AKTARMAK

-- database_exel ad�nda yeni db a�t�k. exel dosyas�n� �a��raca��z.
/* Db ye sa� tu�, task, altta import data t�kla, a��lan pencereden next,flat file se�, exel s�r�m�n� CSV ye �evir. import et.*/


-- SQL Server Agent / Lisansl� SQL lerde bulunur. MsSql job Olu�turma. sa� t�kla job olu�tur. internetten ara�t�r.(Yedek almak olabilir)

-----------------------------------------------------------------------

-- GER�YE DE�ER D�ND�REN PROSEDURLER NORTWIND
create proc sp_urunadiver_fiyatal
(
@urunadi nvarchar(50),
@fiyat money out
)
as
select @fiyat = UnitPrice from products where ProductName = @urunadi

------------------

select * from Products





		
