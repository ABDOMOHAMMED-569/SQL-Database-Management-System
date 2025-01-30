-- Table Employees

CREATE Table Employees(
    SSN INT PRIMARY KEY ,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    BDate Date , 
    Address VARCHAR(50),
    Sex VARCHAR(1),
    Salary INT,
    Superssn INT,
    Dno INT,
)


-- Table Department

CREATE Table Department(
    DNum INT PRIMARY KEY ,
    Dname VARCHAR(50),
    MGRStart_Date Date , 
    MGRSSN INT,
)



-- Table Dependent

CREATE Table Dependent(
    ESSN INT ,
    Dependent_name VARCHAR(50),
    Bdate Date , 
    Sex VARCHAR(1)
)


-- Table Project

CREATE Table Project(
    Pnumber INT PRIMARY KEY ,
    Pname VARCHAR(50),
    Plocation VARCHAR(50),
    City VARCHAR(50),
    Dnum INT
)


-- Table Works for

CREATE Table Works_for(
    ESSN INT ,
    Pno INT,
    Hours INT
)





--Add an email column to the 
--employee table and then fill it with random data.

ALTER TABLE Employees 
ADD email VARCHAR(50);

