USE estateagent5thed;
show tables;
select * from branch;
select * from client;
select * from privateowner;
select * from staff;
select * from viewing;
select * from propertyforrent;

# 2.find all clients that use gmail
select * from client where email like '%gmail%';

# 3.list client names in alphabetical order with their email that can afford rentals from 400 to 700 inclusive
select fname, lname, maxrent, email from client where maxrent >= 400 and maxrent <=700 order by fname;

# 4. list the properties (without duplicates) that have been viewed (i.e. by any client)
select propertyforrent.propertyno from propertyforrent join viewing on propertyforrent.propertyno = viewing.propertyno where viewdate is TRUE group by propertyforrent.propertyno;

# 5. using pre and post SQL 92 join syntax, devise 2 ways to 'find staff assigned to work in branches in London
# 5.1. pre SQL 92 join syntax
select staff.staffno from staff,branch where staff.Branchno = branch.branchno and branch.city = "London";
# 5.2. post SQL 92 syntax
select staff.staffno from staff join branch on staff.Branchno = branch.branchno where branch.city = "London";

# 6. find property for rent in Glasgow where the owner and the branch that manages it are also in Glasgow
select propertyforrent.propertyno 
from (propertyforrent join privateowner on propertyforrent.ownerno = privateowner.ownerno) 
	join branch on propertyforrent.branchno = branch.branchno 
where branch.city = "Glasgow" and propertyforrent.city = 'Glasgow' and privateowner.address like '%Glasgow%';