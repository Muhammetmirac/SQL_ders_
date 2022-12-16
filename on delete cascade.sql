-----ON DELETE CASCADE----
--parent table(Primary Key) olan dosyaları child table(Foreign key) silinmeden silemiyorduk
-- tabloyu oluştururken on delete cascade kod satırını yazarsak kısıtlama kalkar silebiliriz
drop table if exists talebeler;
drop table if exists notlar;

CREATE TABLE talebeler
(
id CHAR(3) primary key, -- parent table
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar(  -- child table
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id)
REFERENCES talebeler(id)
on delete cascade
);


INSERT INTO talebeler VALUES(123, 'AliCan', 'Hasan',75);
INSERT INTO talebeler VALUES(124,'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125,'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126,'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127,'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select *from talebeler;
select * from notlar;

DELETE from notlar where talebe_id='124';-- child tablede data oldugu için kolayca silindi


-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri silinir. 
--parent taki veri silinmez.


DELETE from talebeler where id='126';-- parent
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.
-- on delete cascade komutu sayesinde parentteki va baglı butun datalar silinir
-- on delete cascade olmasaydı childden silinir sonra parent silinirdi


DELETE FROM talebeler; -- Parent tablo ile birlikte child tablodaki verileride siler

DROP TABLE talebeler CASCADE; -- İlişkili tablolardan parent olan talebeler tablosunu siler


/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/
