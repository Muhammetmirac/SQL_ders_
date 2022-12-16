------JOINS -----
-- tabloları birleştirmek için kullanılır
--Union,Intersect ve minus sorgu sonucları için kullanılır
--Tablolar için ise join kullanılır

/*
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/

drop table sirketler;
drop table siparisler;

CREATE TABLE sirketler
(
sirket_id int,
sirket_isim varchar(20)
);


CREATE TABLE siparisler
(
siparis_id int,
sirket_id int,
siparis_tarihi date
);
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

INSERT INTO siparisler VALUES(11, 101, '17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

select * from sirketler;
select * from siparisler;

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id, siparisler.siparis_tarihi 
from sirketler -- bunu istersek siparisler de secebiliriz -- ancak burada ilk yazdıgımız tablo-1 olur
inner join siparisler-- iki tabloda ortak dataları getirir-- burada yazdıgımız tablo-2 olur (left-right join de onemlı)
on sirketler.sirket_id=siparisler.sirket_id;-- iki tablo arasındaki ortak bağlantı noktası 'on' üzerinden getir anlamı kazandırı





