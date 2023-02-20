# CREATE SCHEMA
create schema if not exists MYSQL_DB; #or (create schema MYSQL_DB)


# SHOW ALL DATABASE
show databases;


# WHICH DATABASE YOU WANT TO USE
use MYSQL_DB;


# CREATE ALL TABLE
# DEPARTMENT TABLE
drop table if exists Department;

create table if not exists Department(
	Dept_ID int not null auto_increment,
    Dept_Name varchar(20) not null,
    
    primary key(Dept_ID)
);
desc Department;


# EMPLOYEE TABLE
drop table if exists Employee;

create table if not exists Employee(
	Emp_ID int not null auto_increment,
    Dept_ID int not null,
    Emp_Name varchar(30) not null,
    Emp_Category varchar(20),
    Emp_Gender varchar(10) not null,
    Emp_Age int not null,
    Emp_Email varchar(30) not null unique,
    Emp_Address varchar(30),
    Emp_Phone varchar(15) unique,
    Emp_Salary decimal(20,5),
    
    primary key(Emp_ID),
    check(Emp_Age>=18),
    foreign key(Dept_ID) references Department(Dept_ID)
);
desc Employee;


# VEHICLE CATEGORY
drop table if exists VehicleCategory;

create table if not exists VehicleCategory(
	VCtg_ID int not null auto_increment,
    VCtg_Name varchar(10),
    
    primary key(VCtg_ID)
);
desc VehicleCategory;


# VEHICLE
drop table if exists Vehicle;

create table if not exists Vehicle(
	Vehicle_ID int not null auto_increment,
    VCtg_ID int not null,
    Vehicle_Name varchar(15) not null,
    Vehicle_Seat int,
    Vehicle_RentPrice decimal(20,5),
    
    primary key(Vehicle_ID),
    foreign key(VCtg_ID) references VehicleCategory(VCtg_ID)
);
desc Vehicle;


# ITEM CATEGORY
drop table if exists ItemCategory;

create table if not exists ItemCategory(
	ICtg_ID int not null auto_increment,
    ICtg_Name varchar(30),
    
    primary key(ICtg_ID)
);
desc ItemCategory;


# ITEM 
drop table if exists Item;

create table if not exists Item(
	Item_ID int not null auto_increment,
    ICtg_ID int not null,
    Item_Name varchar(40) not null,
    Item_Available varchar(10),
    Item_Price decimal(20,5),
    
    primary key(Item_ID),
    foreign key(ICtg_ID) references ItemCategory(ICtg_ID)
);
desc Item;


# RENT
drop table if exists Rent;

create table if not exists Rent(
	Rent_ID int not null auto_increment,
    Emp_ID int not null,
    Vehicle_ID int not null,
    Rent_Date Date,
    Rent_TotalDays int,
    Rent_TotalPrice decimal(20,5),
    
    primary key(Rent_ID),
    foreign key(Emp_ID) references Employee(Emp_ID),
    foreign key(Vehicle_ID) references Vehicle(Vehicle_ID)
);
desc Rent;


# ORDER
drop table if exists ItemOrder;

create table if not exists ItemOrder(
	Order_ID int not null auto_increment,
    Emp_ID int not null,
    Item_ID int not null,
    Order_Date Date,
    Order_TotalPiece int not null,
    Order_TotalPrice decimal(20,5),
    
    primary key(Order_ID),
    foreign key(Emp_ID) references Employee(Emp_ID),
    foreign key(Item_ID) references Item(Item_ID)
);
desc ItemOrder;


# INSERT DEPARTMENT TABLE
insert into Department(Dept_Name) 
			values('CSE'),
				  ('EEE'),
                  ('CE'),
                  ('ME'),
                  ('IPE'),
                  ('TEX'),
                  ('ARCH'),
                  ('BBA'),
                  ('MATH'),
                  ('Arts & Science');
select * from Department;


# INSERT EMPLOYEE TABLE
insert into Employee(Dept_ID,Emp_Name,Emp_Category,Emp_Gender,Emp_Age,Emp_Email,Emp_Address,Emp_Phone, Emp_Salary)
	values(1,'Mohaimen Hasan','Admin','Male',23,'mohaimen@gmail.com','Arichpur, Tongi Bazar, Gazipr',01521209559,38500),
          (2,'Abdullah Saleh','Teacher','Male',25,'saleh@gmail.com','Niketon Bazar, Mohakhali',01751064515,37500),
          (3,'Nabil Ahmed','Proctor','Male',24,'nabil@gmail.com','Sector 07, Uttara, Dhaka',018352415,36400),
          (4,'Tanvir Rahman Shovon','Proctor','Male',26,'shovon@gmail.com','Sundalpur, Noakhali',01521527618,35700),
          (5,'Adit Provat','Teacher','Male',21,'adit@gmail.com','College Gate, Tongi, Gazipur',01954271865,34900),
          (6,'Rashid Abid Bebhob','Admin','Male',23,'bebhob@gmail.com','ECB, Dhaka',0195627856,37100),
          (7,'Rayed Ahmed Abbasy','Teacher','Male',25,'abbasy@gmail.com','Sector 11, Uttara, Dhaka',01721209559,39400),
          (8,'Sultana','Teacher','Female',23,'sultana@gmail.com','Shazahanpur, Bogra',01867985623,35100),
          (1,'Mashfiq Rahman','Admin','Male',24,'mashfiq@gmail.com','Badda, Glshan, Dhaka',01856769813,37100),
          (2,'Robin Khan','Proctor','Male',24,'robin@gmail.com','Joynal Market, Uttara, Dhaka',01756209559,36500),
          (1,'Mohammad Shafiq','Admin','Male',25,'shafiq@gmail.com','Joynal Market, Uttara, Dhaka',01645209559,35500),
          (3,'Joty','Teacher','Female',24,'joty@gmail.com','Shazahanpur, Bogra',01785209959,32500),
          (6,'Raihan Hossain','Teacher','Male',25,'raihan@gmail.com','Arichpur, Tongi Bazar, Gazipur',01785713620,34900),
          (2,'Sadia','Teacher','Female',22,'sadia@gmail.com','Ishwardi, Pabna',01986209559,33100),
          (7,'Samira','Proctor','Female',21,'samira@gmail.com','Shahzadpur, Sirajganj',01589209559,36800),
          (1,'Shishir','Admin','Male',24,'shishir@gmail.com','Laxam, Comilla',01845209559,35600),
          (4,'Tasnim','Teacher','Female',22,'tasnim@gmail.com','Shahzadpur, Sirajganj',01745209559,32900),
          (5,'Abir','Admin','Male',26,'abir@gmail.com','Chokoria, Coxbazar',01545209129,35500),
          (7,'Shahdat','Teacher','Male',21,'shahdat@gmail.com','Mahendranagar, Lalmonirhat',01949209559,35500),
          (6,'Peom Datta','Teacher','Male',22,'peom@gmail.com','Rauzan, Chattogram',01785209559,35500),
          (1,'Shagor Hossain','Teacher','Male',24,'shagor@gmail.com','Thonthonia, Bogra',01690209559,35500),
          (7,'Rayhan','Proctor','Male',25,'rayhan@gmail.com','Naldanga, Nator',01655209559,35500),
          (2,'Badhon Kumar','Admin','Male',26,'badhon@gmail.com','Rajganj, Noakhali',01950209559,35500),
          (5,'Hadi','Teacher','Male',22,'hadi@gmail.com','Nowpara, Nator',01545209559,35500),
          (4,'Nahidul Islam','Proctor','Male',21,'nahidul@gmail.com','Sector 10, Uttara, Dhaka',01987209559,35500),
          (9,'Samia','Admin','Female',24,'samia@gmail.com','Bdda, Dhaka',01845200959,35500),
          (3,'Salma','Teacher','Female',23,'salma@gmail.com','Majhira, Shazahanpur, Bogra',01645569559,35500),
          (1,'Salman','Teacher','Male',22,'salman@gmail.com','Ragurampur, Comilla',01890209559,35500),
          (4,'Jannat','Teacher','Female',24,'jannat@gmail.com','Muradnagar, Comilla',01714209559,35500),
          (7,'Toufiq','Proctor','Male',25,'toufiq@gmail.com','Uposhoshor, Bogra',01533209559,35500),
          (6,'Reza','Teacher','Male',26,'reza@gmail.com','Shapahar, Naogaon',01690709559,35500),
          (4,'Alamin','Admin','Male',23,'alamin@gmail.com','Mainamoti, Comilla',01788209559,34500),
          (1,'Arafat Hossain','Teacher','Male',26,'arafat@gmail.com','Mohonpur, Rajshahi',01895209559,35500),
          (7,'Saifur Rahman Rafi','Teacher','Male',24,'rafi@gmail.com','Sector 9, Uttara, Dhaka',01835658894,36700),
          (9,'Sadia Sultana','Admin','Female',22,'sadiasultana@gmail.com','Mohammadpur, Dhaka',01945209559,33700),
          (1,'Bin Saif','Admin','Male',22,'saif@gmail.com','Josimuddin, Uttara, Dhaka',01832209559,34100),
          (5,'Maisha','Teacher','Female',21,'maisha@gmail.com','Laxam, Comilla',01781209559,31100),
          (2,'Noushin','Admin','Female',23,'noushin@gmail.com','Ishwardi, Pabna',01909312559,35800);
select * from Employee;


# INSERT VEHICLECATEGORY TABLE
insert into VehicleCategory(VCtg_Name) 
		values('Bus'),
			  ('Car'),
              ('Truck'),
              ('Bike'),
              ('Cycle');
select * from VehicleCategory;


# INSERT VEHICLE TABLE
insert into Vehicle(VCtg_ID,Vehicle_Name,Vehicle_Seat,Vehicle_RentPrice)
	values(1,'Ena',36,34000),
		  (2,'Corolla',4,8000),
          (3,'Truck A',2,40000),
          (4,'Yamaha R15',2,5000),
          (5,'Veloce A',1,2500),
          (1,'Akota',36,34000),
		  (2,'Corolla X',4,7800),
          (3,'Truck B',2,38400),
          (4,'Gixer X',2,4500),
          (5,'Phonix A',2,1000),
          (1,'Shyamoli',36,32000),
		  (2,'Axio A',4,6000),
          (3,'Truck C',2,39100),
          (4,'Yamaha R1',2,4000),
          (5,'Veloce C',1,2000),
          (1,'Shah Fateh Ali',40,38000),
		  (2,'Toyota A',8,9800),
          (3,'Truck D',2,35600),
          (4,'Pulser A',2,3400),
          (5,'Phonix B',2,1100),
          (1,'Shohug',36,33000),
		  (2,'Toyota B',6,8500),
          (3,'Tata A',2,29100),
          (4,'Discover A',2,2000),
          (5,'Veloce A',1,1800),
          (1,'Hanif',40,35300),
		  (2,'Corolla MS',4,7200),
          (3,'Truck E',2,31800),
          (4,'Gixer ES',2,4000),
          (5,'Phonix D',2,900),
          (1,'C Line',40,33700),
		  (2,'Axio SA',6,7000),
          (3,'Truck Fa',2,30000),
          (4,'Suzuki XS',2,3200),
          (5,'Veloce F',1,1500),
          (1,'MP Sidor',36,33600),
		  (2,'Toyota F',8,9200),
          (3,'Truck SX',2,29800),
          (4,'Pulser W',2,1900),
          (5,'Phonix QD',2,800);
select * from Vehicle;


# INSERT VEHICLECATEGORY TABLE
insert into ItemCategory(ICtg_Name)
		values('Phone'),
			  ('Watch'),
              ('Laptop'),
              ('Desktop'),
              ('Headphone'),
              ('Football'),
              ('Tripod');
select * from ItemCategory;


# INSERT ITEM TABLE
insert into Item(ICtg_ID,Item_Name,Item_Available,Item_Price)
		values(1,'Oneplus 7T pro','Yes',67000),
			  (2,'Casio','Yes',1200),
              (3,'HP Probook 440G5','Yes',55400),
              (5,'Oneplus Bullet Wireless Z','Yes',3200),
              (6,'Fifa Official Ball-2022','Yes',12000),
              (1,'Pixel 7 pro','No',100000),
			  (2,'Casio SA','No',1800),
              (3,'HP Folio','Yes',230400),
              (5,'Apple AirBuds Pro','Yes',9000),
              (6,'Fifa Official Ball-2018','No',9000),
              (1,'Apple 14 Pro Max','Yes',123000),
			  (2,'Oneplus Watch','Yes',11000),
              (3,'HP Envy','No',78400),
              (5,'Oneplus Buds','Yes',6700),
              (6,'UCL Official Ball-2023','Yes',10000),
              (1,'Pixel 6 Pro','Yes',55000),
			  (2,'Apple Watch X','No',35800),
              (3,'Asus XD','Yes',49400),
              (5,'Oneplus Bullet Wireless Z2','Yes',3800),
              (6,'UCL Official Ball-2022','Yes',7800),
              (1,'Oneplus 10 Pro','Yes',100000),
			  (2,'Samsung Watch 3','No',13100),
              (3,'HP Spectra','Yes',240400),
              (5,'Samsung Buds Pro 3','Yes',8200),
              (6,'Fifa Official Ball-2014','No',7200),
              (1,'Apple 13 Pro Max','Yes',103000),
			  (2,'Amazfit watch 3','Yes',9200),
              (3,'Apple Mackbook Pro','Yes',180400),
              (5,'Oneplus Buds Z','Yes',8200),
              (6,'UCL Official Ball-2018','Yes',9400);
select * from Item;



# INSERT RENT TABLE
insert into Rent(Emp_ID,Vehicle_ID,Rent_Date,Rent_TotalDays,Rent_TotalPrice)
		values(118,2,'2022-09-10',3,3*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=2)),
			  (120,7,'2022-09-17',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=7)),
			  (152,1,'2022-09-20',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=1)),
              (132,4,'2022-09-28',3,3*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=4)),
              (122,2,'2022-10-1',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=2)),
              (121,8,'2022-10-6',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=8)),
              (118,10,'2022-10-14',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=10)),
              (125,19,'2022-10-15',3,3*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=19)),
              (120,13,'2022-10-21',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=13)),
              (140,7,'2022-10-28',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=7)),
              (148,6,'2022-11-5',4,4*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=6)),
              (150,3,'2022-11-9',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=3)),
              (149,4,'2022-11-11',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=4)),
              (145,11,'2022-11-17',3,3*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=11)),
              (133,19,'2022-11-26',4,4*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=19)),
              (122,20,'2022-12-1',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=20)),
              (120,11,'2022-12-7',3,3*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=11)),
              (119,6,'2022-12-11',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=6)),
              (115,2,'2022-12-18',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=2)),
              (144,9,'2022-11-17',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=9)),
              (121,10,'2022-11-26',4,4*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=10)),
              (123,1,'2022-12-1',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=1)),
              (119,3,'2022-12-7',1,1*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=3)),
              (120,6,'2022-12-11',2,2*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=6)),
              (139,8,'2022-12-18',3,3*(select Vehicle_RentPrice from Vehicle where Vehicle_ID=8));
select * from Rent;



# INSERT ITEMORDER TABLE
insert into ItemOrder(Emp_ID,Item_ID,Order_Date,Order_TotalPiece,Order_TotalPrice)
		values(118,2,'2022-10-10',1,1*(select Item_Price from Item where Item_ID=2)),
			  (115,1,'2022-10-15',2,2*(select Item_Price from Item where Item_ID=1)),
              (122,7,'2022-10-22',1,1*(select Item_Price from Item where Item_ID=7)),
              (119,3,'2022-10-30',3,3*(select Item_Price from Item where Item_ID=3)),
              (128,10,'2022-11-2',1,1*(select Item_Price from Item where Item_ID=10)),
              (138,19,'2022-11-8',2,2*(select Item_Price from Item where Item_ID=19)),
              (142,5,'2022-11-14',2,2*(select Item_Price from Item where Item_ID=5)),
              (151,1,'2022-11-19',1,1*(select Item_Price from Item where Item_ID=1)),
              (143,6,'2022-11-26',2,2*(select Item_Price from Item where Item_ID=6)),
              (117,8,'2022-12-1',1,1*(select Item_Price from Item where Item_ID=8)),
              (149,20,'2022-12-8',1,1*(select Item_Price from Item where Item_ID=20)),
              (150,30,'2022-12-15',3,3*(select Item_Price from Item where Item_ID=30)),
              (148,26,'2022-12-19',1,1*(select Item_Price from Item where Item_ID=26)),
              (141,4,'2022-12-26',2,2*(select Item_Price from Item where Item_ID=4)),
              (133,7,'2022-12-29',1,1*(select Item_Price from Item where Item_ID=7)),
              (122,19,'2023-1-4',2,2*(select Item_Price from Item where Item_ID=19)),
              (129,25,'2023-1-19',1,1*(select Item_Price from Item where Item_ID=25)),
              (130,13,'2023-1-24',3,3*(select Item_Price from Item where Item_ID=13));
select * from ItemOrder;




# ADD A COLUNM IN A TABLE
alter table Employee
add Emp_Designation int;

desc Employee;




# TO DELETE A COLUMN IN A TABLE
alter table Employee
drop column Emp_Designation;

desc employee;



# MODIFY A COLUMN / CHANGE THE DATA TYPE OF A COLUMN IN A TABLE
alter table Employee
modify column Emp_Salary varchar(30);

desc employee;


# CHANGE COUMN NAME
ALTER TABLE Employee 
CHANGE COLUMN Emp_Name EmpName varchar(250) NOT NULL;
ALTER TABLE Employee 
CHANGE COLUMN EmpName Emp_Name varchar(250) NOT NULL;



# ADD COLUMN IN SPECIFIC POSITION
ALTER TABLE  Employee 
ADD Emp_Designation varchar(50) NULL AFTER  Emp_Gender;



# INDEX CONSTRAINT
create index NameIndex on Employee(Emp_Name);
create index InformationIndex on Employee(Emp_Name,Emp_Dept,Emp_Age);

show indexes from Employee;

drop index NameIndex on Employee;
show indexes from Employee;




# SELECT
select * from Employee;
select distinct(Emp_Address) from Employee;
select distinct(Emp_ID) from ItemOrder;
select count(distinct(Emp_ID)) from ItemOrder;

select Emp_Name,Emp_Address from Employee;
select concat(Emp_Name,'-',Emp_Address) from Employee;

select Emp_Name as Name,Emp_Age as Age,Emp_Salary as Salary from Employee;



# LEFT
select left(Emp_Name,4) as Short_Name from Employee;
select right(Emp_Name,4) as Short_Name from Employee;
select left(Order_Date,4) as Year from ItemOrder;
select distinct(left(Order_Date,4)) as Year from ItemOrder;



# WHERE (AND , OR)
select Emp_Name from Employee where Emp_Age>23;
select Emp_Name from Employee where Emp_Age>23 and Emp_Salary>35000;
select Emp_Name,Emp_Address from Employee where Emp_Age>25 or Emp_Category='Admin';
select Emp_ID,Vehicle_ID,Rent_Date from Rent where Rent_Date>'2022-11-10';
select * from Employee where Emp_Address like '%Dhaka' and Emp_Age=24;
select * from Employee where Emp_Age>24 and Emp_Address like '%Uttara%';
select * from Employee where Emp_Age in (23,25) and Emp_Address like '%Dhaka';
select * from Employee where Emp_Age between 23 and 25 and Emp_Address <> 'Dhaka' and Emp_Address !='Uttara';
select * from Department where Dept_Name='CSE' or Dept_Name='EEE' order by Dept_Name asc;
select * from Employee where Emp_Name like 'M%' and Emp_Address like '%Uttara%';
select * from Employee where Emp_Name like 'M%' or Emp_Address like '%Uttara%';




# IN , BETWEEN KEYWORD
select Emp_ID,Emp_Name,Emp_Salary from Employee where Emp_Age in(23,24);
select Emp_Name,Emp_Address from Employee where Emp_Name in(select Emp_Name from Employee where Emp_Age>24);
select Emp_Name,Emp_Salary,Emp_Address from Employee where Emp_Address in(Emp_Address like '%Dhaka');
select Emp_Name,Emp_Address,Emp_Age from Employee where Emp_Age in(23,24);
select * from Employee where Emp_Age in (23,25);
select * from Employee where Emp_Age not in (23,25);
select Emp_Name,Emp_Age,Emp_Salary from Employee where Emp_Age between 23 and 26;



# NOT IN
select Emp_Name,Emp_Address,Emp_Age,round(Emp_Salary) from Employee where Emp_Age not in(23,24,25) order by Emp_Age;
select Emp_Name,Emp_Age,Emp_Address from Employee where Emp_Address not in(select Emp_Address from Employee where Emp_Address like '%Dhaka');
select Emp_Name,Emp_Address,Emp_Age from Employee where Emp_Age not in(23,24);



# EQUAL TO(=), GREATER THAN(>), LESS THAN(<)
select * from Employee where Emp_name='Mohaimen';
select * from Employee where Emp_ID=4;
select * from Employee where Emp_Address='Address, Tongi, Gazipur';
select Emp_Name,Emp_Address,Emp_Salary from Employee where Emp_Gender='Female';
select Emp_Name,Emp_Age from Employee where Emp_Age>23;
select Emp_Name,Emp_Age from Employee where length(Emp_Name)>15;
select Emp_Name,round(Emp_Salary),Emp_Age,length(Emp_Address) from Employee where length(Emp_Address)<15;



# BETWEEN
select * from Employee where Emp_Age between 22 and 24;
select * from Employee where Emp_Age between 24 and 25;



# NOT EQUAL TO(<> , !=)
select * from Employee where Emp_Age>24;
select * from Employee where Emp_Age<25;
select * from Employee where Emp_Age>=23;
select * from Employee where Emp_Age<=22;
select Emp_Name,Emp_Age from Employee where Emp_Age <>23;
select Emp_Name,Emp_Address,round(Emp_Salary) from Employee where Emp_Gender <>'Male';
select Emp_Name,Emp_Address,round(Emp_Salary) from Employee where Emp_Gender !='Female';
select * from Employee where not Emp_Age=24;
select * from Employee where not Emp_Age=24 and not Emp_Age=25;
select * from Employee where not Emp_Age between 23 and 25;
select * from Employee where not Emp_Age in (23,25);



# ORDER BY, GROUP BY
select * from Employee order by Emp_Age;
select * from Employee where Emp_Salary >34000 order by Emp_Name;
select Emp_Name,Emp_Age,Emp_Salary,Emp_Salary from Employee where Emp_Address like '%Dhaka' order by Emp_Name;
select Emp_Name,Emp_Age,Emp_Gender,round(Emp_Salary) from Employee where Emp_Age>23 order by Emp_Gender asc;
select Emp_Name,Emp_Age,Emp_Gender,round(Emp_Salary) from Employee where Emp_Age>23 order by Emp_Salary desc;
select Emp_Name,Emp_Address,Order_Date,round(Order_TotalPrice) from Employee join ItemOrder on Employee.Emp_ID=ItemOrder.Emp_ID order by Order_Date;
select Emp_Name,Emp_Address,Order_Date,round(Order_TotalPrice) from Employee join ItemOrder on Employee.Emp_ID=ItemOrder.Emp_ID order by Order_Date desc;

select Emp_Address from Employee group by Emp_Address;
select Emp_Age from Employee group by Emp_Age order by Emp_Age;
select Emp_ID,Emp_Age from Employee group by Emp_ID,Emp_Age;
select Emp_Age,count(Emp_Age) as Total_Employee from Employee group by Emp_Age;
select Emp_Age from Employee group by Emp_Age having Emp_Age=24;
select Emp_Address from Employee group by Emp_Address having Emp_Address like '%Dhaka' order by Emp_Address;




# LIKE
select Emp_Name from Employee where Emp_Name like '%n';
select * from Employee where Emp_Name like 'M%'; # started with M
select * from Employee where Emp_Name like '%M%'; # M in any position
select * from Employee where Emp_Name like '_oh%'; # second or third position 'oh'
select * from Employee where Emp_Name like 's_%_%'; # started s and atleast 3 character
select * from Employee where Emp_Name like '%n'; # end with n
select * from Employee where Emp_Name like '_o%n'; # o in second position and ends with n
select * from Employee where Emp_Name like 'M%n'; # start with M and ends with n
select * from Employee where Emp_Address like '%Dhaka';




# NOT LIKE
select Emp_Name,round(Emp_Salary) from Employee where Emp_Salary not like'%30%';
select Emp_Name,Emp_Address,round(Emp_Salary) from Employee where Emp_Address not like '%Dhaka';


# REGEXP
select * from Employee where Emp_Address regexp('Dhaka');
select * from Employee where Emp_Address regexp('Gazipur');
select Emp_Name,Emp_Address,Emp_Salary from Employee where Emp_Address regexp '^[Uttara]';
select Emp_Name,Emp_Address,Emp_Salary from Employee where Emp_Address regexp '^[^Uttara]';
select * from Employee where Emp_Address regexp 'ra*';  #containing characters 'ra'
select * from Employee where Emp_Address regexp 'ra+';  #containing characters 'ra'
select * from Employee where Emp_Address regexp 'ra?';
select * from Employee where Emp_Salary regexp '34.';  #starting with characters '34'
select * from Employee where Emp_Address regexp '[abcd]';
select * from Employee where Emp_Address regexp '[A-Z]';
select * from Employee where Emp_Address regexp '[a-z]';
select Emp_Name,Emp_Address,Emp_Salary from Employee where Emp_Address regexp '^[Utt]|^[Bog]';
select * from Employee where Emp_Address regexp '[[:<:]]for';  #ERROR
select * from Employee where Emp_Address regexp '[:ra:]';




# BUILT-IN FUNCTION
select ucase(Emp_Name) from Employee;
select lcase(Emp_Name) from Employee;
select ucase(Emp_Name),lcase(Emp_Address),round(Emp_Salary) from Employee;
select Emp_Salary div Emp_Age from Employee;
select Emp_Salary / Emp_Age from Employee;
select round(Emp_Salary / Emp_Age,2) from Employee;
select Emp_Salary - Emp_Age from Employee;
select Emp_Salary + Emp_Age from Employee;
select Emp_Salary * Emp_Age from Employee;
select mod(Emp_Salary, Emp_Age) from Employee;
select Emp_Salary % Emp_Age from Employee;
select ceil(Emp_Salary/Emp_Age) from Employee;
select floor(Emp_Salary/Emp_Age) from Employee;
SELECT RAND() AS random_result;




# STORED FUNCTION
delimiter $
create function TaxCalculation(salary decimal(10,5))
returns decimal(10,2)
deterministic
Begin
	declare x decimal;
    if salary>30000 and salary<34999 then
		set x=(Salary*5)/100;
	elseif salary>35000 and salary<39999 then
		set x=(Salary*10)/100;
    else
		set x=salary;
    end if;
    return x;
end$

select Emp_Name,Emp_Address,Emp_Salary,TaxCalculation(Emp_Salary) as Tax from Employee;




# AGGREGATE FUNCTION
select Emp_Age,count(Emp_Age) from Employee group by Emp_Age;
select Emp_Gender,count(Emp_Gender) from Employee group by Emp_Gender;
select count(Emp_ID) from Employee where Emp_Gender='Female';

select Emp_Age from Employee group by Emp_Age order by Emp_Age;
select distinct(Emp_Age) from Employee order by Emp_Age;
select min(Emp_Salary) from Employee;
select max(Emp_Salary) from Employee;
select Emp_Salary from Employee order by Emp_Salary desc;
select round(Emp_Salary) from Employee order by Emp_Salary desc limit 2,1;
select sum(Emp_Salary) from Employee;
select round(avg(Emp_Salary)) from Employee;



# NOT NULL, IS NULL
select * from Employee where Emp_Salary is null;
select * from Employee where Emp_Salary is not null;


# BOOLEAN RESULT
select null=null;
select null>null;
select 5=5;
select 5=6;
select 5>6;
select 6<7;
select 5 is null;
select 5 is not null;
select null is null;
select last_insert_ID();



# RENAME TABLE
rename table Employee to Emp;
show columns from Employee;



# LIMIT & OFFSET
select * from Employee limit 5;
select * from Employee limit 5,1;



# SUB QUERY
select Emp_Name,Emp_Address,Emp_Age,Emp_Salary from Employee where Emp_Salary=(select min(Emp_Salary) from Employee);
select Emp_Name,Emp_Address,Emp_Age,Emp_Salary from Employee where Emp_Salary=(select min(Emp_Salary) from Employee where Emp_Address like '%Dhaka');
select Emp_Name,Emp_Gender,Emp_Address,Emp_Salary from Employee where Emp_Age in(select Emp_Age where Emp_Address like '%Uttara%');
select Emp_ID,Emp_Name,Emp_Age,Emp_Gender,Emp_Address from Employee where Emp_ID=(select Emp_ID from ItemOrder where Order_TotalPrice=(select max(Order_TotalPrice) from ItemOrder));




# CROSS JOIN
select Emp_Name,Emp_Address from Employee cross join Department;
select * from Department cross join Employee;
select * from Employee cross join Department;


# INNER JOIN
select Dept_Name,Emp_Name,Emp_Salary from Employee,Department where Employee.Dept_ID=Department.Dept_ID;
select Emp_Name from Employee,ItemOrder where Employee.Emp_ID=ItemOrder.Emp_ID;
select Emp_Name,Dept_Name,Emp_Salary from Employee e INNER JOIN Department d on e.Dept_ID=d.Dept_ID;



# LEFT JOIN
select Emp_Name,Rent_Date,Rent_TotalDays,Rent_TotalPrice from Employee e Left join Rent r on e.Emp_ID=r.Emp_ID;



# RIGHT JOIN
select Emp_Name,Rent_Date,Rent_TotalDays,Rent_TotalPrice from Employee e right join Rent r on e.Emp_ID=r.Emp_ID;
select Emp_Name,Dept_Name from Employee e right join Department d on e.Dept_ID=d.Dept_ID;



# JOIN
SELECT Emp_Name , Emp_Address , Emp_Salary FROM Employee AS e LEFT JOIN ItemOrder AS o USING (Emp_ID);
SELECT Emp_Name , Emp_Address , Emp_Salary FROM Employee AS e JOIN ItemOrder AS o USING (Emp_ID);



# SELF JOIN
SELECT e.Emp_Name as Employee_Name, e.Emp_Address as Address FROM Employee e, Employee b
WHERE e.Emp_ID <> b.Emp_ID
AND e.Emp_Address = b.Emp_Address
ORDER BY e.Emp_Address;



# UNION
select Emp_ID from Employee union select Emp_ID from Rent;
select Emp_ID from Employee union all select Emp_ID from Rent;



# VIEW
create view EmployeeB as select Emp_ID,Emp_Name,Emp_Address,round(Emp_Salary,2) from Employee;
select * from EmployeeB;
show create view EmployeeB;

create view Employee_Item_Order as 
select Dept_Name,Emp_Name,Emp_Gender,Emp_Address,round(Emp_Salary),Order_Date,round(Order_TotalPrice,2)
from Employee e LEFT JOIN Department d on e.Dept_ID=d.Dept_ID INNER JOIN ItemOrder i on e.Emp_ID=i.Emp_ID order by e.Emp_ID;
select * from Employee_Item_Order;

create view EmployeeSalary  as (select Emp_ID,Emp_Name,Emp_Salary from Employee);
select * from EmployeeSalary;

create view EmployeeInfo(ID,Name,Age,Gender,Email) as (select Emp_ID,Emp_Name,Emp_Age,Emp_Gender,Emp_Email from Employee);
select * from EmployeeInfo;



# EXISTS
SELECT Emp_Name,Emp_Age,Emp_Salary
FROM Employee
WHERE EXISTS (SELECT Order_TotalPrice FROM ItemOrder WHERE ItemOrder.Emp_ID = Employee.Emp_ID AND Order_TotalPrice < 1500);
























