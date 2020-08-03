# Data for 5th Edition, year format YYYYMMDD Decimal
Use estateagent5thEd; 
Create table Branch (branchno varchar(5) not null,
street varchar(20) not null,
city varchar(20) not null,
postcode varchar(15),
primary key (branchno));
Insert into Branch values('B002','56 Clover Dr','London','NW10 6EU');
Insert into Branch values('B003','163 Main St','Glasgow','G11 9QX');
Insert into Branch values('B004','32 Manse Rd','Bristol','BS99 1NZ');
Insert into Branch values('B005','22 Deer Rd','London','SW1 4EH');
Insert into Branch values('B007','16 Argyll St','Aberdeen','AB2 3SU');

create table client (clientno varchar(5) not null,
fname varchar(10) not null,
lname varchar(10) not null,
telno varchar(16),
preftype varchar(10) not null,
maxrent decimal(6,2),
email varchar(30),
primary key (clientno));
Insert into Client values('CL56','Aline','Stewart','0141-848-1825','Flat',350.00,'asteward@hotmail.com');
Insert into Client values('CL62','Mary','Tregear','01224-196720','Flat',600.00, 'maryt@hotmail.com');
Insert into Client values('CL74','Mike','Ritchie','01475-392178','House',750.00, 'mritchie01@yahoo.co.uk');
Insert into Client values('CL76','John','Kay','0207-774-5632','Flat',425.00, 'john.kay@gmail.com');

create table privateowner (ownerno varchar(5) not null,
fname varchar(10) not null,
lname varchar(10) not null,
address varchar(50) not null,
telno varchar(16),
email varchar(30),
primary key (ownerno));
Insert into privateOwner values('CO40','Tina','Murphy','63 Well St Glasgow G42','0141-9431728','tinam@hotmail.com');
Insert into privateOwner values('CO46','Joe','Keogh','2 Fergus Dr Aberdeen AB2 7SX','01224-861212','jkeogh@lhh.com');
Insert into privateOwner values('CO87','Carol','Farrel','6 Achray St Glasgow G32 9DX','0141-3577419','cfarrel@gmail.com');
Insert into privateOwner values('CO93','Tony','Shaw','12 Park Pl Glasgow G4 0QR','0141-2257025','tony.shaw@ark.com');

create table staff (staffno varchar(5) not null,
fname varchar(10) not null,
lname varchar(10) not null,
position varchar(12),
sex char(1) not null default 'M',
dob date not null,
salary decimal(8,2) not null,
Branchno varchar(5),
primary key(staffno),
foreign key(branchno) references branch(branchno) on delete set null on update cascade,
unique (fname,lname));
Insert into staff values('SA9','Mary','Howe','Assistant','F','1970-02-19',9000.00,'B007');
Insert into staff values('SG14','David','Ford','Supervisor','M','1958-03-24',18000.00,'B003');
Insert into staff values('SG37','Ann','Beech','Assistant','F','1960-11-10',12000.00,'B003');
Insert into staff values('SG5','Susan','Brand','Manager','F','1940-06-03',24000.00,'B003');
Insert into staff values('SL21','John','White','Manager','M','1945-10-01',30000.00,'B005');
Insert into staff values('SL41','Julie','Lee','Assistant','F','1965-06-13',9000.00,'B005');
insert into staff values ('CIT1', 'Byron', 'Treacy', 'Manager','M','1900-1-1',50000.00,'B002');

create table propertyforrent (propertyno varchar(5) not null,
street varchar(20) not null,
city varchar(20) not null,
postcode varchar(15),
type varchar(10) not null,
rooms smallint not null,
rent decimal(6,2) not null,
ownerno varchar(5) not null,
staffno varchar(5),
branchno varchar(5),
primary key(propertyno),
foreign key(branchno) references branch(branchno) on delete set null on update cascade,
foreign key(staffno) references staff(staffno) on delete set null on update cascade,
foreign key(ownerno) references privateowner(ownerno) on delete restrict on update cascade);
Insert into propertyforrent values('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650.00,'CO46','SA9','B007');
Insert into propertyforrent values('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450.00,'CO93','SG14','B003');
Insert into propertyforrent values('PG21','18 Dale Rd','Glasgow','G12','House',5,600.00,'CO87','SG37','B003');
Insert into propertyforrent values('PG36','2 Manor Rd','Glasgow','G32 9QX','Flat',3,375.00,'CO93','SG37','B003');
Insert into propertyforrent values('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350.00,'CO40',null,'B003');
Insert into propertyforrent values('PL94','6 Argyll St','London','NW2','Flat',4,400.00,'CO87','SL41','B005');

Create table Viewing (Clientno varchar(5) not null,
propertyno varchar(5) not null,
viewdate date not null,
comment varchar(20),
primary key(clientno,propertyno, viewdate),
foreign Key (clientno) references client(clientno) on delete restrict on update cascade,
foreign Key (propertyno) references propertyforrent(propertyno) on delete restrict on update cascade);

Insert into viewing values('CL56','PA14','2008-5-24','too small');
Insert into viewing values('CL56','PG36','2008-4-28',null);
Insert into viewing values('CL56','PG4','2008-5-26',null);
Insert into viewing values('CL62','PA14','2008-05-14','no dining room');
Insert into viewing values('CL76','PG4','2008-4-20','too remote');
Insert into viewing values('CL56','PA14','2017-3-1','same as before')
