

/* DML KOMUTLARI / Select, Ýnsert, delete, update (VERÝ ÜZERÝNDE DEÐÝÞÝKLÝK YAPAR)

	1 SELECT seçme listeleme yapar,
	2 INSERT Ekleme yapar
	3 UPDATE Güncelleme Yapar
	4 DELETE Silme yapar. */

	select * from TBLOGRENCILER

	select OGRID,OGRAD,OGRSOYAD from TBLOGRENCILER

	--- SELECT ÞARTLI ÝFADE KULLANIMI (WHERE)

	select * from TBLOGRENCILER where OGRAD='Cüneyt' 

	--- Þartlý Sorgularda birden fazla bilgi almak. (Þehir izmir olsun, Kulübü yazýlým olsun gibi)
	select * from TBLOGRENCILER where OGRSEHIR = 'Ýstanbul' and OGRKULUP = 'Biliþim' -- and yerine yada veya gibi OR kullanýlabilir.

	select * from TBLNOTLAR -- ortalamayý hesaplatmak 
	select (SINAV1+SINAV2+SINAV3)/3 from TBLNOTLAR  -- ortalama aldýk

	--- DML KOMUTLARINDA, INSERT KOMUTU KULLANMAK

	--- YAZIM KURALI ÞÖYLE
	insert into table (Colum1,Column2,Colum3) values (V1,V2,V3) -- olarak girilir. Önce Kolonlar sonra VALUES ile içerikleri eklenir.

	insert into TBLOGRENCILER (OGRAD,OGRSOYAD,OGRSEHIR) values ('Ýsmail','Aydýn','Ýzmir')

	select * from TBLOGRENCILER 

	insert into TBLNOTLAR (OGRENCI,DERS,SINAV1,SINAV3) values (6,2,88,67)

	select * from TBLNOTLAR


	--- DML  DELETE KOMUTU
	-- Yazýlým Syntaxý þöyledir.

	select * from TBLDERSLER
	delete from TBLDERSLER -- Tüm dersleri siler. Sildikten sonra yeni kayýt yapýlýrsa sildiði numarayý bir daha vermez. Elle ID deðiþmez kuralý Kapatýlýp Deðiþtirilebilir.
	-- sadece 1 kolonu silmek için þart yazmamýz lazým 

	delete from TBLDERSLER where DERSAD = 'ALgorithma' -- sadece algorithmayý siler.

	-- DML UPDATE KULLANIMI
	-- Yazýlým Syntax

	update TBLOGRENCILER set OGRCINSIYET = 'ERKEK' -- set ayarla demek. Bu þekilde yapmak tüm kayýtlarý erkek olarak çevirir. WHERE Kullanmak gerekiyor.
	update TBLOGRENCILER set OGRCINSIYET = 'ERKEK' where OGRID =2 -- inciyi erkek deðiþtirecek.
	select * from TBLOGRENCILER -- DEðiþtirdi. Geri almak için ayný iþlemi yap
	update TBLOGRENCILER set OGRCINSIYET = 'Kýz' where OGRID=2
	select * from TBLOGRENCILER -- eski haline geldi

	-- bir öðrenciye kulüp atayalým
	update TBLOGRENCILER set OGRKULUP = 'Yazýlým' where OGRID = 7
	update TBLOGRENCILER set OGRCINSIYET = 'Erkek' where OGRID = 7
	select * from TBLOGRENCILER


	select * from TBLNOTLAR
	update TBLNOTLAR set DERS=2


	--------------------------------------------------

	--- TRUNCATE TABLOYU SIFIRLAR.
	truncate table TBLDERSLER -- Tamamýný sýfýrlar siler. Sýfýrladýðý zaman 1 den baþlar. Yedek almak önemli.

