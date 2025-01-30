-- 1.Display all the employees Data.

Select * 
FROM employees


==================================================================================


--2.Display the employee First name, last name, Salary and Department number.

Select Fname, Lname, Salary, Dno 
FROM employees


===================================================================================

--3.Display all the projects names, locations and the department which is responsible about it.

SELECT Pname, Plocation, Dname 
FROM 
    Project p  
left join
    Department d on   d.Dnum = p.Dnum

====================================================================================

--4.If you know that the company policy is to pay an annual commission for each
--employee with specific percent equals 10% of his/her annual salary.
--Display each employee full name and his annual commission in an ANNUAL COMM column (alias).


SELECT Concat(Fname,' ',Lname) AS Full_Name , Salary*12*0.1 AS ANNUAL_COMM 
FROM Employees

====================================================================================

--5.Display the employees Id, name who earns more than 1000 LE monthly.


SELECT SSN, Concat(Fname,' ',Lname) AS Full_Name , Salary AS Monthly_Salary 
FROM Employees
Where Salary > 1000
ORDER BY Salary

=============================================================================


--6.Display the employees Id, name who earns more than 10000 LE annually.


SELECT SSN, Concat(Fname,' ',Lname) AS Full_Name , Salary*12 AS annually_Salary 
FROM Employees
Where Salary*12 > 10000
ORDER BY annually_Salary

=========================================================================================

--7.Display the names and salaries of the female employees 

SELECT Concat(Fname,' ',Lname) AS Full_Name , Salary
FROM Employees
Where Sex = 'F'


=====================================================================================

--8.Display each department id, name which managed by a manager with id equals 968574.

SELECT Dnum , Dname 
FROM Department 
Where MGRSSN = 968574 


===============================================================================================

--9.Display the IDs, names and locations of the pojects which controlled with department 10.

SELECT Pnumber, Pname, Plocation 
FROM Project
Where Dnum = 10







