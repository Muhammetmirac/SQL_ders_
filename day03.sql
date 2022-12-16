CREATE TABLE ogrenciler5
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ismi mustafa bak ve nesibe yildiz olanları silelim
delete from ogrenciler5 where isim='Mustafa Bak' or isim='Nesibe Yilmaz';

--veli_ismi hasan olanları silelim
delete from ogrenciler5 where veli_isim='Hasan';

--TRUNCATE
--BİR TABLODAKİ TÜM VERİLERİ GERİ ALAMAYACAGIMIZ ŞEKİLDE SİLER . ŞARTLI SİLME YAPMAZ
TRUNCATE TABLE ogrenciler5

--ON DELETE CASCADE
DROP TABLE if exists adresler -- eğer tablo varsa tabloyu siler


CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
	)
	

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar;



--notlar tablsundan id si 123 olan datayı silelim

delete from notlar where talebe_id='123';


-- talebeler tablusundan id si 126 olan datayı silelim

delete from talebeler where id= '126';




CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT not1_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
	)
	
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe;
select * from not1;

--talebeler tablosundan id si 126 olan datayı silelim
delete from talebe where id='126';

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/



--IN CONDITION -- birden fazla mantıksal operatorleri tanımlayıp kullanmamızı sağlar

DROP TABLE 

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
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;


-- müşetriler tablosundan urun ismi orange, apple veya apricot olan tüm dataları listeleyiniz

select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';

--in condition ile

select * from musteriler where urun_isim in ('Orange','Apple','Apricot');

--not in ---->>> yazdıgımız dataların dısındakileri getirir
select * from musteriler where urun_isim not in ('Orange','Apple','Apricot');




--BETWEEN CONDITION -- istenilen aralıktaki dataları listelemek için kullanılır-- yazdıgımız aralıklar dahildir


--müsteriler tablosundan id 20 ile 40 arasında olan tüm verileri listeleyiniz
select * from musteriler where urun_id>=20 and urun_id<=40;

select * from musteriler where urun_id between 20 and 40;

--not between -- girilen degerler hariç aradaki datları getirir
select * from musteriler where urun_id not between 20 and 40;


--SUBQUERY -- BAŞKA QUERY EKRANINDAN SORGU YAPMAK İÇİN
CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
insert into calisanlar2 values(465852140, 'Taha Bey', 'adana',5000,'Nike');

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
insert into markalar values(104,'Nike',19000);


select * from calisanlar2;
select * from markalar;


-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve
--maaşlarini listeleyin.

select isim, maas, isyeri from calisanlar2 
where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);


-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
select isim, maas, sehir from calisanlar2 
where isyeri in (select marka_isim from markalar where marka_id>101);


-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
select marka_id, calisan_sayisi from markalar
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');



--AGGREGATE METHOD
-- çalısanlar tablosundan maximum maası listeleyelim
	SELECT max(maas) from calisanlar2; -- maximum maas miktarını getirir
	select max (maas) as maksimum_maas  from calisanlar2;
	/*
	  Eğer bir sutuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
vermek istediğimiz ismi yazarız
	*/
	
	-- çalısanlar tablusundan minimum maası listeleyelim
	select min (maas) from calisanlar2;
		select min (maas) as en_dusuk_maas from calisanlar2;
	
	-- çalısanlar tablosundaki maaşlar toplamını listeleyin
	select sum (maas) from calisanlar2;
	
	
	--maaşların ortalamasını listeleyin
	select avg(maas) as ortalama_maas from calisanlar2
	select round(avg(maas)) as ortalama_maas from calisanlar2--round methodu ile çıkan sayı küsüratları yuvarlar
	select round(avg(maas),2) as ortalama_maas from calisanlar2--round(avg(maas),2) şeklinde olursa da virgulden sonra kaçbasamak yazılacagı seçilir
	
	
	-- çalışanlar tablosundaki maaas ların sayısını listele
	 select count(maas) from calisanlar2;
	 
	/*
	count(*);eger maas da null varsa saydırır hepsini
count(maas); eger maas da null varsa null'ı almadan saydırır hepsini

	*/
/*	
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir. Null deger varsa saydırmaz
	*/
	
select * from calisanlar2;

	
	
	
--SUBQUERIES	--
--tablonun kendi olmayadan datalar farklı tablolarla ilişkişli datalar üzerinden kullanmaya yarar
	
	
select * from calisanlar2;
select * from markalar;

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
select marka_id, marka_isim,
(select count(sehir) as Sehir_sayisi from calisanlar2 
where marka_isim = isyeri)from markalar;
							 
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz	
select marka_isim,calisan_sayisi, 
(select sum(maas) from calisanlar2 where isyeri =marka_isim) as toplam_maas
from markalar;	
	
	
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen
--bir Sorgu yaziniz	

select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim) as maximum_maas,
(select min(maas) from calisanlar2 where marka_isim=isyeri) as minimum_maas
from markalar
	
--VIEW KULLANIMI -- yaptıgımız subquers kodlarımızı method gibi kullanabilmek için oluşturulan yapı
create view maxMinMaas
as
select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim) as maximum_maas,
(select min(maas) from calisanlar2 where marka_isim=isyeri) as minimum_maas
from markalar;

select * from maxMinMAas; -- method cagırıyor gibi bu şekilde cagırıyoruz
/*
Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine
view'e atadigimiz ismi SELECT komutuyla cagiririz
*/

--EXISTS CONDITION (varsa Şartı) -- exists varsa anlamındadır

CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);


CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);


INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota')
;	
	
	SELECT * FROM mart;
	select * from nisan;


----MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

select urun_id, musteri_isim from mart
where exists --
(select urun_id from nisan where mart.urun_id=nisan.urun_id);


--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim, musteri_isim from nisan
where exists 
(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);


select * from  urunler;
--sonraki konu update nasıl yapılır