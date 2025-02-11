show databases;
use mysql;  -- connect to the specific DB
show tables;

create database blog;
use blog;
drop database blog;
create database qa2046;
use qa2046;

CREATE TABLE `people` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `city` varchar(20),
  `email` varchar(30),
  `age` int,
  `bio` varchar(64),
  PRIMARY KEY (`id`));
select * from people;
-- alter table people add email varchar(20);
-- alter table people drop column emil;

INSERT INTO `people` (first_name, last_name, city, email, age, bio) VALUES ('John','Smith','New York','john@gmail.com',35,'working as programmer at Microsoft'),
('Jack','Bauer','LA','jack@gmail.com',45,'working as special agent in FBI'),
('Albert','Einstein','Zurich','albert@cisco.com',57,'working as scintifist in univercity of Berkley'),
('Mary','Cury','Paris','mary@gmail.fr',38,'working as pscintifist in univercity of Jeneva'),
('Mary','Loo','Paris','maril@gamil.fr',28,'working as scintificist in univercity of Sorbone');

delete from people
where id >=6;

select 5*10+34 as "calculation";
show tables;


select age, city as place, first_name
from people
order by first_name, age desc; 

select count(first_name) as number
from people
where age>30;

select last_name
from people
where length(last_name) >=5;

select last_name
from people
where length(last_name) >=4 and length(last_name)<=5;

select last_name
from people
where length(last_name) between 4 and 5;

select last_name, first_name, 10 as points
from people
order by 1;


select concat(last_name," ", first_name) as Name
from people;

select concat('Name: ',first_name,' ',last_name,', age: ', age)
as "Personal info"
from people
order by age
limit 3,2;


select *
from people;

insert into people (first_name, last_name, city, email, age, bio) values
('Mary', 'Poppins', 'London', 'maryp@gmail.uk', 138, "workings as babysitter");

alter table people
add check (age>=18 and age <=640);

insert into people (first_name, last_name, city, email, age, bio) values
('Lucifer', 'MoningStart', 'London', 'lucifer@gmail.uk', 638, "owner of drink bar");

alter table people
drop check people_chk_1;
describe people;


select *
from people;

select last_name, first_name, email
from people
where email like "%@%.com";

select *
from people
where first_name regexp "^J" and city regexp "k$";


select last_name, first_name, email
from people
where email regexp ".com$";

select *
from people
where bio regexp "^working$";


select *
from people
-- where bio like "%scintifist%" or bio like "%programmer%";
where bio regexp "scintifist|programmer";

select *
from people
-- where first_name regexp '^j|^m';
-- where first_name regexp '^[jmlan]a'
where first_name regexp '^[d-n]a';

select *
from people
where last_name regexp "^.{5}$";

select *
from people
where bio regexp "[p-r]{2,9}";

select *
from people
where last_name regexp "p.{2}p";

select *
from people
where bio regexp "[a-g]{2}[a-g]n";

select *, replace(bio, "working", "learning") as "new bio"
from people
where first_name = "Mary";

select now();

-- Show all bios that contain 4 or more letters "i"
select *
from people;

select *,length(bio), length(replace(bio, "i","")) 
from people
where length(bio) - length(replace(bio, "i","")) >= 4;

select reverse("Hello world");

select *, reverse(last_name)
from people;

delete 
from people
where id = 12;

select count(*)
from people
where age < (
select avg(age)
from people);

insert into people (first_name, last_name, city, email, age, bio) values
		('Mary', 'Cury', 'Paris', 'mary@gmail.fr', 38, 'working as pscintifist in univercity of Jeneva');

select first_name, last_name, city, email, age, bio
from people
group by first_name, last_name, city, email, age, bio
having count(*) > 1;

delete from people
where id not in (
select min(id)
from people
group by first_name, last_name, city, email, age, bio);


create table orders (orderID int not null auto_increment,
					productID int not null,
                    price int not null, customerID int, quantity int,
                    primary key(orderID),
                    foreign key (customerID) references people(id));


insert into orders (productID, price, customerID, quantity) values
            (1326,140,1,4),
            (1326,140,2,8),
            (3226,220,4,8),
            (1024,300,5,18),
            (1326,140,4,3),
            (3226,220,5,7);

select *
from orders;

select productID product, first_name, last_name, city
from orders o
join people p
	on o.customerID =p.id;

select orderID, productID, price, last_name
from orders o
right join people p
on o.customerID = p.id;

select first_name, last_name, sum(price * quantity) as total
from orders
join people
on orders.customerID = people.id
group by first_name, last_name;

-- 11.02.2025

use qa2046;

create table substring (stringID int not null auto_increment,
						name_num varchar(30) not null,
                        primary key (stringID));
                        
insert into substring (name_num) values
				("Alex 10"),
                ("Olga 20"),
                ("Peter 45"),
                ("Inga 50"),
                ("Ilon Musk");

select * 
from substring;

select concat(substring_index(name_num, " ", -1)," ", substring_index(name_num, " ", 1)) swappaed_value
from substring;


select *
from orders;

select last_name, first_name, price*quantity as sum
from orders o
join people p
on o.customerID = p.id
order by sum desc
limit 1;

select last_name,price*quantity as sum
from orders o
join people p
on o.customerID = p.id
where price*quantity >= 1500;

show tables;

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

alter table pet
add id int;

alter table pet
add primary key(id);

alter table pet
change id id int not null auto_increment;

insert into pet
(name, owner, species, sex) values ('cat', 'John Smith', 'siam', 'm');
insert into pet
(name, owner, species, sex) values ('dog', 'John Smith', 'buldog', 'f');
insert into pet
(name, owner, species, sex) values ('dog', 'Mary Loo', 'buldog', 'f');
insert into pet
(name, owner, species, sex) values ('dog', 'Luis Armstrong', 'husky', 'f');
insert into pet
(name, owner, species, sex) values ('fish', 'Michael Jackson', 'salmon', 'f');

alter table pet add age int;

select *
from pet;

update pet set age = 4 where id = 4;
update pet set age = 3 where name = "cat";
update pet set age = 2 where species = "buldog";
update pet set age = 1 where name = 'fish';


insert into pet (name, owner, species, sex) values ('fish', 'Michael Jackson', 'salmon', 'f');
insert into pet (name, owner, species, sex, age) values ('cat', 'Michael Jackson', 'sphynx', 'f', 5);

select *
from people;

select owner 
from pet
union
select concat(first_name, ' ', last_name)
from people;


select row_number() over
(order by id) row_num, id, first_name, last_name, age
from people;

select *
from (select row_number() over
(order by id) row_num, id, first_name, last_name, age
from people) as p
where mod(row_num, 2) = 1;


select last_name, first_name, age,
case when age < 30 then "This people is young"
	 when age > 55 then "This people is very smart"
     else "This people is in middle age"
end as comments
from people;

select now();
select dayofweek('2024-09-29');
select dayname('2024-09-29');
select dayname(now()) as Today;
select curdate();

select date_format(now(), '%d-%m-%Y') as today;
set time_zone = "+2:00";
select curtime();

select version();
select database();
select user();

show table status from qa2046;


set @start = 1;
set @finish = 4;

select * 
from people
where id between @start and @finish;


show variables;

delimiter //
create procedure maxBuy()
begin
select orderID, price, quantity, last_name, price * quantity as "total sum"
from orders o
join people p
	on o.customerID = p.id
order by price*quantity desc
limit 1;
end //
delimiter ;

call maxBuy();

delimiter //
create procedure tolCust(in big_sum int)
begin
select last_name, id
from people
where id in (
select customerID
from orders 
where price*quantity >= big_sum);
end //
delimiter ;

select *, price*quantity
from orders;

call tolCust(5000);

use qa2046;

select dayname(current_date()+10);

create table orders_by_customer as
select orderID, productID, last_name
from orders
join people
	on id = customerID;
    
show tables;

select *
from orders_by_customer;

create table duplicate_people as
select *
from people;

select *
from duplicate_people;

create table shipment (
		shipID int not null auto_increment,
        OrderID int not null,
        city varchar(20),
        performer varchar(20),
        status bit,
        shipDate date,
        primary key (shipID));
        
insert into shipment (OrderID, city, performer, status, shipDate) values
		(1044, 'London', 'DHL', 0, '2024-09-26'),
                (1034, 'NY', 'DHL', 0, '2024-07-26'),
                (1024, 'Pitsburg', 'DHL', 0, '2024-04-26'),
                (1064, 'LA', 'DHL', 0, '2024-05-26'),
                (1344, 'London', 'DHL', 0, '2024-08-21'),
                (1344, 'Berlin', 'DHL', 0, '2024-06-22'),
                (1744, 'London', 'DHL', 0, '2024-03-06'),
                (1544, 'London', 'Fedex', 0, '2024-06-26'),
                (2044, 'Denver', 'DHL', 0, '2024-06-26'),
                (1042, 'London', 'Amazon', 0, '2024-07-26'),
                (1045, 'Boston', 'DHL', 0, '2024-07-16'),
                (1048, 'London', 'Cargo', 0, '2024-08-28');

select *
from shipment;

select performer
from shipment
where shipDate >= date_sub(current_date(),interval 12 month)
group by performer
having count(distinct extract(year_month from shipDate)) >= 6;


create table employee (employeeID int not null auto_increment, name varchar(30), 
    role varchar(20),
    salary int,
    division varchar(20),
    report_to int,
    primary key (employeeID));
insert into employee (name, role, salary, division, report_to)
      values 
      ('John Smith', 'QA engineer', 8000, 'QA', 4),
      ('Elizabeth Taylor', 'QA engineer', 8500, 'QA', 4),
      ('Bob Dylan', 'QA engineer', 9000, 'QA', 4),
      ('Sam Bolton', 'QA manager', 12000, 'QA', 5),
      ('Bill Geits', 'CEO', 20000, 'management', null),
      ('Paul McKartney', 'Dev manager', 13000, 'development', 5),
      ('John Lennon', 'programmer', 9300, 'development', 6);


select name, report_to
from employee
where report_to is not null;

select e.name as employee, m.name as manager
from employee e
join employee m
on e.report_to = m.employeeID;


create table beverage (alcohol varchar(20),
		soft_drink varchar(20)); 
insert into beverage(alcohol, soft_drink)
values
			('rum', 'cola'),
            ('vodka', 'fanta'),
            ('liquer', 'sprite'),
            ('mochito', 'pepsi'),
            ('wiski', 'soda'),
            ('tequila', 'tonic');

select count(*) -- a.alcohol, s.soft_drink
from beverage a
cross join beverage s;

set @drink = (select alcohol from beverage where alcohol = 'rum');

select @drink;

SHOW PROCEDURE STATUS WHERE Db = 'qa2046';

