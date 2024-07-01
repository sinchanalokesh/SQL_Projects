  create database Sample1
     USE Sample1;
	 
	  CREATE TABLE department
	  ( 
	  dept_no varchar(255)NULL,
      dept_name varchar(255)NULL,
	  location varchar(255)NULL
	  )  
	  
	  CREATE TABLE employee
	  (  
	  emp_no int NULL,
	  emp_fname varchar(255)NULL,
	  emp_lname varchar(255)NULL,
	  dept_no varchar(255)NULL 
	  )
	  
	  CREATE TABLE project 
	  (  
	  project_no varchar(255)NULL,
	  project_name varchar(255)NULL, 
	  budget int NULL
	  ) 
	  
	  
	  CREATE TABLE works_on 
	  ( 
	  emp_no int NULL,
	  project_no varchar(255)NULL, 
	  job varchar(255)NULL,
	  enter_date date NULL
	  )
	  
	  INSERT into department(dept_no,dept_name,location)VALUES
	  ('d1','Research','Delhi'),
	  ('d2','Accounting','Mumbai'),
	  ('d3','Marketing','Bangalore');

	  select * from department;

	  INSERT into employee(emp_no,emp_fname,emp_lname,dept_no)   VALUES
	  (10001,'Matthew','Smith','d3'),
	  (10002,'Elsa','Sea','d3'),
	  (10003,'Albert','Lawless','d1'),
	  (10004,'Gianna','Adams','d2'),
	  (10005,'Henry','Lewis','d2'),
	  (10006,'Joh','Bertoni','d2'),
	  (10007,'Issac','Barrimore','d1');

	  select * from employee;

	  INSERT into project(project_no,project_name,budget)   VALUES
	  ('p1','Apollo',120000),
	  ('p2','Lexus',95000),
	  ('p3','ELC',186500),
	  ('p2','Moo',NULL);

	  select * from project

	  INSERT into works_on(emp_no,project_no,job,enter_date )  VALUES  
	  (
	  10002,'P1','Analyst','2016-10-01'),
	  (10002,'P3','Manager','2018-01-01'),
	  (10001,'P2','Clerk','2017-02-15'),
	  (10003,'P2','NULL','2017-06-01'),
	  (10004,'P2','NULL','2016-12-15'),
	  (10005,'P3','Analyst','2017-10-15'),
	  (10006,'P1','Manager','2017-04-15'),
	  (10007,'P1','NULL','2017-08-01'),
	  (10007,'P2','Clerk','2017-02-01'),
	  (10006,'P3','Clerk','2016-11-15'),
	  (10004,'P1','Clerk','2017-01-04');
	  
	  select * from works_on

	  create login alpha
	  with password = ' qwertyuiop', Default_database = sample;

	  create login beta 
	 with password = ' asdfghjkl', Default_database = sample;

	  create login gamma 
	 with password = ' zxcvbnm', Default_database = sample;

	 select * from master.sys.sql_logins
	 where default_database_name = 'sample';

	 create user s_alpha for login alpha;

     create user s_beta for login beta;

	 create user s_gamma for login gamma;

	 create role admins ;
	 
	 alter role admins add member s_alpha;

	 alter role admins add member s_beta;

	 alter role admins add member s_gamma;

	 --display info for this role and its memebers
	 select dp.name as rolename , us.name  
	 from sys.sysusers us right 
	 join sys.database_role_members rm on us.uid=rm.member_principal_id
	 join sys.database_principals dp on rm.role_principal_id = dp.principal_id;

	 grant create table to s_beta ;
	 grant create table to s_alpha ;


	 grant update (emp_fname , emp_lname) on employee to s_gamma;

	 grant update (emp_fname , emp_lname) on employee to s_beta;

	 grant update (emp_fname , emp_lname) on employee to s_alpha;


	 grant insert on project to admins;

	 revoke select on schema :: dbo to s_beta ;

	 deny insert on project to s_alpha;

	 execute as user = 's_alpha';


	 select * from fn_my_permissions ( 'department', 'object');

	 select * from fn_my_permissions ( 'employee', 'object');

	 select * from fn_my_permissions ( 'project', 'object');

	 select * from fn_my_permissions ( 'work_on', 'object');

	 select princ.name
	 '      princ.type_desc
	 '      perm.permission_name
	 '      perm.state_desc
	 '      perm.class_desc
	 '      object_name(perm.major_id)
	 from sys.database_principals princ
	 left join 
	 sys.database_permissions perm
	 on perm.grantee_principal_id = princ.principal_id
	 where name = 's_alpha';



	