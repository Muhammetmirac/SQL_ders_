------ALIASES--------
--AS---> tabloyu çagırdıgımızda sutunun ismini geçici olarak değiştirmek için kullnaılan keyword
--Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir

drop table calisanlar;

CREATE TABLE calisanlar
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );

INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select calisan_id as ID_BİLGİLERİ from calisanlar;
select calisan_isim as ISIMLER , calisan_dogdugu_sehir as DOGDUGU_SEHİR from calisanlar;

drop table personel;
create table personel
(
	id char(9),
	isim varchar(50),
	soyisim varchar(50),
	email varchar(50),
	ise_baslama_tar date, 
	is_unvani varchar(50),
	maas int
);
insert into personel values ('123456789','Ali','Can','alican@gmail.com','10-04-2010','isci',5000);
insert into personel values ('123456788','Veli','Cem','velicem@gmail.com','10-Jan-2012','isci',5500);
insert into personel values ('123456786','Ayse','Gul','aysegul@gmail.com','01-May-2014','muhasebeci',4500);
insert into personel values ('123456786','Fatma','Yasa','fatmayasa@gmail.com','10-APR-2009','muhendis',7500);
--b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
select *from personel where maas>5000 and is_unvani='isci';
--c) Iscilerin tum bilgilerini listeleyin
select *from personel where is_unvani='isci';
--d) Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
select maas,isim from personel where soyisim  in('Can','Cem','Gul');
--e) Maasi 5000’den cok olanlarin email ve is baslama tarihlerini listeleyin
select email,ise_baslama_tar from personel where maas>5000;
--f) Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
select * from personel where maas between 5000 and 7000;
select *from personel;

