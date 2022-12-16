------------DISTINCT-------------
--DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır

CREATE TABLE musteri_urun
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (10, 'Alo', 'Portakal');

INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma');
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma');
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun order by urun_id,musteri_isim ;

--Tabloda kac farkli meyve vardir
select count(distinct urun_isim)  as urun_cesit_sayisi from musteri_urun

======================================================================
----FETCH NEXT (SAYI) ROW ONLY- OFFSET------

--1) Tabloyu urun_id ye gore siralayiniz
select*from musteri_urun order by urun_id ;
--2) Sirali tablodan ilk 3 kaydi listeleyin
-- 1.yol
select * from musteri_urun order by urun_id limit 3;
-- 2. yol
select * from musteri_urun order by urun_id 
fetch next 3 row only;
--3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
-- 1.yol
select * from musteri_urun order by urun_id 
offset 3 limit 4;
-- 2. yol
select *from musteri_urun order by urun_id
offset 3
fetch next 4 row only;

