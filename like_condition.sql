------LIKE Condition --------
/*
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar 
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir. 
LIKE = ~~ 
ILIKE = ~~* 
NOT LIKE = !~~ 
NOT ILIKE = !~~* 
NOT REGEXP_LIKE = !~* 
NOT REGEXP_LIKE = !~
*/

drop table musteriler

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'erhan', 92000);

--LİKE operatorleri

--1) % => 0 veya birden fazla karakter belirtir

-- ismi A ile başlayan musterilerin tum bilgilerini yazdıran query yazın

select * from musteriler where isim ILIKE 'A%'
select * from musteriler where isim ~~ 'A%' -- (altgr+ü) ile çıkan sembol iki adet yan yana yazılınca LİKE yazmak yerine sembol olarak kullanır

--SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim, gelir from musteriler
where isim like '%e';

--SORU : Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler where isim like '%er%';


--2)_ => sadece bir karakteri gosterir.

--SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select *from musteriler where  isim like '_atma';

--SORU : Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select *from musteriler where isim like '_a%';

--SORU : Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select *from musteriler where isim ilike '__S%';
--SORU : Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '__s_';
--SORU : Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like 'F___%';
--SORU : Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_a_m%';
========================================================================================

--- 3- REGEXP_LIKE --
/*
REGEXP_LIKE =>
	Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

CREATE TABLE kelimeler
(
id int UNIQUE,
kelime varchar(50) NOT NULL,
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ 'h[ai]t';

--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '[mi]';
--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~'h[a-k]t'
--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '[m,i]'
--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~'^[as]'
--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~'[mf]$'


-----NOT LIKE--------
--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~~ 'h%';
--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~~ '%a%';
--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~~ '_de%'
--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~~'_[ei]%';
======================================================


----- UPPER – LOWER - INITCAP------

-- Kelimeler tablosundaki kelime sutunundaki verileri önce hepsi büyük harf, sonra küçük harf ve ilk harfleri 
-- büyük harf olucak şekilde yazdıralım
SELECT UPPER(kelime) as büyükkelime FROM kelimeler
SELECT LOWER(kelime) as kelime FROM kelimeler
SELECT INITCAP(kelime) as kelime FROM kelimeler -- INITCAP istediğimiz sutundaki verilerin ilk harfini büyük yazar
-- Musteriler tablosundan bütün isimleri büyük harf yapınız
SELECT UPPER(isim) FROM musteriler
/*
Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek
select lower(title),UPPER(isim) from personel şekilde yapabiliriz
*/
select lower(title),UPPER(isim) from personel