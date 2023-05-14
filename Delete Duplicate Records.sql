drop table if exists cars;
create table if not exists cars
(
    id      int,
    model   varchar(50),
    brand   varchar(40),
    color   varchar(30),
    make    int
);
insert into cars values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into cars values (2, 'EQS', 'Mercedes-Benz', 'Black', 2022);
insert into cars values (3, 'iX', 'BMW', 'Red', 2022);
insert into cars values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into cars values (5, 'Model S', 'Tesla', 'Silver', 2018);
insert into cars values (6, 'Ioniq 5', 'Hyundai', 'Green', 2021);

--  Data duplicated based on SOME of the columns--
-- Requirement: Delete duplicate data from cars table. Duplicate record is identified based on the model and brand name--

## Method 1 using unique indentifier----
delete from cars
where id in (
Select max(id) as id
from cars
group by model,brand
having count(1)>1);

## Using Self join--
delete from cars where id in (
select c2.id from cars c1 
	inner join cars c2 
		on c1.model=c2.model and c1.brand=c2.brand
			and c1.id<c2.id)
