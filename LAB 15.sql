USE CSE_3A_182
--Part – A: 
--Create below table with following constraints 
--1. Do not allow SPI more than 10      
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified. 
--4. Try to update SPI of Raju from 8.80 to 12. 
--5. Try to update Bklog of Neha from 0 to -1

CREATE TABLE STU_MASTER(
   RNO INT PRIMARY KEY,
   NAME VARCHAR(25),
   BRANCH VARCHAR(5) DEFAULT 'GENERAL',
   SPI DECIMAL(3,2) CHECK(SPI<=10),
   BKLOG INT CHECK (BKLOG>=0)
);

DROP TABLE STU_MASTER


INSERT INTO STU_MASTER(RNO,NAME,BRANCH,SPI,BKLOG) VALUES(101,'Raju','CE',8.80,0),
                                                        (102,'Amit','CE',2.20,3),
                                                        (103,'Sanjay','ME',1.50,6),
                                                        (104,'Neha','EC',7.65,0),
                                                        (105,'Meera','EE',5.52,2),
                                                        (106,'Mahesh','',4.50,3);
  
  
  UPDATE STU_MASTER
  SET SPI=12
  WHERE NAME='RAJU'


  SELECT * FROM STU_MASTER


  UPDATE STU_MASTER
  SET BKLOG=-1
  WHERE NAME='NEHA'

--Part – B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_details(Did, Dname) 
--City_details(Cid, Cname) 

CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),      
    Experience INT CHECK (Experience >= 0),      
    FOREIGN KEY (Did) REFERENCES Dept_details(Did),
    FOREIGN KEY (Cid) REFERENCES City_details(Cid)
);

DROP TABLE EMP_DETAILS
DROP TABLE CITY_DETAILS
DROP TABLE DEPT_DETAILS

INSERT INTO Emp_details VALUES 
(102, 'TestUser', 1, 1, 10000, -2);

INSERT INTO Emp_details VALUES 
(106, 'TestUser', 1, 1, -10000, 2);

--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 


CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Cid INT NOT NULL,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Sid INT NOT NULL,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT NOT NULL,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT NOT NULL,
    Cid INT NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);

--2. Insert 5 records in each table. 
INSERT INTO Country VALUES
(1, 'India'),
(2, 'USA'),
(3, 'UK'),
(4, 'Canada'),
(5, 'Australia');

INSERT INTO State VALUES
(1, 'Gujarat', 1),
(2, 'Maharashtra', 1),
(3, 'California', 2),
(4, 'Ontario', 4),
(5, 'New South Wales', 5);

INSERT INTO District VALUES
(1, 'Ahmedabad', 1),
(2, 'Pune', 2),
(3, 'Los Angeles County', 3),
(4, 'Toronto District', 4),
(5, 'Sydney District', 5);

INSERT INTO City_info VALUES
(101, 'Ahmedabad City', 1),
(102, 'Pune City', 2),
(103, 'Los Angeles', 3),
(104, 'Toronto', 4),
(105, 'Sydney', 5);


INSERT INTO Dept_info VALUES
(201, 'HR'),
(202, 'IT'),
(203, 'Finance'),
(204, 'Marketing'),
(205, 'Sales');

INSERT INTO Emp_info VALUES
(301, 'Rajesh', 201, 101, 50000, 5),
(302, 'Amit', 202, 102, 60000, 4),
(303, 'John', 203, 103, 75000, 6),
(304, 'Maria', 204, 104, 80000, 7),
(305, 'David', 205, 105, 90000, 8);




INSERT INTO Emp_info VALUES (306, 'InvalidEmp', 201, 101, -20000, 2);

INSERT INTO Emp_info VALUES (307, 'WrongEmp', 202, 102, 40000, -3);

INSERT INTO Emp_info VALUES (308, 'FakeEmp', 202, 999, 50000, 3);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 

