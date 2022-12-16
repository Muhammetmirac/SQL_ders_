--- 		JOINS		---
/*
		2 Tablodaki datalari Birlestirmek icin kullanilir.
		Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir
		Tablolar icin ise JOIN kullanilir
		5 Cesit Join vardir
			1) INNER JOIN iki Tablodaki ortak datalari gosterir
			2) LEFT JOIN Ilk datada olan tum recordlari gosterir
			3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
			4) FULL JOIN Iki tablodaki tum recordlari gosterir
			5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile ol
*/

CREATE TABLE siparisler  (
	siparis_id int,  
	sirket_id int,  
	siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, '2020-04-21');

CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');

select * from sirketler;
select * from siparisler;

--- 1- INNER JOIN ----
--SORU - Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve 
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
from sirketler 
inner join siparisler
on sirketler.sirket_id =siparisler.sirket_id;

--- 2-  LEFT JOIN----

--SORU - Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve 
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi from sirketler 
left join siparisler
on sirketler.sirket_id =siparisler.sirket_id;


--- 3- RIGHT JOIN ---

--SORU - Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve 
--siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi from sirketler 
right join siparisler
on sirketler.sirket_id =siparisler.sirket_id;


---4- FULL JOIN ---

--SORU - Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve 
--siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi from sirketler 
full join siparisler
on sirketler.sirket_id =siparisler.sirket_id;

---5 - SELF JOIN ----
--Hayali tablo oluşturarak istenilen field leri tabloda gösterebilirz

drop table personel
CREATE TABLE personel 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel;

-- Her personelin yanına yonetici ismini yazdıran bir tablo olusturun


select p1.isim as Personel_isim, p2.isim as Yonetici_isim from personel p1 inner join personel p2
on p1.yonetici_id = p2.id -- p1 tablsundaki yonetici id ye eşit olan p2 tablosundaki id üzerineden(ON bu anlamı kazandırıyor)




