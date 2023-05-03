drop table employee;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int,
Manager_id int);

insert into employee values(101, 'Mohan', 'Admin', 40000,104);
insert into employee values(102, 'Rajkumar', 'HR', 3000,104);
insert into employee values(103, 'Akbar', 'IT', 4000,109);
insert into employee values(104, 'Dorvin', 'Finance', 6500,110);
insert into employee values(105, 'Rohit', 'HR', 3000,101);
insert into employee values(106, 'Rajesh',  'Finance', 5000,101);
insert into employee values(107, 'Preet', 'HR', 7000,102);
insert into employee values(108, 'Maryam', 'Admin', 4000,101);
insert into employee values(109, 'Sanjay', 'IT', 6500,101);
insert into employee values(110, 'Vasudha', 'IT', 70000,101);
insert into employee values(101, 'Saurabh', 'HR', 3000,106);

COMMIT;