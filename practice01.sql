create table ogrenciler02(
id char (4) UNIQUE,
isim varchar (50),
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);
select * from ogrenciler02

create table ogrenciler03(
id char (4) UNIQUE,
isim varchar (50) NOT NULL ,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);
select * from ogrenciler03

insert into ogrenciler03 (id,isim,not_ortalamasi,adres) values ('1234','taha',85.5,'adana,seyhan')


--PRIMARY KEY
--unique
--not null 
--bir tabloda en fazla bir tane olur


--1. yol da tablo ilk oluşturulurken primary key oluşturulur
create table personel (
id char(10) PRIMARY KEY,
isim varchar (50),
soyisim varchar (50),
email varchar(30),
ise_baslama_tarih date,
maas int
)
--ya da satırların en sonuna "CONSTRAINT ogrenciler_pk PRIMARY KEY(id)" kod satırı ile eklenir



--Foreign Key 
--null olabilir
--baska bir tablunun(parent) primary keyine baglıdır
--foreign keyin oldugu tablo child tablodur
--bir tabloda birden fazla foreign key olabilir

select * from tedarikciler2

CREATE TABLE tedarikciler2
(
tedarikci_id char(10),
tedarikci_ismi varchar(50),
iletisim_isim varchar(50),
CONSTRAINT tedarikci_pk PRIMARY KEY (tedarikci_id)
);
create table urunler(
tedarikci_id char(10),
product_id char (10),
constraint urunler_fk foreign key (tedarikci_id) references tedarikciler2(tedarikci_id)
);
select * from tedarikciler2


create table calisanlar
(
	id char(5),
	isim varchar(50) UNIQUE,
	maas real NOT NULL,
	ise_baslama date,
	PRIMARY KEY (id)
)
 create table adresler
 (
 adres_id char(7),
sokak varchar (30),
cadde varchar (30),
sehir varchar (30),
foreign key (adres_id) references calisanlar(id)
 );

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');-- isim unique oldugu için ikinci bir mehmet yılmaz kaydedemeyiz
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- maas not null oldugu için maaş ataması yapılması mecburidir
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- ikinci can ismi oldugu için kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- tırnak içerisindeki boşluk yüzünden kabul etmez. not null oldugu için
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');-- id boş olsada kabul eder
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');-- ikinci bir boş id kabul etmez. bir üst satırda boş id eklediğimiz için uniquedir
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');-- id unique ayarladık . ikinci bir aynı id oldugu için kabul etmez
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- id primary key oldugu için unique ve not null dur


INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep'); -- parent tablo yani ana tabloda id olmadıgı için child tabloya ekleme yapamayız

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;
select adresler(sokak)  

create table calisanlar3
(
	id char(5),
	isim varchar(50) ,
	maas real check(maas>15000) ,
	ise_baslama date
	
)

INSERT INTO calisanlar3 VALUES('10002', 'Mehmet Yılmaz' ,16000, '2018-04-14');
INSERT INTO calisanlar3 VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar3 VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
select * from calisanlar3;


--where kullanımı--------------
select * from calisanlar;

--çalışanlar tablosundan maaşı 5000 den buyuk olan ları listeleyiniz
select isim from calisanlar where maas>5000; 
--calisanlar tablosundan ismi veli han olan tüm dataları listele
select * from calisanlar where isim='Veli Han';
--

drop table if exists  ogrenciler;
create table ogrenciler
(
isim varchar(50),
adres varchar(50),
not_ort int

)

insert into ogrenciler values('taha','adana',100);
insert into ogrenciler values ('mirac','kayseri',55);
insert into ogrenciler values ('nazlı','elazıg',80);
 --not ortalaması 80 ve üzeri isimler listele
 select isim,adres,not_ort from ogrenciler where not_ort>79;
 --tablonun içeriğini tamamen sil
 delete from ogrenciler;
select * from ogrenciler;
delete  from ogrenciler where isim='nazlı';



delete from calisanlar;
delete from adresler;
select * from adresler;
select * from calisanlar;

CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler6;
 delete from ogrenciler6 where id=124;
 delete from ogrenciler6 where isim='Kemal Yasa';
 delete from ogrenciler6 where isim='Nesibe Yilmaz'or isim='Mustafa Bak';
 delete from ogrenciler6 where isim ='Ali Can' or id=123;
 delete from ogrenciler6 where id>126;
 truncate table ogrenciler6;