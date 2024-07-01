create database Assignment_5 ;

create table Movies
(
code int NOT NULL,
title varchar (50) NOT NULL,
rating varchar(50) NULL, 
constraint Movies_code_pk primary key(code)
);

create table Moviestheater 
(
code int NOT NULL,
name varchar (50) NOT NULL,
movie int NULL, 
constraint Moviestheater_code_pk primary key(code),
constraint Moviestheater_movie_fk foreign key (movie) references Movies(code)
);
select * from Movies
select * from Moviestheater

--INSERT VALUES TO MOVIES TABLE--
INSERT INTO Movies VALUES ('1','Citizen Kane','PG');
INSERT INTO Movies VALUES ('2','Singin in the Rain','G');
INSERT INTO Movies VALUES ('3','The Wizard of Oz','G');
INSERT INTO Movies VALUES ('4','The Quiet Man','NULL');
INSERT INTO Movies VALUES ('5','North by Northwest','NULL');
INSERT INTO Movies VALUES ('6','The Last Tango in Paris','NC-17');
INSERT INTO Movies VALUES ('7','Some Like it Hot','PG-13');
INSERT INTO Movies VALUES ('8','A Night at the Opera','NULL');
INSERT INTO Movies VALUES ('9','Citizen King','G');

select * from Movies

--INSERT VALUES TO MOVIESTHEATER TABLE--
INSERT INTO Moviestheater VALUES ('1',' Odeon','5');
INSERT INTO Moviestheater VALUES ('2','imperial','1');
INSERT INTO Moviestheater VALUES ('3',' Majestic', '0');
INSERT INTO Moviestheater VALUES ('4',' royale','6');
INSERT INTO Moviestheater VALUES ('6',' paraiso','3');
INSERT INTO Moviestheater VALUES ('8','nickelodeon','0');

select * from Moviestheater;

--SHOW TITLEE OFF ALL THE MOVIES FROM MOVIES AND MOVIESTHEATER TABLE--
select title from Movies
union 
select name as title from Moviestheater;

--SHOW ALL THE DATA FROM MOVIESTHEATER AND ADDITIONALLY THE DATA FROM MOVIES THAT BEING SHOWN IN THEATER--
select m.* , mt.name as threater_name  from moviestheater mt left join movies m on mt.code = m.code;

--SELECT ALL THE DATA FROM ALL MOVIES AND IF THAT MOVIES IS BEING SHOWN IN A THEATER , SHOW DATA FROM THEATER--
select m.* , mt.* 
from Movies m 
left join Moviestheater mt on m.code = mt.code;

--SHOW TITLES OF MOVIES NOT CURRENTLY BEING SHOWN IN THEATERS--
select m.title 
from Movies m 
left join Moviestheater mt on m.code = mt.code 
where mt.code is null;

--ADD UNRATED MOVIES "ONE,TWO, THREE" TO MOVIES TABLE--
insert into movies (code,title, rating)
values ('one,two,three', 'unrated');

--SET THE RATING OF ALL UNRATED MOVIES 'G'--
update movies
set rating ='G'
where rating is null;

--REMOVE MOVIE PROJECTING MOVIES RATED "NC-17"--
delete from movies 
where rating = ' NC-17';


SELECT * FROM Movies
SELECT * FROM Moviestheater