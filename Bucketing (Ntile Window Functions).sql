drop table emp_input;
create table emp_input
(
id      int,
name    varchar(40)
);
insert into emp_input values (1, 'Emp1');
insert into emp_input values (2, 'Emp2');
insert into emp_input values (3, 'Emp3');
insert into emp_input values (4, 'Emp4');
insert into emp_input values (5, 'Emp5');
insert into emp_input values (6, 'Emp6');
insert into emp_input values (7, 'Emp7');
insert into emp_input values (8, 'Emp8');

With CTE AS (
SELECT *,
concat(id,' ',name) as name1,
NTILE(4) over(ORDER BY ID) AS buckets
FROM emp_input
)
select group_concat(name1) as Name_final
from CTE 
group by buckets
order by name1