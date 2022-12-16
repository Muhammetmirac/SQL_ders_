---EXİSTS CONDITION--------VARSA ANLAMINDADIR

/*EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.
*/
CREATE TABLE mayis
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO mayis VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis VALUES (20, 'John', 'Toyota');
INSERT INTO mayis VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis VALUES (10, 'Adam', 'Honda');
INSERT INTO mayis VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE haziran
(
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO haziran VALUES (10, 'Hasan', 'Honda');
INSERT INTO haziran VALUES (10, 'Kemal', 'Honda');
INSERT INTO haziran VALUES (20, 'Ayse', 'Toyota');
INSERT INTO haziran VALUES (50, 'Yasar', 'Volvo');
INSERT INTO haziran VALUES (20, 'Mine', 'Toyota');

select * from mayis;
select * from haziran;


--soru 1
--mayis VE haziran aylarında aynı URUN_ID ile satılan ürünlerin URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri mayis ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

select urun_id, musteri_isim from mayis
where 
exists 
(select urun_id from haziran where mayis.urun_id= haziran.urun_id);

--soru 2
----Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri 
--haziran ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim, musteri_isim from haziran
where exists 
(select musteri_isim from mayis where mayis.urun_isim=haziran.urun_isim);


--soru 3
----Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--haziran ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim, musteri_isim from haziran
where not exists
(select urun_isim from mayis where mayis.urun_isim=haziran.urun_isim);