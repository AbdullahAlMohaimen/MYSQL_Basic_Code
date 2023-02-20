CREATE SCHEMA FirstSchema;

drop table FirstSchema.Employee;
drop table FirstSchema.Department;

# Emp_ID, Emp_Name, Emp_Age, Emp_Gender, Emp_Email,Emp_Dept, Emp_Salary
create table FirstSchema.Employee(
	Emp_ID int not null AUTO_INCREMENT,
    Emp_Name varchar(50) not null,
    Emp_Age int not null,
    Emp_Gender varchar(10) not null,
    Emp_Email varchar(25) not null,
    Emp_dept varchar(20) not null,
    Emp_Salary int not null,
    primary key(Emp_ID)
);
desc FirstSchema.Employee;

insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Abdullah AL Mohaimen',24,'Male','aamohaimen.cse@gmail.com','CSE',34000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Abdullah Saleh',25,'Male','abdullahsaleh@gmail.com','EEE',32000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Raihan Hossain',24,'Male','raihan@gmail.com','EEE',38000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Sultana Mahmud',24,'Female','sultana@gmail.com','IPE',31000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Shahadat Hossain Shetu',24,'Male','shetu@gmail.com','CE',28000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Tasnim Binte Zahid',21,'Female','tasnim@gmail.com','BBA',32000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Jannat Akter',23,'Female','jannat@gmail.com','BBA',33000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Samira',22,'Female','samira@gmail.com','TEX',31000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Saifur Rahman Rafi',24,'Male','rafi@gmail.com','BBA',35000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Mashfiq Rahman',25,'Male','mashfiq@gmail.com','CSE',33000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Tanvir Rahman Shovon',22,'Male','tanvir@gmail.com','ME',31000);
insert into firstschema.employee(Emp_Name,Emp_Age,Emp_Gender,Emp_Email,Emp_dept,Emp_salary) 
values('Rayed Ahmed Abbasy',23,'Male','abbasy@gmail.com','ARCH',33000);

select * from FirstSchema.Employee;
select count(Emp_ID) as TotalEmployee from FirstSchema.Employee;


create table FirstSchema.DepartMent(
	Dept_ID int not null auto_increment,
    Dept_Name varchar(100) not null,
    primary key(Dept_ID)
);
desc FirstSchema.Department;

insert into FirstSchema.DepartMent(Dept_Name) values('CSE');
insert into FirstSchema.DepartMent(Dept_Name) values('EEE');
insert into FirstSchema.DepartMent(Dept_Name) values('CE');
insert into FirstSchema.DepartMent(Dept_Name) values('ME');
insert into FirstSchema.DepartMent(Dept_Name) values('IPE');
insert into FirstSchema.DepartMent(Dept_Name) values('BBA');
insert into FirstSchema.DepartMent(Dept_Name) values('ARCH');
insert into FirstSchema.DepartMent(Dept_Name) values('TEX');

select * from FirstSchema.Department;



# NOT NULL CONSTRAINT
# UNIQUE 
create table FirstSchema.Player(
	Player_ID int not null,
    Player_Name varchar(50),
    Player_Address varchar(40),
    UNIQUE(Player_ID)
);
desc FirstSchema.Player;

Select * from FirstSchema.PLayer;




# PRIMARY KEY CONSTRAINT
create table UserInfo(
	User_ID int NOT NULL,
    User_Name varchar(40),
    User_Age int,
    Primary Key(User_ID)
);
desc FirstSchema.UserInfo;

select * from FirstSchema.UserInfo;



# CHECK CONSTRAINT
Create table VehicleInfo(
	Vehicle_ID int not null,
    Vehicle_Name varchar(50),
    Vehicle_Price int,
    check(Vehicle_Price>100000),
    primary key (Vehicle_ID)
);
desc FirstSchema.VehicleInfo;

insert into VehicleInfo values(1,'A',99990); #error
insert into VehicleInfo values(1,'A',1000001);

select * from FirstSchema.VehicleInfo;



# DEFAULT CONSTRAINT
create table AdminInfo(
	Admin_ID int not null,
    Admin_Name varchar(50),
    Admin_Age int,
    Admin_Address varchar(200) not null default 'Dhaka',
    Admin_Salary int,
    check (Admin_Age>22),
    primary key(Admin_ID)
);
desc FirstSchema.AdminInfo;

insert into AdminInfo(Admin_ID,Admin_Name,Admin_Age,Admin_Salary) values(1,'Mohaimen',22,34000);
insert into AdminInfo(Admin_ID,Admin_Name,Admin_Age,Admin_Salary) values(1,'Mohaimen',23,34000);

select * from FirstSchema.AdminInfo;


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# INDEX CONSTRAINT
create index NameIndex on Employee(Emp_Name);
create index InformationIndex on Employee(Emp_Name,Emp_Dept,Emp_Age);

show indexes from Employee;

drop index NameIndex on Employee;
show indexes from Employee;


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# ALTER A TABLE(ADD & DROP A COLUMN FROM AN EXISTING TABLE)
# TO ADD A COLUNM IN A TABLE
alter table Employee
add Emp_Salary int;

desc Employee;


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# TO DELETE A COLUMN IN A TABLE
alter table Employee
drop column Emp_Salary;

desc employee;


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# MODIFY A COLUMN / CHANGE THE DATA TYPE OF A COLUMN IN A TABLE
alter table Employee
modify column Emp_Salary varchar(30);

desc employee;



# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# SELECT DISTINCT STATEMENT
select distinct(Emp_Dept) as Department from Employee;
select distinct(Emp_Dept) as Department from Employee order by Emp_Dept asc;
select distinct(Emp_Age) as Age from Employee;



# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# DISPLAY RECORDS FROM A SPECIFIC COLUMN
select Emp_Name from Employee;
select Emp_Age from Employee;
select Emp_Dept from Employee;
select Emp_Address from Employee;



# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# WHERE CLOUSE
select * from Employee;

# =, >, <,>=, <=, <>, between, like, in
select * from Employee where Emp_name='Mohaimen';
select * from Employee where Emp_ID=4;
select * from Employee where Emp_Dept='CSE';

select * from Employee where Emp_Age>24;
select * from Employee where Emp_Age<25;
select * from Employee where Emp_Age>=23;
select * from Employee where Emp_Age<=22;

select * from Employee where Emp_Age between 22 and 24;
select * from Employee where Emp_Age between 24 and 25;

select * from Employee where Emp_Name like 'M%'; # started with M
select * from Employee where Emp_Name like '%M%'; # M in any position
select * from Employee where Emp_Name like '_oh%'; # second or third position 'oh'
select * from Employee where Emp_Name like 's_%_%'; # started s and atleast 3 character
select * from Employee where Emp_Name like '%n'; # end with n
select * from Employee where Emp_Name like '_o%n'; # o in second position and ends with n
select * from Employee where Emp_Name like 'M%n'; # start with M and ends with n
select * from Employee where Emp_Address like '%Dhaka';

select * from Employee where Emp_Age in (23,25);
select * from Employee where Emp_Dept in ('CSE','EEE');
select * from Employee where Emp_Dept not in ('CSE','EEE');

select * from Employee where Emp_Dept <>'CSE';
select * from Employee where Emp_Dept !='CSE';


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# AND, OR OPERATOR
select * from Employee where Emp_Dept='CSE' and Emp_Age=24;
select * from Employee where Emp_Dept='BBA' and Emp_Address='Uttara,Dhaka';
select * from Employee where Emp_Age in (23,25) and Emp_Dept='EEE';
select * from Employee where Emp_Age between 23 and 25 and Emp_Dept <> 'CSE' and Emp_Dept !='EEE';

select * from Employee where Emp_Dept='CSE' or Emp_Dept='EEE' order by Emp_Dept asc;
select * from Employee where Emp_Name like 'M%' and Emp_Dept='CSE';
select * from Employee where Emp_Name like 'M%' or Emp_Name like '%n';


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
#NOT OPERATOR
select * from Employee where not Emp_Age=24;
select * from Employee where not Emp_Dept='CSE' and not Emp_Dept='EEE';
select * from Employee where not Emp_Age between 23 and 25;
select * from Employee where not Emp_Age in (23,25);



# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
#COUNT FUNCTION
select count(*) as Total from Employee;
select count(Emp_ID) as Total_Employee from Employee;
select count(Emp_Name) as Total_Employee from Employee;
select count(Emp_Age) as Total_Employee from Employee;
select count(Emp_Dept) as CSE_Department from Employee where Emp_Dept='CSE';

select count(Emp_Name) as Employee from Employee where Emp_Address like '%Dhaka';

select count(Emp_Name)+1 as Total_Employee from Employee;
select count(Emp_Age)-1 as Total_Employee from Employee;


# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
#ALIAS
select Emp_Name as Name from Employee;
select Emp_Age as Age from Employee;
select Emp_Address as Address from Employee;
select Emp_Name as Name,Emp_Age as Age, Emp_Dept as Department,Emp_Address as Address from Employee;

select Emp_Name as Employee, Emp_Address as Address from Employee where Emp_Name like '%n' or Emp_Dept <> 'CSE';



# Emp_ID, Emp_Name, Emp_Dept, Emp_Age, Emp_Address, Emp_Salary
# CASE STATEMENT
select * from Employee;

select Emp_Name,Emp_Address,Emp_Dept,Emp_Age,
case 
	when Emp_Age>24 then 'Is greater then 24'
	when Emp_Age<24 then 'Is less then 24'
	else 'Is equal to 24'
end as Result from Employee;

select Emp_Name,Emp_Address,Emp_Age,Emp_Dept,
case 
	when Emp_Address like '%Dhaka' then 'Inside from Dhaka'
	when Emp_Address like '%Sirajganj' then 'Insdie from Sirajganj'
	when Emp_Address like '%Gazipur' then 'Insdie from Gazipur'
	when Emp_Address like '%Pabna' then 'Insdie from Pabna'
	else 'Outside from Bangladesh'
end as Result from Employee;


select Emp_Name,Emp_Age,Emp_Dept,
case when Emp_Age>24 then 'Is greater then 24'
	 when Emp_Age<24 then 'Is less then 24'
     else 'Is equal to 24'
end as Age,
case when Emp_Address like '%Dhaka' then 'Inside from Dhaka'
	 when Emp_Address like '%Sirajganj' then 'Inside from Dhaka'
     else 'Outside from Bangladesh'
end as Area
     from Employee;


select Emp_Name,Emp_Email,Emp_Dept,Emp_Address,  
case 
	when Emp_Address like '%Dhaka' then 'Dhaka'
	when Emp_Address like '%Sirajganj' then 'Sirajganj'
    when Emp_Address like '%Bogra' then 'Bogra'
    when Emp_Address like '%Pabna' then 'Pabna'
    when Emp_Address like '%Coxbazar' then 'Coxbazar'
    when Emp_Address like '%Comilla' then 'Comilla'
    when Emp_Address like '%Jessor' then 'Jessor'
    when Emp_Address like '%Gazipur' then 'Gazipur'
	else 'Outside from Bangladesh'
end as Result from Employee order by Emp_Dept asc;
     


# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# DELETE STATEMENT
delete from Employee where Emp_ID=21;
delete from Employee;  # delete all the information



# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# UPDATE STATEMENT
update Employee set Emp_Salary=32500 where Emp_ID=2;
update Employee set Emp_Address='Rauzan,Chittagong' where Emp_ID=14;



# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# AVG() function, SUM() function
select avg(Emp_ID) as Average_ID,avg(Emp_Age) as Average_Age ,avg(Emp_Salary) as Average_Salary from Employee;
select sum(Emp_ID) as Total_ID,sum(Emp_Age) as Total_Age ,sum(Emp_Salary) as Total_Salary from Employee;



# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# ORDER BY
select * from Employee order by Emp_ID desc;
select * from Employee order by Emp_Name;
select * from Employee order by Emp_Age desc;
select * from Employee order by Emp_Salary desc;



# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# DISTINCT
select distinct(Emp_Name) from Employee;
select distinct(Emp_Age) as Age from Employee order by Emp_Age;
select distinct(Emp_Gender) as Age from Employee;
select distinct(Emp_Dept) as Age from Employee;



# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# MAX(),MIN() FUNCTION
select max(Emp_ID) as MAX_ID,max(Emp_Age) as MAX_AGE,max(Emp_Salary) as MAX_SALARY from Employee;
select max(Emp_ID) as MAX_ID,max(Emp_Age) as MAX_AGE,max(Emp_Salary) as MAX_SALARY from Employee where Emp_Dept='CSE';
select min(Emp_ID) as MIN_ID,min(Emp_Age) as MIN_AGE,min(Emp_Salary) as MIN_SALARY from Employee;



# Emp_ID, Emp_Name,Emp_Age, Emp_Gender, Emp_Email, Emp_Dept, Emp_Address, Emp_Salary
# LIMIT CLAUSE
select * from Employee limit 5;




# CONSTRAINTS   #NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT
create table Department(
	Dept_ID int not null auto_increment,
    Dept_Name varchar(100) not null,
    Dept_Code int not null unique,
    primary key(Dept_ID)
);
desc Department;

create table User(
	User_ID int not null auto_increment,
    User_Name varchar(50),
    Dept_ID int not null,
    User_Age int not null,
    User_Gender varchar(10),
    User_Address varchar(40) not null default 'Dhaka',
    User_Salary int not null,

    check(User_Age>20),
    unique(User_ID),
    primary key(User_ID),
    foreign key (Dept_ID) references Department(Dept_ID)
);
desc User;

create table Admin(
	Admin_ID int not null auto_increment,
    User_ID int not null,
    Admin_Designation varchar(20) not null,
    PRIMARY KEY (Admin_ID),
    Foreign Key (User_ID) references User(User_ID)
);
desc Admin;


# DEPARTMENT-- Dept_ID, Dept_Name, Dept_Code
# USER-- User_ID, User_Name, Dept_ID, User_Age, User_Gender, User_Address, User_Salary
# ADMIN-- Admin_ID, User_ID, Admin_Designation
##INSERT INTO DEPARTMENT
insert into Department (Dept_Name,Dept_Code) values ('CSE', 5001),
													('EEE', 5002),
													('CE', 5003),
													('ARCH', 5004),
													('BBA', 5005),
													('TEX', 5006),
													('IPE', 5007),
													('ME', 5008),
													('MATH', 5009);
##INSERT INTO USER
insert into User(User_Name, Dept_ID, User_Age, User_Gender, User_Address, User_Salary) 
values ('Mohaimen',1,24,'Male','Arichpur, Tongi Bazar, Gazipur',38500),
	   ('Saleh',2,25,'Male','Niketon Bazar, Dhaka',37600),
       ('Shishir',3,23,'Male','Laxam, Comilla',36700),
       ('Sultana',5,23,'Female','Shazahanpur, Bogra',35900),
       ('Rafi',5,24,'Male','Muradnagar, Comilla',34800),
       ('Mashfiq',1,25,'Male','Badda, Gulshan, Dhaka',33400),
       ('Salma',2,21,'Female','Shahzadpur, Sirajganj',31600),
       ('Salman',6,24,'Male','Rampura, Dhaka',39400),
       ('Farhan',7,26,'Male','Uposhashar, Bogra',30600),
       ('Abir',1,25,'Male','Chokoria, Coxbazar',28500),
       ('Zahid',2,22,'Male','Ishwardi, Pabna',29900),
       ('Sumaya',5,23,'Female','Uttara, Dhaka',39600),
       ('Fuad',4,26,'Male','Thonthonia, Bogra',29500),
       ('Abbasy',6,23,'Male','Ishwardi, Pabna',28700),
       ('Jawad',8,22,'Male','Kolatoli, Coxbazar',38100),
       ('Zahin',9,21,'Male','Tongi Bazar, Gazipur',35400),
       ('Tasnim',1,26,'Female','Shahzadpur, Sirajganj',34500),
       ('Raihan',2,27,'Male','Arichpur, Tongi Bazar, Dhaka',36600),
       ('Samira',8,28,'Female','Ishwardi, Pabna',37500),
       ('Samad',7,27,'Male','Bachra, Shahzadpur, Sirajganj',31900),
       ('Mahima',6,22,'Female','Uttara, Dhaka',32100),
       ('Saif',5,24,'Male','Josimuddin, Uttara, Dhaka',37600),
       ('Pritom',9,23,'Male','Benapol, Jessor',27800),
       ('Maisha',4,25,'Female','Aftabnagar, Dhaka',29100),
       ('Nabil',3,26,'Male','Uttara, Dhaka',40500),
       ('Shovon',8,28,'Male','Kawla, Airport, Dhaka',32300),
       ('Tamanna',1,27,'Female','Noordala, Shahzadpur, Dhaka',33400),
       ('Joynob',8,24,'Female','Kashinathpur, Pabna',28000),
       ('Samia',9,23,'Female','Shazahanpur, Badda, Dhaka',38400),
       ('Zobayer',5,21,'Male','Shahzadpur, Sirajganj',31500);

##INSERT INTO ADMIN
insert into Admin (User_ID, Admin_Designation)
	values(1,'AA'),
		  (2,'AC'),
		  (4,'AD'),
		  (6,'AB'),
		  (10,'AC'),
		  (15,'AD'),
		  (21,'AA'),
		  (25,'AB'),
		  (29,'AC'),
		  (18,'AD');

select * from Department;
select * from User;
select * from Admin;




# DEPARTMENT-- Dept_ID, Dept_Name, Dept_Code
# USER-- User_ID, User_Name, Dept_ID, User_Age, User_Gender, User_Address, User_Salary
# ADMIN-- Admin_ID, User_ID, Admin_Designation
# INNER JOIN, LEFT JOIN, RIHT JOIN
select User_Name,Dept_Name,User_Age,User_Gender,User_Address 
 from User INNER JOIN Department on User.Dept_ID=Department.Dept_ID;
 
select User_Name,Dept_Name,User_Age,User_Gender,User_Address 
 from User INNER JOIN Department on User.Dept_ID=Department.Dept_ID where Dept_Name='CSE';
 
select User_Name,Dept_Name,User_Address,User_Salary 
 from User LEFT JOIN Department on User.Dept_ID=Department.Dept_ID;
 
select User_Name,Dept_Name,User_Address,User_Salary 
 from Department LEFT JOIN User on Department.Dept_ID=User.Dept_ID;
 
select User_Name,Admin_Designation,User_Address 
 from User LEFT JOIN Admin on User.User_ID=Admin.User_ID;
 
select User_Name,Admin_Designation,User_Address 
 from Admin LEFT JOIN User on Admin.User_ID=User.User_ID;
 
select User_Name,Admin_Designation,User_Address 
 from User RIGHT JOIN Admin on User.User_ID=Admin.User_ID;

select User_Name,Admin_Designation,User_Address 
 from Admin RIGHT JOIN User on Admin.User_ID=User.User_ID;
 

#ADVANCE SQL
select User_Name,Dept_Name,User_Address,User_Salary 
 from User LEFT JOIN Department on User.Dept_ID=Department.Dept_ID;

select User_Name,Dept_Name,User_Address,User_Salary 
 from User LEFT JOIN Department on User.Dept_ID=Department.Dept_ID 
 where Department.Dept_ID is null;
 
select User_Name,Dept_Name,User_Address,User_Salary 
 from Department LEFT JOIN User on Department.Dept_ID=User.Dept_ID 
 where User.Dept_ID is null;

select User_Name,Admin_Designation,User_Address 
 from User LEFT JOIN Admin on User.User_ID=Admin.User_ID
 where Admin.User_ID is null;

select User_Name,Admin_Designation,User_Address 
 from User RIGHT JOIN Admin on User.User_ID=Admin.User_ID
 where User.User_ID is null;

select User_Name,Admin_Designation,User_Address 
 from Admin RIGHT JOIN User on Admin.User_ID=User.User_ID
 where Admin.User_ID is null;
 
select User_Name,Admin_Designation,User_Address,User_Salary
 from User JOIN Admin on User.User_ID=Admin.User_ID;
 
select User_Name,Admin_Designation,User_Address,User_Salary
 from User JOIN Admin on User.User_ID=Admin.User_ID
 where User.User_ID is null or Admin.User_ID is null;
 

#SUB QUERY
select User_Name,Dept_Name,Admin_Designation,User_Address,User_Salary 
 from User JOIN Department on User.Dept_ID=Department.Dept_ID
 join Admin on User.User_ID=Admin.User_ID;

select User_Name,Dept_Name,Admin_Designation,User_Address,User_Salary 
 from User JOIN Department on User.Dept_ID=Department.Dept_ID
 join Admin on User.User_ID=Admin.User_ID order by User_Name;





