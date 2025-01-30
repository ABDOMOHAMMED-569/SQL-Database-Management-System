-- Data Manipulating Language

-- Insert your personal data to the employee table as a new employee in
-- department number 30, SSN = 102672, Superssn = 112233.

Insert into Employees(Fname,Lname ,Bdate,Address,SEX,Salary,SSN,Dno,Superssn)  
Values('Abdelrahman','Mohammed','2003-09-29','Sharqia','M',2000,102672,30,112233)


======================================================================================

--Insert another employee with, personal data your friend as new employee
--in department number 30, SSN = 102660, but don’t enter any
--value for salary or supervisor number to him.

Insert into Employees(Fname,Lname ,Bdate,Address,SEX,Salary,SSN)  
Values('Mohammed','Khalied','2002-10-09','Sharqia','M',102660)

=======================================================================================

--In the department table insert new department called "DEPT IT", 
--with id 100, employee with SSN = 112233 as a manager for this department.
--The start date for this manager is '1-11-2006'

Insert Into Department(DNum,Dname,MGRStart_Date,MGRSSN)
VALUES(100,'DEPT IT','1-11-2006',112233) 

========================================================================================

--Do what is required if you know that: Mrs.Noha Mohamed(SSN=968574)
--moved to be the manager of the new department (id = 100)
--and they give you (use your SSN from question1) her position (Dept. 20 manager) 

-- a. First try to update her record in the department table

UPDATE department
SET MGRSSN = 669955
WHERE Dname = 'DEPT IT' 

UPDATE Employees
SET Dno = 100
WHERE SSN =968574 


--b. Update your record to be department 20 manager.

UPDATE Employees
SET Dno = 20
WHERE SSN =102672 


--c.Update your friend data (entered in question2) 
--to be in your teamwork (supervised by you)

UPDATE Employees
SET Superssn = 102672
WHERE SSN =102660 

SElect * from Employees 

===================================================================================================

--5.Unfortunately, the company ended the contract with Mr. Kamel Mohamed (SSN=223344)
-- so try to delete his data from your database in case you 
--know that your friend will be temporarily in his position.


-- Replacing the MGRSSN from Mr.Kamal to My freind Because the conflict in foreign key from department

UPDATE department
SET MGRSSN = 102672
WHERE MGRSSN = 223344


-- Replacing the ESSN from Mr.Kamal to My freind Because the conflict in foreign key from Dependent

UPDATE Dependent
SET ESSN = 102672
WHERE ESSN = 223344


-- Replacing the ESSN from Mr.Kamal to My freind Because the conflict in foreign key from Works for


UPDATE Works_for
SET ESSN = 102672
WHERE ESSN = 223344



-- Replacing the Superssn from Mr.Kamal to My freind Because the conflict in foreign key from Employees


UPDATE Employees
SET Superssn = 102660
WHERE Superssn = 223344


-- Delete Mr. Kamel Mohamed from database 

Delete from Employees 
Where SSN=223344

Select * from Employees



-- i don't need any hint Sorry (:

=========================================================================================

-- 6.And your salary has been upgraded by 20 percent of its last value.


UPDATE Employees
SET Salary = Salary * 1.20
WHERE SSN = 102672

Select * FROM employees





