-- 1.Display the Department id, name and id and the name of its manager.

SELECT 
    Dnum, 
    Dname,
    Concat(Fname,' ',Lname) AS manger_name 
FROM
    Department  d
Left join 
    Employees e on e.SSN = d.MGRSSN

-- Data Validation 

SELECT Dnum,
       Dname,
       MGRSSN,
       Concat(Fname,' ',Lname) AS manger_name 
FROM
    Department  d
Left join 
    Employees e on e.SSN = d.MGRSSN



 
==============================================================



-- 2.Display the name of the departments and the name of the projects under its control.

SELECT  
    Dname,
    Pname 
FROM
    Department  d
Left join 
    Project p on p.Dnum = d.Dnum



=====================================================================



-- 3.Display the full data about all the dependence associated with the
-- name of the employee they depend on him/her.

Select 
    d.ESSN,
    d.Dependent_name,
    d.Bdate,
    d.SEX,
    Concat(Fname, ' ', Lname) As Employee 
        
from
    Dependent d
left join
    Employees e on e.SSN = d.ESSN




=========================================================================




-- 4.Display (Using Union Function)
-- a. The name and the gender of the dependence that's gender is Female and depending on Female Employee.

Select 
  Dependent_name, 
  d.Sex, 
  'Dependent' AS Type 
from 
  Dependent d 
  left join Employees e on e.SSN = d.ESSN 
WHere 
  d.sex = 'F' 
and
  e.sex = 'F' 

Union 

Select 
  Fname, 
  sex, 
  'employees' AS Type 
from 
  employees 
WHere 
  sex = 'F'







-- b. And the male dependence that depends on Male Employee.

Select 
  Dependent_name, 
  d.Sex, 
  'Dependent' AS Type 
from 
  Dependent d 
  left join Employees e on e.SSN = d.ESSN 
WHere 
  d.sex = 'M' 
  and e.sex = 'M' 

Union 

Select 
  Fname, 
  sex, 
  'employees' AS Type 
from 
  employees 
WHere 
  sex = 'M'





================================================================================



-- 5.Display the Id, name and location of the projects in Cairo or Alex city.

SELECT 
    Pnumber,
    Pname,
    Plocation
From 
    Project
Where 
    City = 'Cairo'
OR
    City = 'Alex'



===========================================================================================================



--6.Display the Projects full data of the projects with a name starts with "a" letter.

Select *
From    
    Project
Where
    Pname like 'a%'




===================================================================================



--7.display all the employees in department 30 whose salary from 1000 to 2000 LE monthly

Select *
From 
    Employees
Where 
    Dno = 30 
And 
    Salary Between 1000 And 2000  



===============================================================================================



-- 8.Retrieve the names of all employees in department 10 who works more than or equal 10 hours per week on "AL Rabwah" project.

Select CONCAT(Fname,' ', Lname) As Employees
From 
    Employees e
Left join 
    Works_for w  on  w.ESSN = e.SSN 
Left join 
    Project p on  P.Pnumber = w.Pno
Where 
    w.Hours >= 10 And Pname = 'AL Rabwah'



====================================================================================================



--9.Find the names of the employees who directly supervised with Kamel Mohamed.

Select CONCAT(e.Fname,' ', e.Lname) As Employees
From 
    Employees e
join 
    Employees a on a.SSN = e.Superssn
Where 
    a.Fname = 'Kamel'



-- Another solution 



With SUP_Kamel as 
(
Select 
    SSN 
From 
    Employees
Where 
    Fname = 'Kamel' 
And 
    Lname = 'Mohamed'
)
Select 
    CONCAT(Fname,' ', Lname) As Employees 
From
    Employees e
Cross join 
    SUP_Kamel  s 
Where
    e.Superssn = s.SSN



===================================================================================================




--10.For each project, list the project name and the total hours per week (for all employees) spent on that project.

Select 
    Pname,SUM(Hours) AS Project_Hours 
From 
    Project p
Left Join 
    Works_for w on p.Pnumber = w.Pno 
Group by 
    Pname



====================================================================================================


-- 12.Display the data of the department which has the smallest employee ID over all 

Select TOP 1 * 
From 
    Department 
Order by 
    MGRSSN 


=========================================================================================================



--13.for each department, retrieve the department name and the maximum, minimum and average salary of its employees.
      
Select Dname, AVG(Salary) AS Avg_Salary, Max(Salary) AS Max_Salary, Min(Salary) AS Min_Salary
From 
    Department d 
Left join 
    Employees e on e.Dno   = d.Dnum
Group by 
     Dname

-- data valdiation 

Select Dname,Fname , Salary
From 
    Department d 
Left join 
    Employees e on e.Dno   = d.Dnum
    

================================================================================================
   



Select * from Dependent
Select * from Employees

--14.List the last name of all managers who have no dependents.


SELECT e.Lname
FROM Employees e
LEFT JOIN Dependent d ON e.SSN = d.ESSN
WHERE d.ESSN IS NULL
AND e.SSN IN (SELECT Superssn FROM Employees WHERE Superssn IS NOT NULL)




===============================================================================================




  
--15.For each department
-- if its average salary is less than the average salary of all employees
-- display its number, name and number of its employees.
with Emp_Avg_Salary as
(
  Select 
    AVG(Salary) AS AVG_Salary 
  From 
    Employees
), 

Dep_Avg_Salary as 
(
  Select 
    Dnum, 
    Dname, 
    AVG(Salary) As Avg_Dep_Salary, 
    Count(SSN) AS Dep_Num 
  From 
    Department d 
    Left join Employees e on e.Dno = d.Dnum 
  Group by 
    Dnum, 
    Dname
) 

select 
  d.Dnum, 
  d.Dname, 
  d.Avg_Dep_Salary, 
  d.Dep_Num 
From 
  Dep_Avg_Salary d 
Cross join 
  Emp_Avg_Salary e 
Where 
  d.AVg_Dep_Salary < e.AVG_Salary




 ======================================================================================    







--16.Retrieve a list of employees and the projects they are working
-- on ordered by department and within each department, ordered alphabetically by last name, first name.

Select 
  Concat(Fname, ' ', Lname) AS Employee, 
  Pname 
From 
  Employees e 
  Left join Department d on e.Dno = d.Dnum 
  Left join Project p on p.Dnum = d.Dnum 
Order by 
  d.Dname, 
  Lname, 
  Fname





======================================================================================

--17.For each project located in Cairo City , find the project number, 
--the controlling department name ,the department manager last name ,address and birthdate.

Select 
  Pnumber, 
  Dname, 
  Lname, 
  Address, 
  BDate 
From 
  Project p 
  left join Department d on p.Dnum = d.Dnum 
  left join Employees e on e.ssn = d.MGRSSN 
Where 
  City = 'Cairo'


