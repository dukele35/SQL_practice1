USE estateagent5thed;
show tables;

# 1. use a nested select to find staff assigned to work in branches in London 
select staffno from staff where branchno in 
(select branchno from branch where city = 'London');

# 2. find the names of staff and their position that earn less than the avarage salary
select fname as FirstName, lname as Surname, position, salary from staff where salary < 
(select avg(salary) from staff);

# 3. find branches details for branches that have no manager
select * from branch where branchno not in (select branchno from staff where position = 'Manager');

# 4. putting all together: find the branch details that has the highest average salary
select * from branch where branchno = 
(select branchno from staff group by Branchno having avg(salary) >= all 
(select avg(salary) from staff group by Branchno));

