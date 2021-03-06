# unlock the line below then run only that line to create the database shipments; after that, locking the line again
# create database shipments;

# after creating the database, run the rest of codes below to make the entries for the database
use shipments;
create table s (
sno varchar(5) not null primary key,
sname varchar(10) not null,
status int1 default 0,
city varchar(10));
create table p (
pno varchar(5) not null primary key,
pname varchar(10) not null,
weight smallint,
material varchar(10), 
colour varchar(10) default 'Black', 
city varchar(10));
create table j (
jno varchar(5) not null primary key,
jname varchar(10) not null,
jcity varchar(10),
company varchar(10) not null,
start_date date);
create table spj(
sno varchar(5) not null,
pno varchar(5) not null,
jno varchar(5) not null,
qty int,
u_price real(4,2),
Primary key (sno, pno, jno),
Foreign Key (sno) references s (sno) on delete restrict on update cascade,
Foreign Key (pno) references p (pno) on delete restrict on update cascade,
Foreign Key (jno) references j (jno) on delete restrict on update cascade);
Insert into J values('J1','Sorter','Paris','IBM','2000-01-03');
Insert into J values('J2','Punch','Rome','Digital','2000-05-12');
Insert into J values('J3','Reader','Athens','Wang','2000-10-25');
Insert into J values('J4','Console','Athens','Wang','2000-12-1');
Insert into J values('J5','Collator','London','IBM','2001-6-15');
Insert into J values('J6','Console','Oslo','Hewlett','2001-11-17');
Insert into J values('J7','Tape','London','Digital','2002-02-21');
Insert into J values('J8','Staple','Dublin','Digital','2004-11-23');
Insert into P Values('P1','Nut',12,'Steel','Red','London');
Insert into P Values('P2','Bolt',17,'Steel','Green','Paris');
Insert into P Values('P3','Screw',17,'Brass','Blue','Rome');
Insert into P Values('P4','Screw',14,'Graphite','Red','London');
Insert into P Values('P5','Can',12,'Brass','Blue','Paris');
Insert into P Values('P6','Cog',19,'Graphite','Red','London');
Insert into S values('S1','Smith',20,'London');
Insert into S values('S2','Jones',10,'Paris');
Insert into S values('S3','Blake',30,'Paris');
Insert into S values('S4','Clark',20,'London');
Insert into S values('S5','Adams',30,'Athens');
Insert into S values('S6','Murphy',10,'Cork');
Insert into Spj values('S1','P1','J1',1500,0.25);
Insert into Spj values('S1','P1','J4',1200,0.30);
Insert into Spj values('S2','P3','J1',500,1.20);
Insert into Spj values('S2','P3','J2',250,1.40);
Insert into Spj values('S2','P3','J3',1200,1.00);
Insert into Spj values('S2','P3','J4',900,1.05);
Insert into Spj values('S2','P3','J5',750,1.15);
Insert into Spj values('S2','P3','J6',100,1.50);
Insert into Spj values('S2','P3','J7',350,1.35);
Insert into Spj values('S2','P5','J2',700,22.50);
Insert into Spj values('S3','P3','J1',1100,1.00);
Insert into Spj values('S3','P4','J2',1000,1.02);
Insert into Spj values('S4','P6','J3',475,10.00);
Insert into Spj values('S4','P6','J7',690,9.75);
Insert into Spj values('S5','P1','J4',350,1.20);
Insert into Spj values('S5','P2','J2',1300,12.50);
Insert into Spj values('S5','P2','J4',1550,12.25);
Insert into Spj values('S5','P3','J4',350,1.25);
Insert into Spj values('S5','P4','J4',600,1.05);
Insert into Spj values('S5','P5','J4',250,25.00);
Insert into Spj values('S5','P5','J5',250,25.00);
Insert into Spj values('S5','P5','J7',1340,21.50);
Insert into Spj values('S5','P6','J2',1000,10.00);
Insert into Spj values('S5','P6','J4',150,13.00);