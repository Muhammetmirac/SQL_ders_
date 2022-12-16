--------IS NULL CONDITION--------
----Arama yapilan field’da NULL degeri almis kayitlari getirir
drop table insanlar
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar where isim is null;
select * from insanlar where isim is not null;
select * from insanlar where adres is null;
--insanlar tablosunda null degerleri 'no name' oalrak değiştirin
update insanlar
set isim='no name'
where isim is null;


