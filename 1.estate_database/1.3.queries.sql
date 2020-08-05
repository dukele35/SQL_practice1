USE estateagent5thed;
show tables;

# 1. find how many staff hold each Job position 
select position, count(position) as result from staff group by position;

# 2. find how many flats are available to rent in each city
select city, count(city) as answer from propertyforrent where type = "Flat" group by city;

# 3. list the branches in descending order of costs (in salary term)
select branchno, count(branchno) as myCount, sum(salary) as mySum from staff group by Branchno order by mySum desc;