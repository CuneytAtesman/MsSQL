

/*  

	�L��K�L� TABLOLAR 3 TEMEL �L��K� VAR 
    1- Veri Karma�as�n� �nler. 
	2- Veri tekrar�n� �nler.
	3- Bellek Performans� Sa�lar

	- Bire Bir ili�ki
	- Bire �ok �li�ki - En �ok kullan�lan ili�ki t�r�
	- �oka �ok ili�ki

	ID e�le�tirme yap�l�r.

*/

select * from TBLKULUBLER
select * from TBLOGRENCILER
update TBLOGRENCILER set OGRKULUP=6 where OGRKULUP='Yaz�l�m'


insert into TBLOGRENCILER (OGRAD,OGRSOYAD,OGRKULUP,OGRSEHIR) values ('Sevdi�', 'Denizci',4, 'Ankara')