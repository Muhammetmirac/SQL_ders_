------  INTERSECT (in) OPERATOR ------(Kesişim)

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
INSERT INTO personel VALUES(456789013, ' Veli Sahin ', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
drop table personel cascade

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

select * from personel;
select * from personel_bilgi;

--soru 1- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--soru 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--soru 3) Iki sorguyu INTERSECT ile birlestirin
select id from personel where sehir in ('Istanbul','Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in (2,3);

--1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
select id from personel where maas not between 4800 and 5000 
--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in(2,3);
--3) Iki sorguyu INTERSECT ile birlestirin
select id from personel where maas not between 4800 and 5000 
intersect
select id from personel_bilgi where cocuk_sayisi in(2,3);


--soru 3) Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel where sirket='Honda'
intersect
select isim from personel where sirket='Ford'
intersect
select isim from personel where sirket='Tofas'










