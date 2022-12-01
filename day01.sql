--DATABASE(VeriTabanı) Oluşturma
--create dataBase mirac;

--DDL (data definition language)
--create--> tablo oluşturma

create table ogrenciler1
(
	ogrenci_no char(7),	--uzunlugunu bildiğimiz data oldugu için data tipini char seçtik
	Isim varchar(20),
	soyisim varchar(25),
	not_ort real,		--ondalıklı sayıların data tipidir. double gibi
	kayit_tarihi date 
);
--varolan tablodan yeni bir tablo oluşturma
create table ogrenci_ortalamalar
as 	-- benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak 
--içinnormal tablo oluştururken ki parantezler yerie 'as' kullanıp select komutuyla 
--almak istediğimiz verileri alırız
select Isim, soyisim,not_ort from ogrenciler;


--DML data manipulation language
--insert--->(database' e veri ekleme)

insert into ogrenciler values('1234567', 'ali', 'can',77.5,now());--verilen verileri ekleme
insert into ogrenciler values('2345678', 'veli', 'bak',88.5,'2022-11-1');


--bir tbaloya parçalı veri eklemek istersek
insert into ogrenciler (Isim,soyisim) values ('Mirac','Ustundag');


--DQL--> data query language
--select

select * from ogrenciler;







