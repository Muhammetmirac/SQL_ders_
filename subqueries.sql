--------- SUBQUERIES-----------
--alt sorgu ya da iç içe sorgu olarak kullanılır
--SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur.
--1) WHERE’ den sonra kullanilabilir


CREATE TABLE calisanlar5
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
CREATE TABLE markalar1
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar1 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar1 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar1 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar1 VALUES(103, 'LCWaikiki', 21000);

INSERT INTO calisanlar5 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar5 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar5 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar5 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar5 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar5 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar5 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar5 VALUES(208361019, 'Yusuf Taha', 'Adana', 5000, 'Vakko');
INSERT INTO calisanlar5 VALUES(208361019, 'Yusuf Taha', 'Adana', null, 'Vakko');


select * from calisanlar5;
select * from markalar1;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve
--maaşlarini listeleyin.

select isim, maas, sehir from calisanlar5 
where isyeri in (select marka_isim from markalar1 where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT * from calisanlar5
where isyeri in (select marka_isim from markalar1 where marka_id > 101 );
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

select marka_id,marka_isim, calisan_sayisi from markalar1 
where marka_isim in 
(select isyeri from calisanlar5 where sehir='Ankara');


----------SUBQUERIES-----------
---AGGREGATE METOT KULLANIMI---

/*--Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı 
*/
--"as" keywordu "olarak" anlamı kazandırır. tablo cagrılırken istediğimiz isim ile gelir ama kalıcı kaydetmez

select max(maas) as en_yuksek_maas_kiyak_is from calisanlar5 --en yuksek maas "olarak" getir anlamı 

-- çalısanlar tablosundan maximum maası listeleyelim
	SELECT max(maas) from calisanlar5; -- maximum maas miktarını getirir
	select max (maas) as maksimum_maas  from calisanlar2;
	/*
	  Eğer bir sutuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
vermek istediğimiz ismi yazarız
*/
--maaşların ortalamasını listeleyin
	select avg(maas) as ortalama_maas from calisanlar5;
	select round(avg(maas)) as ortalama_maas from calisanlar5;--round methodu ile çıkan sayı küsüratları yuvarlar
	select round(avg(maas),2) as ortalama_maas from calisanlar5;--round(avg(maas),2) şeklinde olursa da virgulden sonra kaçbasamak yazılacagı seçilir
	
select count(maas) from calisanlar5;
select count(*) from calisanlar5;

/*
	count(*);eger maas da null varsa saydırır hepsini
count(maas); eger maas da null varsa null'ı almadan saydırır hepsini
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir. Null deger varsa saydırmaz
	*/



----------SUBQUERIES-----------alt sorgu
--tablonun kendinde olmayan dataları farklı tablolarla ilişkişli datalar üzerinden kullanmaya yarar

select * from calisanlar5;
select * from markalar1;

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, 
(select count(sehir) from calisanlar5 where marka_isim=isyeri )
from markalar1;


--- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi,
(select sum(maas) from calisanlar2 where isyeri=marka_isim)	as ToplamMAAS
from markalar1;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen
--bir Sorgu yaziniz.

select marka_isim, calisan_sayisi ,
(select max(maas) from calisanlar5 where isyeri=marka_isim ),
(select min(maas) from calisanlar5 where isyeri=marka_isim )
from markalar1;

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
select * from calisanlar5;
select * from markalar1;

select marka_id, calisan_sayisi from markalar1
where marka_isim in (select isyeri from calisanlar5 where sehir='Ankara')
;
-------VIEW KULLANIMI-----------
-- method gibi sorgularımızı kaydetip daha sonra çağırmamızı sağlar
/*
Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine
view'e atadigimiz ismi SELECT komutuyla cagiririz
*/

create view minMaxMaas
select marka_isim, calisan_sayisi ,
(select max(maas) from calisanlar5 where isyeri=marka_isim ),
(select min(maas) from calisanlar5 where isyeri=marka_isim )
from markalar1;
