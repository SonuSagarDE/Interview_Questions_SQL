## Q1 How to find duplicates based 
Select emp_id,count(1) from employee group by emp_id
having count(1)>1