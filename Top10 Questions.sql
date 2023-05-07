## Q1 How to find duplicates based on key
Select emp_id,count(1) from employee group by emp_id
having count(1)>1;
## Q2 How to delete duplicates 
with cte as (Select *, row_number() over (partition by emp_id order by emp_id) as rn from employee)
delete from cte where rn>1;
## Q3 Difference between union and union all
-- Union of two table will give unique but union all will give all the duplicates records as welll. 
## Q4 Differnce between rank,row_number and dense_rank()
select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
row_number() over(partition by dept_name order by salary desc) as rn
from employee e;
## Q5 Employee which are not present in Department table
-- Left join Emp table with department table based on dep_id and filter where dep_id is Null
##
