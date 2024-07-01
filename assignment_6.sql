
SET STATISTICS IO ON
SET STATISTICS TIME ON

USE [Students];
Select co.*
from CourseOfferings co
LEFT JOIN CourseEnrollments ce on 
co.CourseOfferingID =ce.CourseOfferingID
WHERE co.TermCode = 'SP2016';

