-----DISTINCT kullanımı------
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.
-- Tekrarsız gösterim için kullanılır

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

create table maas 
(
	id int,
	musteri_isim varchar(50),
	maas int
)
INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);
select * from maas;

--soru 1- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz

--group by ile çözüm
select urun_isim from musteri_urun group by urun_isim;

--distinct ile 
select distinct (urun_isim) from musteri_urun;

select urun_isim, count(urun_isim) from musteri_urun group by urun_isim; -- group by ile meyvenin kaç defa kullnıldıgı gelir

select urun_isim, count(distinct urun_isim) from musteri_urun group by urun_isim; -- distinct ile çeşit sayısı gelir


=====================================================================================================================


---FETCH NEXT (SAYI) ROW ONLY - OFFSET---
--1) Tabloyu urun_id ye gore siralayiniz
SELECT * FROM musteri_urun order by urun_id;
--2) Sirali tablodan ilk 3 kaydi listeleyin
select * from musteri_urun fetch next 3 row only;
--limit ile
select * from musteri_urun 
order by urun_id 
limit 3;

--3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
select * from musteri_urun order by urun_id
offset 3 row
fetch next 4 row only;

--4 en yuksek maas alan musteriyi listeleyiniz
select * from maas order by maas desc;

--5- mmas tablosundan en yuksek 2. maası listeleyiniz
select * from maas order by maas desc limit 1 offset 1;



/*
offset---->>> satır atlamak istediğimizde offset komutunu kullanırız
*/


--6- maas tablosundan en dusuk dorduncu maası listeleyiniz
select * from maas order by maas offset 3 limit 1;

==================================================================================



------ALTER TABLE STATEMET ---------
-- tabloya sutun ekleme

drop table personel
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
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda')

select * from personel;
select * from isci;

--1) ADD default deger ile tabloya bir field ekleme
alter table personel
add ulke varchar(30) ;

alter table personel add adres varchar(50) default 'Turkiye'; -- default keywordu ile oluşturdugumuz sutune belirttiğimiz deger tum satırlara girer


--2) Tabloya birden fazla field ekleme
ALTER TABLE personel
ADD cinsiyet varchar(20) , ADD yas int;


--3) DROP tablodan sutun silme
ALTER TABLE personel
DROP COLUMN cinsiyet, drop  yas;

--4) RENAME COLUMN sutun adi degistirme
ALTER TABLE isci
RENAME COLUMN sehir TO il;


--5) RENAME COLUMN sutun adi degistirme
alter table personel
rename to isci


--6) TYPE/SET (modify --mysql keyword) sutunlarin ozelliklerini degistirme

ALTER TABLE isci
ALTER COLUMN il TYPE varchar(30),
ALTER COLUMN maas SET NOT NULL;
/*
Eğer numerik data türüne sahip bir sütunun data türüne string bir data türü atamak istersek
TYPE varchar(30) USING(maas::varchar(30)) bu formatı kullanırız
*/
ALTER COLUMN maas
TYPE int USING(maas::varchar(30))

=================================================================================================-
------TRANSACTION (BEGIN-SAVEPOİN- ROLLBACK - COMMIT)


