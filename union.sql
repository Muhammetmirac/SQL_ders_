-------UNION   ---------
--İki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir.

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
 
 select * from personel;
 
--1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim,maas from personel where maas>4000
union
select sehir,maas from personel where maas>5000;

--2)  Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz 
 select isim, maas from personel where isim='Mehmet Ozturk'
 union
 select sehir, maas from personel where sehir='Istanbul'
 order by maas;
 
 --3) Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az olanlari 
 -- bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
 select sehir, maas from personel where maas>3000
 union
 select isim, maas from personel where maas <5000
 order by maas;
 
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

drop table personel_bilgi;

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

--soru :  id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, 
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin

select sehir, maas from personel where id=123456789
union 
select tel, cocuk_sayisi from personel_bilgi where id=123456789;





