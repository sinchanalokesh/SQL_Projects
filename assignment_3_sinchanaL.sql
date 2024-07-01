create database employeedb;

use employeedb;

create table permanenetemployee
(
employeeID int primary key,
name varchar (50),
age int
);


create table contractemployee
(
employeeID int primary key,
name varchar (50),
age int
);


create table hiringemployee
(
employeeID int primary key,
name varchar (50),
age int
);


--insert values into parmanentemployee table
insert into permanenetemployee ( employeeID, name, age) values
('1001', 'ram','35'),
('1002', 'arya','28'),
('1003', 'abhi','36'),
('1004', 'shobha','38'),
('1005', 'priya','31'),
('1006', 'neha','29');


--insert values into contractemployee table
insert into contractemployee ( employeeID, name, age) values
('1011', 'pooja','25'),
('1012', 'sahil','28'),
('1013', 'rakhi','26'),
('1014', 'sonu','28'),
('1015', 'guru','33'),
('1016', 'rajesh','29');


--insert values into hiringemployee table
insert into hiringemployee ( employeeID, name, age) values
('1021', 'ram','45'),
('1022', 'arya','27'),
('1023', 'abhi','34'),
('1024', 'shobha','28'),
('1025', 'priya','21'),
('1026', 'neha','29');

select * from permanenetemployee;

select * from contractemployee;;

select * from hiringemployee;

--get records from permanentemployee where age is greater than max age od contractemployee
select * from permanenetemployee
where age > ( select max(age) from contractemployee);


--get record from permanentemployee where age is greater than atleast one value of contractemployee
select * from permanenetemployee 
where age > any (select age from contractemployee);


--adding contact detail of employees
create table employee_contact_details
(
employeeID int primary key ,
contactNumber varchar (20),
email varchar (50),
);

--insert values into employee_contact_details
insert into employee_contact_details values 
('1001' , '9876543210','ram@gmail.com'),
('1002', '9876543211','arya@gmail.com'),
('1003', '9876543212','abhi@gmail.com'),
('1004', '9876543213','shobha@gmail.com'),
('1005', '9876543214','priya@gmail.com'),
('1006', '9876543215','neha@gmail.com'),
('1011','9876543216', 'pooja@gmail.com'),
('1012','9876543217', 'sahil@gmail.com'),
('1013', '9876543218','rakhi@gmail.com'),
('1014','9876543219', 'sonu@gmail.com'),
('1015','9876543110', 'guru@gmail.com'),
('1016','9876543111', 'rajesh@gmail.com'),
('1021', '9876543112','ram1@gmail.com'),
('1022','9876543113', 'arya1@gmail.com'),
('1023','9876543141', 'abhi1@gmail.com'),
('1024','9876545111', 'shobha1@gmail.com'),
('1025','9856543111', 'priya1@gmail.com'),
('1026','9876525111', 'neha1@gmail.com');

select * from employee_contact_details;


--records of permanentemployee where atleast one record in employee_contact_details matching employeeID
select * from permanenetemployee
where employeeID in (select employeeID from employee_contact_details);


--combine all sort employees from list 
select * from (
select employeeID, name , age from permanenetemployee
union all
select  employeeID, name , age from contractemployee
union all 
select  employeeID, name , age from hiringemployee
)as combinedemployee 
order by name;




select * 
from permanenetemployee
where employeeID in ( select employeeID from contractemployee)
union 
select * 
from contractemployee
where employeeID in (select employeeID from hiringemployee)
order by name;

select p.employeeID , P.name, p.age, ECD.employeeID ,  ECD.contactNumber 
from permanenetemployee as p join employee_contact_details as ECD on p.employeeID = ECD.employeeID;