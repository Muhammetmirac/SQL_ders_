---ORDER BY CONDITION-----
/*
ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir
****NOT  : ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/

/*
NOT 
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe ya da küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
--(NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir)


  drop table if exists insanlar
  
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar order by adres;
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

--insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select *from insanlar where soyisim='Bulut' order by 2 ;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar order by ssn desc;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar  order by isim, soyisim desc;
--Isim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select * from insanlar order by length(soyisim);
--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim || ' ' || soyisim as adsoyad  from insanlar  order by LENGTH(isim)+LENGTH(soyisim);

===========================================================================================================



