--IN CONDITION--------------
/*
N Condition birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari
(Condition) tek komutla yazabilme imkani verir
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir.
*/

--Not in Condition-----> verilen tablo elemanlarının dışında kalan elemanları listeler


drop table if exists musteriler;
create table musteriler
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar (50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Palm';

select * from musteriler where urun_isim not in('Orange','Apple','Palm')



--------BETWEEN CONDITION---------
--BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
--yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir (INCLUSIVE)

DROP TABLE IF EXISTS musteriler; 
CREATE TABLE musteriler
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');


--1) Urun_id 20 ile 40 arasinda olan urunlerin tum bilgilerini listeleyiniz

select *from musteriler where urun_id<=40 and urun_id>=20	--normal yoldan

select * from musteriler where urun_id between 20 and 40;  -- between ile

select * from musteriler where urun_id not between 20 and 40;

drop table if exists personel;

select * from personel;

CREATE table personel
(
id1 char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
select * from personel where id1 between '1003' and '1005';	

-- D ile Y arasındaki personel bilgilerini listeleyiniz
select * from personel where isim between 'D'  and 'Y';

-- D ile Y arasında olmayan personel bilgilerini listeleyiniz
select * from personel where isim not  between 'Derya Soylu' and 'Yavuz Bal';

-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
select * from personel where isim='Sena Beyaz' and maas='70000';
						
							
