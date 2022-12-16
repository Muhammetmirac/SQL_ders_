-----------TRUNCATE--------------
-- Bir tablodaki verileri geri alınamayacak şekilde tamamen siler
--şartlı silme yapmaz.
-- truncate table ogrenciler6; şeklinde kod satırına yazılır

drop table if exists ogrenciler6;-- varsa ogrenciler6 tablosunu sil
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

select *from ogrenciler6;
truncate table ogrenciler6;