
-- NORTWIND AÇ

-- DML - DDL - DCL
----------------------------------
-- DML / (Data Manupulation Language=veri iþleme dili)
-- CRUD = insert, delete,update, select
-----------------------------------------------
-- DDL / (Data Definition Language = veri tanýmlama dili)
-- Create Table, ALter Table, Drop Tablo

-- DCL / (Data Control Language = veri Kontrol dili)
-- DCL komutlarýný kullanabilmek için yetki olanlar (Loginleri yetkileri ayýrmak)
-- (sysadmin,dbcreator, db_owner, db_securityadmin)

-- grant: izin rol vermek için kullanýlýr.
-- deny: izin rol veremeyiz
-- revoke: daha önce verilen tüm kýsýtlamalarý ve izinleri iptal eder.
-- Kimler çalýþtýrabilir: = sys_admin, dbowner, db_securityadmin

-- SÝSTEMDE KÝMLER OLDUÐUNU GÖRMEK ÝÇÝN SORGULAMA YAPMAK

select * from sys.sql_logins

select LOGINPROPERTY ('sa','dayUntilExpiration') -- login ömürlerini sorgulamak.

--job (Lisanslý sql lerde kullanýlabilir)
--------------------------------------------------

-- LOGIN AÇMAK

/* saðda security altýnda login klasorune sað tuþ newlogin,isimyaz, þifre vermek istersen SQLServer authentication iþaretle. 
isime yetki vermek için saðtuþ > properties açýlan pencerede saðda server roller var onlardan seçebilirsin. 
daha sonra usermapping den hangi db yi kullanmasýný istersen onu seçersin. veri tabanýný seçtiðinde altýnda hangi rolleri verebileceðin çýkar.*/

/* sisteme ait yetkiler olduðu gibi. DB lerin kendi içindede yetkilendirme yapýlabilir. 
DB ile ilgili roller veya yazýlým ile ilgili roller DB-security altýndan verilebilir.*/

/* sistem de disk yaratýlabilir. ve bu disklere büyük veriler konulabilir. 
ÖRNEK:   1 product
		2 sipariþ - sipariþ detay - devamlý kullanýlan için yeni disk açýlabilir.
		3 kategori
		4 marka */

		-- BULK admin = (Genelde dýþardan exel dosyasý gibi dosya çekme iþlemleri için kullanýlan yetki.)
		/*  dbcreator = veri tabaný oluþturucusu. / silebilir, oluþurabilir, create edebilir, güncelleme yapabilir. 
		Yazýlýmcýlara test için verilen yetki budur.*/

		-- DISKADMIN = veri tabaný dosyalarýný bu yönetir.
		-- PROCESS ADMIN = prosesleri yönetir. (Diskler yavaþlayýnca bazý acil olmayan iþleri ertelemek için kullanýlýr.)
		-- PUBLIC = standart ayarlarla giriþ yapanlara varsayýlan olarak verilen yetki.
		/* SECURITY ADMIN = Login bilgilerini yönetir. (Login yetkileri ile ilgili)SQL server hesabý oluþturabilir.
			silebilir, þifreleri sýfýrlayabilir.*/

		-- SERVER ADMIN = ANabilgisayarý baslat/durdur yapabilir.
		-- SETUP ADMIN = Kurulum yöneticisi. Baþka veri tabaný kullanabilir.
		-- SYSADMIN = Serverdeki her iþi yapabilir. Tüm yetkilere sahiptir. (ADMIN)
		-- DB_ACCESSADMIN = Veri tabanýnda kullanýcýlara, veri tabanýna eriþim yetkisi atayabilen yönetici.
		-- db_Backupoperator = Veri tabanýnýn yedeðini almaya yetkilidir.
		-- DB_datareader = Kullanýcýlarýn select sorgusunu çalýþtýrmasýna izin verir. Sadece okuyabilir.
		-- db_datawriter = kullanýcýlarýn insert, delete, update sorgusunu çalýþtýrmasýna izin verir.
		-- db_ddladmin = DDL komutlarýný çalýþtýrmasýna izin verir.
		-- db_denydatareader = kullanýcýlarýn select sorgusunu çalýþtýrmasýný kýsýtlar.
		-- db_denydatawriter = kullanýcýlarýn insert, delete, update sorgusunu çalýþtýrmasýný kýsýtlar.
		-- db_owner = veritabaýnýnda en yüksek yetkili budur. siler, ekler, günceller,baþlatýp durdurabilir.
		-- db_securityadmin = kural yetkilerini yönetir. 1- herþeyi görsün 2- maaþlarý görmesin vs gibi.

		-- hazýr stor prosedurler kullanýlabilir. 
		exec sp_addrolemember @rolename'bulkadmin',@membername='sedat' 
		-- Kural atamasý yapan, kuraldan çýkaran 
		exec sp_droprolemember
		-- Kural yetki listesi sorgular
		exec sp_helpdbfixedrole

-- VERÝ TABANINA EXEL AKTARMAK

-- database_exel adýnda yeni db açtýk. exel dosyasýný çaðýracaðýz.
/* Db ye sað tuþ, task, altta import data týkla, açýlan pencereden next,flat file seç, exel sürümünü CSV ye çevir. import et.*/


-- SQL Server Agent / Lisanslý SQL lerde bulunur. MsSql job Oluþturma. sað týkla job oluþtur. internetten araþtýr.(Yedek almak olabilir)

-----------------------------------------------------------------------

-- GERÝYE DEÐER DÖNDÜREN PROSEDURLER NORTWIND
create proc sp_urunadiver_fiyatal
(
@urunadi nvarchar(50),
@fiyat money out
)
as
select @fiyat = UnitPrice from products where ProductName = @urunadi

------------------

select * from Products





		
