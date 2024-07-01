use Sample;

create table department (
dept_no varchar (255),
dept_name varchar (255),
location varchar (255),
);

select * from department;

insert into department (dept_no, dept_name, location)  values
('d1','research', 'delhi'),
('d2','accounting', 'mumbai'),
('d3','marketing', 'banglore');

select * from department;


create table employee 
(

emp_no int, 
emp_fname varchar(255),
emp_lname varchar (255),
dept_no varchar (255)
);

insert into employee (emp_no, emp_fname,emp_lname, dept_no) values
('10004','gianna','adams','d2'),
('10005','henry','lewis','d2'),
('10006','john','bertoni','d2'),
('10007','issac','barrimore','d1');

select * from employee;

insert into employee (emp_no, emp_fname,emp_lname, dept_no) values
('10008','matthew','smith','d3'),
('10009','elsa','sean','d3'),
('10010','albert','lawless','d1');

select * from employee;


create table project (project_no varchar (255), project_name varchar (255), budget int);

insert into project ( project_no,project_name, budget) values
('p1', 'apollo','120000'),
('p2', 'lexus','95000'),
('p3', 'ELC','186500');


create table work_on (emp_no int, project_no varchar (255), job varchar (255),
enter_date date);

select * from work_on

insert into work_on (emp_no, project_no,job,enter_date) values 
('10004', 'p2', 'clerk', '2017-02-15'),
('10005', 'p1', 'analyst', '2016-10-01'),
('10005', 'p3', 'manager', '2018-01-01'),
('10006', 'p2', 'null', '2017-06-01'),
('10007', 'p2', 'null', '2017-12-15'),
('10007', 'p1', 'clerk', '2017-01-04'),
('10008', 'p3', 'analyst', '2017-10-15'),
('10009', 'p1', 'manager', '2017-04-15'),
('10009', 'p3', 'clerk', '2016-11-15'),
('10010', 'p2', 'clerk', '2017-02-01'),
('10010', 'p1', 'null', '2017-08-01');

select * from work_on;

USE sample;
GO
CREATE VIEW v_10_1
 AS SELECT *
FROM employee WHERE dept_no= 'd1';

select * from v_10_1;


USE sample;
GO
CREATE VIEW v_10_2
 AS SELECT project_no, project_name
FROM project;

select * from v_10_2;

USE sample;
GO
CREATE VIEW v_10_3
 AS SELECT emp_lname, emp_fname
 FROM employee,work_on
 WHERE work_on.emp_no = employee.emp_no
 AND enter_date BETWEEN '06/01/2017' AND '12/31/2017';

 select * from v_10_3;

 USE sample;
GO
CREATE VIEW v_10_4 (first, last)
 AS SELECT emp_fname, emp_lname
 FROM v_10_3;

 select * from v_10_4;


 USE sample;
SELECT *
 FROM v_10_1 WHERE emp_lname LIKE 'L%';


 USE sample;
GO
CREATE VIEW v_10_6
 AS SELECT project.*
 FROM project, employee, work_on
 WHERE project.project_no =work_on.project_no
 AND employee.emp_no = work_on.emp_no
 AND emp_lname = 'Smith';

  select * from v_10_6;


  USE sample;
GO
ALTER VIEW v_10_1
 AS SELECT *
 FROM employee WHERE dept_no IN ('d1', 'd2');

 select * from v_10_1;


 Use Sample;
INSERT INTO v_10_2 VALUES ('p2', 'Moon');

 select * from v_10_2;

