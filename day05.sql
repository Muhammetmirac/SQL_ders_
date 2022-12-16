---------GROUP BY    -------------------------
drop table personel;
CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

 
--isme göre toplam maasları listeleyin
select isim, sum(maas) from personel
group by isim;

--personel tablosundaki isimleri gruplayınız
select isim from personel
group by isim;
--sehre göre toplam personel sayısını bulun
select sehir, count(isim) from personel
group by sehir ;

--Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket, 



------HAVING CLAUSE---------

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


--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket,min(maas) as en_dusuk_maas from personel 
group by sirket -- şirkete göre grupla
having min(maas)>4000;

--2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz

select isim, sum(maas) from personel 
group by isim
having sum(maas)>10000;

--3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

select sehir, count(isim) as personel_sayisi from personel
group by sehir
having count(isim)>1;

--4 Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir, max(maas) from personel group by sehir having max(maas)<5000;


--------------- UNION ---------------------------
--İki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir.


--1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim as isim_ve_sehirler,maas from personel where maas>4000
union
select sehir, maas from personel where maas>5000;


--2)  Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz 
select isim,maas  from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul';

--------union operator 2 data birleştirme----------
drop table personel;

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk ', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk ', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789013, ' Veli Sahin ', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);



--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, 
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin
select sehir, maas from personel where id=123456789
union
select tel, cocuk_sayisi from personel_bilgi where id=123456789



-------UNION ALL-----------------------

--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz

SELECT isim, maas from personel where maas<5000;
UNION all    										-- all ile yapılan sorgularda çift dataları ayrı ayrı yazdırır
													-- ancak sadece union ile yapılan sorgularda aynı isme sahip datalar birleştirilir
SELECT sehir,maas FROM personel WHERE maas<5000;



-----INTERSECT OPERATOR------------(Kesişim)

--SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır. 
--Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür. 
--Bir sorguda bir kayıt varsa ve diğerinde yoksa, INTERSECT sonuçlarından çıkarılacaktır.

--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

SELECT id
FROM personel
WHERE sehir IN ('Istanbul','Ankara')
intersect
SELECT id
FROM personel_bilgi
WHERE cocuk_sayisi IN (2,3);


--soru :Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel where sirket ='Honda'
intersect

select isim from personel where sirket ='Ford'
intersect

select isim from personel where sirket ='Tofas';


select*from personel


-- EXCEPT(MINUS) KULLANIMI
/*
İki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanılır
*/

-- 5000’den az maas alip Honda’da calismayanlari yazdirin
SELECT isim,sirket from personel where maas<5000
except
select isim,sirket from personel where sirket='Honda'
