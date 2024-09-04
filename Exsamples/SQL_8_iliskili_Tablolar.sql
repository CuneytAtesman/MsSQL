

/*  

	ÝLÝÞKÝLÝ TABLOLAR 3 TEMEL ÝLÝÞKÝ VAR 
    1- Veri Karmaþasýný önler. 
	2- Veri tekrarýný önler.
	3- Bellek Performansý Saðlar

	- Bire Bir iliþki
	- Bire Çok Ýliþki - En çok kullanýlan iliþki türü
	- Çoka Çok iliþki

	ID eþleþtirme yapýlýr.

*/

select * from TBLKULUBLER
select * from TBLOGRENCILER
update TBLOGRENCILER set OGRKULUP=6 where OGRKULUP='Yazýlým'


insert into TBLOGRENCILER (OGRAD,OGRSOYAD,OGRKULUP,OGRSEHIR) values ('Sevdiþ', 'Denizci',4, 'Ankara')