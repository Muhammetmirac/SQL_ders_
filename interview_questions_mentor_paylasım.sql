--1.What is your name & surname?
--2.What is your e-mail address?
--3.What is a primary key?
--4.Based on the below tables; 

Based on the below tables;
Employee Table 
Employee ID FirstName   Last Name   City                State
10330       John        John        NY              NY
10449       Sarah       Lebat       Melbourne   Bourke
11012       Jon             Dallas      NY              NY
11013       Gheorghe    Honey       NY              NY
11014       Anton       Savar       NY              NY
create table employee
(
	employe_id int,
	first_name varchar(30),
	last_name varchar(30),
	city varchar(30),
	state varchar(30)
)
 insert into employee values (10330,'John','John','NY','NY');
 insert into employee values (10449,'Sarah','Lebat','Melburne','Bourke');
 insert into employee values (11012,'Jon','Dallas','NY','NY');
 insert into employee values (11013,'Gheorge','Honey','NY','NY');
 insert into employee values (11014,'Anton','Savar','NY','NY');

alter table employee
 rename column employe_id to employee_id;

Payments Table 
Employee ID Salary date Month ID    Value $
10330       June        6               128
10330       July        7               158
10330       August      8               133
10330       September   9               120
10330       October     10              188
10330       November    11              160
10330       December    12              105
10449       September   9               150
10449       October     10              158
10449       November    11              160
10449       December    12              180


create table payments
(
	employee_id int,
	salary_date varchar(30),
	month_id int,
	salary int
)
insert into payments values (10330,'June', 6, 128);
insert into payments values (10330,'Jully',7, 158);
insert into payments values (10330,'August',8, 133);
insert into payments values (10330,'September', 9, 120);
insert into payments values (10330,'October', 10, 188);
insert into payments values (10330,'November', 11, 160);
insert into payments values (10330,'December', 12, 105);
insert into payments values (10449,'September',9,150);
insert into payments values (10449,'October',10,158);
insert into payments values (10449,'November',11,160);
insert into payments values (10449,'December',12,180);

select*from employee;
select*from payments; 


--1.  Write the SQL queries to display the total amount earned by each employee's name and surname. 
--2.  Display all employees that have their names starting with the J letter.
--1. Her çalışanın adı ve soyadına göre kazanılan toplam tutarı görüntülemek için SQL sorgularını yazın.
select employee.first_name ||' '||employee.last_name as name_surname,sum(payments.salary) from employee inner join payments
on employee.employee_id =payments.employee_id
group by name_surname;


--2. Adları J harfi ile başlayan tüm çalışanları görüntüleyin.
select *from employee where first_name like 'J%';


