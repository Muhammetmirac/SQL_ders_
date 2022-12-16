--*-*-*-*GROUP BY ---------
--komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT komutuyla birlikte kullanılır

drop table if exists manav;
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse','Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav;

---soru 1 - Isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz
select isim, sum(Urun_miktar)as alinan_toplam_urun from manav 
group by isim 
order by alinan_toplam_urun desc;


---soru 2- Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) from manav group by urun_adi;

--soru 3- Alinan kilo miktarina gore musteri sayisi
select urun_miktar, count(isim) from manav group by urun_miktar;

drop table personel;
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;

-- Soru 1- Isme gore toplam maaslari bulun
select isim,sum(maas) from personel group by isim;

--soru 2- sehre gore toplam personel sayisini bulun
select sehir, count(isim) from personel group by sehir;

--soru 3- Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket, count(*) as calisan_sayisi
from personel
where maas>5000
group by sirket;

--4) Her sirket icin Min ve Max maasi bulun
select sirket, max(maas),min(maas) from personel
group by sirket;



==========================================

---HAVING CLAUSE ----

--sadece group by den sonra kullanılır
-- bir nevi sart eklentisidir
--HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
----Gruplamadan once bir sart varsa 'where',gruplamadan sonra sart varsa 'having' kullaniyoruz.
/*
	Having komutu yalnizca GROUP BY komutu ile kullanilir
	Eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir
*/

drop table personel;

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk ', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk ', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, ' Veli Sahin ', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1-  Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket, min(maas) from personel
group by sirket
having  min(maas)>4000;

--2- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz
select isim, sum(maas) from personel group by isim having sum(maas)>10000;


--3- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir , count(isim) as calisan_sayisi from personel group by sehir having count(isim)>1;

--4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir , max(maas) from personel group by sehir having max(maas)<5000;