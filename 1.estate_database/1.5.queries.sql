USE estateagent5thed;
SHOW TABLES;
DESCRIBE branch;

#1. 
SELECT staffno
FROM staff s 
WHERE Branchno in 
(SELECT Branchno
FROM branch
where Branchno='B005' or Branchno='B002'
);

#2. 
describe staff;

select fname,lname,salary 
FROM staff
Where salary < (select avg(salary) 
				from staff);

#3.
SELECT branchno,street,city,postcode
FROM branch b
where b.branchno not IN
					(select branchno
                    from staff s 
                    where s.position = 'Manager'
                    );
                    
#4.
					select s.Branchno
                    from staff s
					group by s.Branchno
                    having avg(s.salary) >=all ( select avg(s.salary) from staff s
					group by s.Branchno);

#the all is the group of all the averages

#4. with full details                    
select *
from branch
where branch.branchno = (
					select s.Branchno
                    from staff s
					group by s.Branchno
                    having avg(s.salary) >=all ( select avg(s.salary) from staff s
					group by s.Branchno)
);












