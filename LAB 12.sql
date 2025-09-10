SELECT * FROM PERSON;
SELECT * FROM DEPT;

--Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product. 

   SELECT *
   FROM PERSON
   CROSS JOIN DEPT

--2. Find all persons with their department name 
  
  SELECT PERSONNAME,DepartmentName 
  FROM PERSON
  INNER JOIN DEPT
  ON PERSON.DepartmentID=DEPT.DepartmentID 

--3. Find all persons with their department name & code. 

  SELECT PERSONNAME,DepartmentName,DepartmentCode
  FROM PERSON
  INNER JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID 

--4. Find all persons with their department code and location. 
 
  SELECT PERSONNAME,DepartmentCode,Location
  FROM PERSON
  INNER JOIN DEPT
  ON PERSON.DepartmentID=DEPT.DepartmentID 
  
--5. Find the detail of the person who belongs to Mechanical department.
 
   SELECT PersonID,PersonName,PERSON.DepartmentID,Salary,JoiningDate,City
   FROM PERSON
   INNER JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID 
   WHERE DepartmentName='Mechanical'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.  
 
   SELECT PersonName,DepartmentCode,Salary,CITY
   FROM PERSON
   INNER JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID 
   WHERE CITY='Ahmedabad'

  
--7. Find the person's name whose department is in C-Block. 
  
  SELECT PERSONNAME,DepartmentName
   FROM PERSON
   INNER JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID 
   WHERE LOCATION='C-Block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.

   SELECT PERSONNAME,DepartmentName,SALARY
   FROM PERSON
   INNER JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID 
   WHERE CITY='Jamnagar'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
   
   SELECT PersonID,PersonName,PERSON.DepartmentID,Salary,JoiningDate,City
   FROM  PERSON
   LEFT JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID 
   WHERE DEPARTMENTNAME='CIVIL' AND JoiningDate>'2001-08-01'


--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 

   SELECT PERSONNAME,DepartmentName
   FROM PERSON
   JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID
   WHERE DATEDIFF(DAY,PERSON.JOININGDATE,GETDATE())>365

--11. Find department wise person counts. 

   SELECT DEPARTMENTNAME,COUNT(PERSONNAME) AS PER_NAME
   FROM PERSON
   JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID
   GROUP BY DEPARTMENTNAME

--12. Give department wise maximum & minimum salary with department name. 
   
   SELECT  DEPARTMENTNAME,MAX(SALARY) AS MAX_SAL,MIN(SALARY) AS MIN_SAL
   FROM PERSON
   LEFT JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID
   GROUP BY DEPARTMENTNAME

--13. Find city wise total, average, maximum and minimum salary. 
   SELECT  CITY,MAX(SALARY) AS MAX_SAL,MIN(SALARY) AS MIN_SAL,SUM(SALARY) AS SUM_SAL
   FROM PERSON
   LEFT JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID
   GROUP BY CITY


--14. Find the average salary of a person who belongs to Ahmedabad city. 

  SELECT PERSONNAME,AVG(SALARY) AS AVG_SAL
  FROM PERSON
  LEFT JOIN DEPT
  ON PERSON.DepartmentID=DEPT.DepartmentID
  WHERE CITY='Ahmedabad'
  GROUP BY PERSONNAME

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 
   
   SELECT PERSONNAME +' LIVES IN '+CITY +' AND WORKS IN '+DEPARTMENTNAME +' DEPARTMENT'
   FROM PERSON
   LEFT JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID
--Part – B: 
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 

  SELECT PERSONNAME + 'EARNS' + CONVERT(SALARY,VARCHAR) +'FROM' + DEPARTMENTNAME + 'DEPARTMENT MONTHLY'
  FROM PERSON
  LEFT JOIN DEPT
  ON PERSON.DepartmentID=DEPT.DepartmentID
--2. Find city & department wise total, average & maximum salaries. 
   
   SELECT CITY,DEPARTMENTNAME,SUM(SALARY) AS TOTAL_SAL,AVG(SALARY) AS AVG_SAL,MAX(SALARY) AS MAX_SAL
   FROM PERSON
   LEFT JOIN DEPT
   ON PERSON.DepartmentID=DEPT.DepartmentID
   GROUP BY CITY,DepartmentName

--3. Find all persons who do not belong to any department. 
 
   SELECT PERSONNAME
   FROM PERSON
   WHERE PERSON.DepartmentID IS NULL

--4. Find all departments whose total salary is exceeding 100000. 
  
   SELECT DEPARTMENTNAME
   FROM PERSON
   JOIN DEPT
   ON DEPT.DepartmentID=PERSON.DepartmentID
   GROUP BY DepartmentName
   HAVING SUM(SALARY)>100000

--Part – C: 
--1. List all departments who have no person. 

   SELECT DEPARTMENTNAME
   FROM PERSON
   JOIN DEPT
   ON DEPT.DepartmentID=PERSON.DepartmentID
   WHERE PERSON.DepartmentID IS NULL

   
--2. List out department names in which more than two persons are working. 
 
    SELECT DEPARTMENTNAME,COUNT(PERSONID) AS COUNT_ID
    FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID=PERSON.DepartmentID
    GROUP BY DepartmentName
    HAVING COUNT(PERSONID)>2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 
  
    UPDATE PERSON
    SET  Salary = Salary * 1.10
    FROM PERSON
    JOIN DEPT
    ON DEPT.DepartmentID=PERSON.DepartmentID
    WHERE DEPARTMENTNAME='COMPUTER'