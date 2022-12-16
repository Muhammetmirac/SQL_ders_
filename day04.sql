--------ALIASES--------------
--Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir


drop table if exists calisanlar;

CREATE TABLE calisanlar
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) 
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar;

SELECT calisan_id AS id, calisan_isim AS isim, calisan_dogdugu_sehir AS dogum_yeri FROM calisanlar;

--1.yol
SELECT calisan_id AS id, calisan_isim || ' '|| calisan_dogdugu_sehir AS isim_ve_dogum_yeri FROM calisanlar;

--java yaptıgımız concat işlemi gibi birleştirip yazdırabilirz

2.yol
select calisan_id as id, concat(calisan_isim,' ',calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar;





----IS NULL CONDITION-------

--Arama yapilan field’da NULL degeri almis kayitlari getirir.

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');


--name sütununda null olan değerleri listeleyelim

SELECT name FROM insanlar WHERE name IS NULL;
--insanlar tablosunda sadece null olmayan degerleri listele
select name from insanlar where name is not null;
---- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar 
SET name = 'Isim Girilmemis'
WHERE name IS NULL;

SELECT *FROM insanlar;



---ORDER BY CONDITION-----
/*
ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir
ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
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

select * from insanlar order by soyisim;--"ascn" komut satırının sonun default olarak "ascn" komutu vardır . yazarsak da yazmasak da problem olmaz
select * from insanlar order by adres;
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar where isim='Mine' order by ssn


--insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
--(NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir)
select*from insanlar where soyisim='Bulut'order by 2;


/*
NOT 
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe ya da küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/


--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar order by ssn desc;

--ORDER BY field_name DESC CLAUSE--
--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin 
select * from insanlar order by isim asc, soyisim desc;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim, soyisim from insanlar order by length(soyisim) desc;

/*
Eğer sütun uzunluguna gore sıralamak istersek LENGTH komutu kullanırız 
ve yine uzunlugu tersten sıralamak istersek sonuna DESC komutunu ekleriz
*/


--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim ||' '||soyisim  as isim_soyisim from insanlar order by length (isim||soyisim);


-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH(isim||soyisim)
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))



-------GROUP BY CLAUSE---------------------
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır


CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);


select * from manav;
--1) Isme gore alinan toplam urunleri bulun
select sum(urun_miktar) from manav;


SELECT isim, SUM(urun_miktar) AS Alinan_Toplam_Meyve 
FROM manav
GROUP BY isim 
order by Alinan_Toplam_Meyve desc;

--Urun ismine gore urunu alan toplam kisi sayisi
select Urun_adi, count(isim) as urunuAlanKisiSayisi from manav group by urun_adi;