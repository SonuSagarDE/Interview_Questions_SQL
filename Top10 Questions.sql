## Q1 How to find duplicates based on key
Select emp_id,count(1) from employee group by emp_id
having count(1)>1;
## Q2 How to delete duplicates 
with cte as (Select *, row_number() over (partition by emp_id order by emp_id) as rn from employee)
delete from cte where rn>1;
