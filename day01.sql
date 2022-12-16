--DATABASE(VeriTabanı) Oluşturma
--create dataBase mirac;

--DDL (data definition language)
--create--> tablo oluşturma

create table ogrenciler
(
	ogrenci_no char(7),	--uzunlugunu bildiğimiz data oldugu için data tipini char seçtik
	Isim varchar(20),
	soyisim varchar(25),
	not_ort real,		--ondalıklı sayıların data tipidir. double gibi
	kayit_tarihi date 
);

--varolan tablodan yeni bir tablo oluşturma
create table ogrenci_ortalamalar
as--ing.de gibi anlamındadır 	-- benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak 
--için normal tablo oluştururken ki parantezler yerine 'as' kullanıp select komutuyla 
--almak istediğimiz verileri alırız
select Isim, soyisim,not_ort from ogrenciler;
select * from ogrenci_ortalamalar


--DML data manipulation language
--insert--->(database' e veri ekleme)

insert into ogrenciler values('1234567', 'ali', 'can',77.5,now());-- verileri ogrenci tablomuza ekliyoruz---now() bugunu tarihini vermesi için
insert into ogrenciler values('2345678', 'veli', 'bak',88.5,'2022-11-1');


--bir tabloya parçalı veri eklemek istersek
insert into ogrenciler (Isim,soyisim) values ('Mirac','Ustundag');


--DQL--> data query language--> veri sorgulama dili
--select--> bu key ile seçim işlemlerini yapıyoruz

select * from ogrenciler;-- ogrenciler tablosundan herseyi("*" anlamını ) seç anlamındadır

select * from ogrenci_ortalamalar;
 insert into ogrenci_ortalamalar values ('yusuf taha','ustundag',100);
 insert into ogrenci_ortalamalar (isim,not_ort) values ('Nazlı',99.9);





