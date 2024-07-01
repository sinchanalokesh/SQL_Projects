CREATE DATABASE Assignment_51;
GO

CREATE TABLE Student (
    Rno INT PRIMARY KEY NOT NULL,
    Marks VARCHAR(100) NOT NULL,
    Name VARCHAR(100)
);
INSERT INTO Student (Rno, Marks, Name) VALUES
(1, '60', 'PRIYA'),
(2, '70', 'RAHUL'),
(3, '80', 'SHREYA'),
(4, '90', 'NEHA'),
(5, '85', 'ANANYA'),
(6, '75', 'ANUSHA'),
(7, '95', 'AYUSH');

select * from Student;

CREATE TABLE Subject (
    Rno INT PRIMARY KEY NOT NULL,
    Subject1 VARCHAR(100) NOT NULL,
    Subject2 VARCHAR(100) NOT NULL,
    Subject3 VARCHAR(100) NOT NULL
);


select * from Subject;

CREATE FUNCTION GetStudent (@Rno INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @Name VARCHAR(100);
    SELECT @Name = Name FROM Student WHERE Rno = @Rno;
    RETURN @Name;
END;

CREATE FUNCTION GetStudentsByMarks (@Marks VARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT Name FROM Student WHERE Marks = @Marks
);


CREATE FUNCTION GetAvg (@Name VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @AvgMarks DECIMAL(5,2);
    SELECT @AvgMarks = AVG(CONVERT(DECIMAL, Marks)) FROM Student WHERE Name = @Name;
    RETURN CONVERT(VARCHAR(100), @AvgMarks);
END;










