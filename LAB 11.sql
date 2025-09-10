USE CSE_3A_182

CREATE TABLE STU_INFO(
    ROLLNO INT PRIMARY KEY,
    NAME VARCHAR(20),
    BRANCH VARCHAR(10),
);

DROP TABLE STU_INFO

CREATE TABLE RESULT(
    ROLLNO INT FOREIGN KEY REFERENCES STU_INFO(ROLLNO),
    SPI DECIMAL(2,1)
);
DROP TABLE RESULT

CREATE TABLE EMPLOYE_MASTER(
    EMPLOYEE_NO VARCHAR(10),
    NAME VARCHAR(10),
    MANAGERNO VARCHAR(10)
);

INSERT INTO STU_INFO(ROLLNO,NAME,BRANCH) VALUES(101,'Raju','CE'),
                                               (102,'Amit','CE'),
                                               (103,'Sanjay','ME'),
                                               (104,'Neha','EC'),
                                               (105,'Meera','EE'),
                                               (106,'Mahesh','ME');
TRUNCATE TABLE STU_INFO
DROP TABLE RESULT

INSERT INTO RESULT(ROLLNO,SPI) VALUES(101,8.8),
                                     (102,9.2),
                                     (103,7.6),
                                     (104,8.2),
                                     (105,7.0),
                                     (107,8.9);

INSERT INTO EMPLOYE_MASTER(EMPLOYEE_NO,NAME,MANAGERNO) VALUES('E01','Tarun',NULL),
                                                              ('E02','Rohan','E02'),
                                                              ('E03','Priya ','E03'),
                                                              ('E04','Milan ','E04'),
                                                              ('E05','Jay','E05'),
                                                              ('E06','Jay ','E06');

SELECT * FROM STU_INFO;
SELECT *FROM RESULT;
SELECT * FROM EMPLOYE_MASTER;
--Part – A: 
--1. Combine information from student and result table using cross join or Cartesian product. 

     SELECT *
     FROM STUDENT
     CROSS JOIN RESULT

--2. Perform inner join on Student and Result tables. 

     SELECT *
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO = RESULT.ROLLNO

--3. Perform the left outer join on Student and Result tables.
    
     SELECT *
     FROM STU_INFO
     LEFT JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO

--4. Perform the right outer join on Student and Result tables. 

    SELECT *
    FROM STU_INFO
    RIGHT JOIN RESULT
    ON STU_INFO.ROLLNO=RESULT.ROLLNO

--5. Perform the full outer join on Student and Result tables.  
   
    SELECT *
    FROM STU_INFO 
    FULL JOIN RESULT
    ON STU_INFO.ROLLNO=RESULT.ROLLNO

--6. Display Rno, Name, Branch and SPI of all students. 

    SELECT STU_INFO.ROLLNO,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
    FROM STU_INFO
    JOIN RESULT
    ON STU_INFO.ROLLNO=RESULT.ROLLNO

--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
  
     SELECT STU_INFO.ROLLNO,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     WHERE STU_INFO.BRANCH='CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 

     SELECT STU_INFO.ROLLNO,STU_INFO.NAME,STU_INFO.BRANCH,RESULT.SPI
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     WHERE STU_INFO.BRANCH!='EC'

--9. Display average result of each branch.
   
     SELECT AVG(RESULT.SPI) AS AVG_SPI,STU_INFO.BRANCH
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     GROUP BY STU_INFO.BRANCH

--10. Display average result of CE and ME branch.
 
     SELECT AVG(RESULT.SPI) AS AVG_SPI,STU_INFO.BRANCH
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     WHERE STU_INFO.BRANCH='CE' OR STU_INFO.BRANCH='ME'
     GROUP BY STU_INFO.BRANCH

--11. Display Maximum and Minimum SPI of each branch. 
     
     SELECT MAX(RESULT.SPI) AS MAX_SPI,STU_INFO.BRANCH
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     GROUP BY STU_INFO.BRANCH

     SELECT MIN(RESULT.SPI) AS MIN_SPI,STU_INFO.BRANCH
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     GROUP BY STU_INFO.BRANCH

--12. Display branch wise student’s count in descending order.

     SELECT COUNT(STU_INFO.NAME) AS COUNT_NAME
     FROM STU_INFO
     JOIN RESULT
     ON STU_INFO.ROLLNO=RESULT.ROLLNO
     GROUP BY STU_INFO.BRANCH
     ORDER BY COUNT_NAME DESC


--Part – B: 
--1. Display average result of each branch and sort them in ascending order by SPI. 
 
    SELECT AVG(RESULT.SPI) AS AVG_RESULT,STU_INFO.BRANCH
    FROM STU_INFO
    JOIN RESULT
    ON STU_INFO.ROLLNO=RESULT.ROLLNO
    GROUP BY STU_INFO.BRANCH
    ORDER BY AVG_RESULT DESC

--2. Display highest SPI from each branch and sort them in descending order. 
 
     SELECT MAX(RESULT.SPI) AS MAX_SPI,STU_INFO.BRANCH
     FROM STU_INFO
    JOIN RESULT
    ON STU_INFO.ROLLNO=RESULT.ROLLNO
    GROUP BY STU_INFO.BRANCH
    ORDER BY MAX_SPI DESC

--Part – C: 
--1. Retrieve the names of employee along with their manager’s name from the Employee table.

   SELECT E.NAME AS EMPLOYE_MASTER,M.NAME AS MANAGER
   FROM EMPLOYE_MASTER E
   INNER JOIN EMPLOYE_MASTER M
   ON E.MANAGERNO=M.EMPLOYEE_NO