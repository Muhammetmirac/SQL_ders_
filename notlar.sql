/*
CONSTRAINT
UNIQUE-Bir sütundaki tüm değerlerin BENZERSİZ/TEKRARSIZ yani tek olmasını sağlar.
NOT NULL-Bir Sütunun NULL içermemesini yani boş olmamasını sağlar.
NOT NULL kısıtlaması için constraint ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
PRIMARY KEY-Bir sütünün NULL içermemesini ve sütundaki verilerin
BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
FOREIGN KEY-Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
Böylelikle, tablolar arasında ilişki kurulmuş olur.
*/

/*
--///---CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA ;
 1- Child tablo silinmeden Parent tablo silinmeye çalışıldığında PgAdmin Error verir
 yani child tablo silinmeden Parent tablo silinemez
 
 2- child tablodaki veri silinmeden parent tablodaki veri silinmeye çalışıldıgında PgAdmin hata verir
 yani child tablodaki veri silinmeden Parent tablodaki veri silinemez
 
 --///---CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA
 
 1- child tablo silnmeden Parent tablo silinebilir
 PgAdmin Error vermez
 
 2- child tablodaki veri silinmeden parent tablodaki veri silinebilir
 FAKAT child tablodaki verilerde siliir
 
 
 