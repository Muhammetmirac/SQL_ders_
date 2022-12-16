-------------ALTER TABLE STATEMENT----------------
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