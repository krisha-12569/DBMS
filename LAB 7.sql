USE CSE_3A_182;

DROP TABLE EMP;

CREATE TABLE EMP(
    EID INT,
    ENAME VARCHAR(25),
    DEPARTMENT VARCHAR(25),
    SALARY DECIMAL(7,2),
    JOININGDATE DATETIME,
    CITY VARCHAR(25),
    GENDER VARCHAR(25),
);

INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY,GENDER) VALUES(101,'Rahul','Admin',56000,'1990-JAN-01','Rajkot','Male'),
                                                                           (102,'Hardik','IT ',18000,'1990-SEP-25','Ahmedabad','Male'),
                                                                           (103,'Bhavin','HR',25000,'1991-MAY-14','Baroda','Male'),
                                                                           (104,'Bhoomi','Admin',39000,'1991-FEB-08','Rajkot','Female'),
                                                                           (105,'Rohit','IT',17000,'1990-JULY-23','Jamnagar','Male'),
                                                                           (106,'Priya','IT',9000,'1990-OCT-18','Ahmedabad','Female'),
                                                                           (107,'Bhoomi','HR',34000,'1991-DEC-25','Rajkot','Female');


SELECT * FROM EMP;

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 

     SELECT MAX(SALARY) AS MAXIMUM,MIN(SALARY) AS MINIMUM
     FROM EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 

     SELECT SUM(SALARY) AS TOTAL_SAL,AVG(SALARY) AS AVERAGE_SAL
     FROM EMP

--3. Find total number of employees of EMPLOYEE table.

      SELECT COUNT(EID) AS TOTAL_EMP
      FROM EMP

--4. Find highest salary from Rajkot city. 

      SELECT MAX(SALARY) AS MAX_SAL
      FROM EMP
      WHERE CITY='RAJKOT'

--5. Give maximum salary from IT department. 
     
      SELECT MAX(SALARY) AS MAX_SAL
      FROM EMP
      WHERE DEPARTMENT='IT'
     
--6. Count employee whose joining date is after 8-feb-91. 

      SELECT COUNT(ENAME) AS EMP_NAME
      FROM EMP
      WHERE JOININGDATE> '1991-FEB-08'

--7. Display average salary of Admin department. 
      
      SELECT DEPARTMENT,AVG(SALARY) AS AVG_DEP
      FROM EMP
      WHERE DEPARTMENT='ADMIN'
      GROUP BY DEPARTMENT

--8. Display total salary of HR department. 

      SELECT SUM(SALARY) AS Sum_SAL,DEPARTMENT
      FROM EMP
      WHERE DEPARTMENT='HR'
      GROUP BY DEPARTMENT

--9. Count total number of cities of employee without duplication.

     SELECT COUNT(DISTINCT CITY) AS SUM_CITY,CITY
     FROM EMP
     GROUP BY CITY

--10. Count unique departments. 
        
      SELECT COUNT(DISTINCT DEPARTMENT) AS COUNT_DEP,DEPARTMENT
      FROM EMP
      GROUP BY DEPARTMENT

--11. Give minimum salary of employee who belongs to Ahmedabad. 

      SELECT MIN(SALARY) AS MIN_SAL,CITY
      FROM EMP
      WHERE CITY='AHMEDABAD'
      GROUP BY CITY

--12. Find city wise highest salary. 

       SELECT CITY,MAX(SALARY) AS MAX_SAL
       FROM EMP
       GROUP BY CITY

--13. Find department wise lowest salary. 
  
      SELECT DEPARTMENT,MIN(SALARY) AS MIN_SAL
      FROM EMP
      GROUP BY DEPARTMENT

--14. Display city with the total number of employees belonging to each city.

      SELECT CITY,COUNT(EID) AS COUNT_EID
      FROM EMP
      GROUP BY CITY

--15. Give total salary of each department of EMP table. 

      SELECT DEPARTMENT,SUM(SALARY) AS  SUM_SAL
      FROM EMP
      GROUP BY DEPARTMENT

--16. Give average salary of each department of EMP table without displaying the respective department 
--name. 

      SELECT AVG(SALARY) AS AVG_SAL
      FROM EMP
      GROUP BY DEPARTMENT

--17. Count the number of employees for each department in every city. 

      SELECT COUNT(EID) AS COUNT_EID,DEPARTMENT,CITY
      FROM EMP
      GROUP BY DEPARTMENT,CITY

--18. Calculate the total salary distributed to male and female employees. 
     
      SELECT SUM(SALARY) AS SUM_SALARY,GENDER
      FROM EMP
      GROUP BY GENDER

--19. Give city wise maximum and minimum salary of female employees. 

      SELECT MIN(SALARY) AS MIN_SAL,MAX(SALARY) AS MAX_SAL,CITY
      FROM EMP
      WHERE GENDER='FEMALE'
      GROUP BY CITY

--20. Calculate department, city, and gender wise average salary. 

      SELECT AVG(SALARY) AS AVG_SAL,DEPARTMENT,CITY,GENDER
      FROM EMP
      GROUP BY DEPARTMENT,CITY,GENDER

--Part – B: 
--1. Count the number of employees living in Rajkot. 

     SELECT COUNT(EID) AS COUNT_ID
     FROM EMP
     WHERE CITY='RAJKOT'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

     SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE
     FROM EMP


--3. Display the total number of employees hired before 1st January, 1991. 
    
      SELECT COUNT(EID) AS ID
      FROM EMP
      WHERE JOININGDATE < '1991-JAN-01'
--Part – C: 
--1. Count the number of employees living in Rajkot or Baroda. 
 
     SELECT COUNT(EID) AS ID
     FROM EMP
     WHERE CITY IN ('RAJKOT','BARODA')

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 

     SELECT COUNT(EID) AS ID
     FROM EMP
     WHERE DEPARTMENT='IT' AND JOININGDATE< '1991-JAN-01'

--3. Find the Joining Date wise Total Salaries. 

     SELECT  SUM(SALARY) AS SUM_SAL,JOININGDATE
     FROM EMP
     GROUP BY JOININGDATE

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’. 

    SELECT MAX(SALARY) AS MAX_SAL,DEPARTMENT,CITY
    FROM EMP
    WHERE CITY LIKE 'R%'
    GROUP BY DEPARTMENT,CITY


  