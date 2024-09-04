

/* DML KOMUTLARI / Select, �nsert, delete, update (VER� �ZER�NDE DE����KL�K YAPAR)

	1 SELECT se�me listeleme yapar,
	2 INSERT Ekleme yapar
	3 UPDATE G�ncelleme Yapar
	4 DELETE Silme yapar. */

	select * from TBLOGRENCILER

	select OGRID,OGRAD,OGRSOYAD from TBLOGRENCILER

	--- SELECT �ARTLI �FADE KULLANIMI (WHERE)

	select * from TBLOGRENCILER where OGRAD='C�neyt' 

	--- �artl� Sorgularda birden fazla bilgi almak. (�ehir izmir olsun, Kul�b� yaz�l�m olsun gibi)
	select * from TBLOGRENCILER where OGRSEHIR = '�stanbul' and OGRKULUP = 'Bili�im' -- and yerine yada veya gibi OR kullan�labilir.

	select * from TBLNOTLAR -- ortalamay� hesaplatmak 
	select (SINAV1+SINAV2+SINAV3)/3 from TBLNOTLAR  -- ortalama ald�k

	--- DML KOMUTLARINDA, INSERT KOMUTU KULLANMAK

	--- YAZIM KURALI ��YLE
	insert into table (Colum1,Column2,Colum3) values (V1,V2,V3) -- olarak girilir. �nce Kolonlar sonra VALUES ile i�erikleri eklenir.

	insert into TBLOGRENCILER (OGRAD,OGRSOYAD,OGRSEHIR) values ('�smail','Ayd�n','�zmir')

	select * from TBLOGRENCILER 

	insert into TBLNOTLAR (OGRENCI,DERS,SINAV1,SINAV3) values (6,2,88,67)

	select * from TBLNOTLAR


	--- DML  DELETE KOMUTU
	-- Yaz�l�m Syntax� ��yledir.

	select * from TBLDERSLER
	delete from TBLDERSLER -- T�m dersleri siler. Sildikten sonra yeni kay�t yap�l�rsa sildi�i numaray� bir daha vermez. Elle ID de�i�mez kural� Kapat�l�p De�i�tirilebilir.
	-- sadece 1 kolonu silmek i�in �art yazmam�z laz�m 

	delete from TBLDERSLER where DERSAD = 'ALgorithma' -- sadece algorithmay� siler.

	-- DML UPDATE KULLANIMI
	-- Yaz�l�m Syntax

	update TBLOGRENCILER set OGRCINSIYET = 'ERKEK' -- set ayarla demek. Bu �ekilde yapmak t�m kay�tlar� erkek olarak �evirir. WHERE Kullanmak gerekiyor.
	update TBLOGRENCILER set OGRCINSIYET = 'ERKEK' where OGRID =2 -- inciyi erkek de�i�tirecek.
	select * from TBLOGRENCILER -- DE�i�tirdi. Geri almak i�in ayn� i�lemi yap
	update TBLOGRENCILER set OGRCINSIYET = 'K�z' where OGRID=2
	select * from TBLOGRENCILER -- eski haline geldi

	-- bir ��renciye kul�p atayal�m
	update TBLOGRENCILER set OGRKULUP = 'Yaz�l�m' where OGRID = 7
	update TBLOGRENCILER set OGRCINSIYET = 'Erkek' where OGRID = 7
	select * from TBLOGRENCILER


	select * from TBLNOTLAR
	update TBLNOTLAR set DERS=2


	--------------------------------------------------

	--- TRUNCATE TABLOYU SIFIRLAR.
	truncate table TBLDERSLER -- Tamam�n� s�f�rlar siler. S�f�rlad��� zaman 1 den ba�lar. Yedek almak �nemli.

