USE CSE_3A_182;

--Part – A: 

CREATE TABLE STUDENT(
    StuID INT,
    Firstname VARCHAR(25),
    Lastname VARCHAR(25),
    Website VARCHAR(25),
    City VARCHAR(25),
    Address VARCHAR(100),
);

INSERT INTO STUDENT(StuID,Firstname,Lastname,Website,City,Address) VALUES(1011,'Keyur','Patel','techonthenet.com','Rajkot','A-303 ‘Vasant Kunj, Rajkot'),
                                                                         (1022,'Hardik','Shah','digminecraft.com','Ahmedabad','“Ram Krupa”, Raiya Road'),
                                                                         (1033,'Kajal','Trivedi','bigactivities.com','Baroda','Raj bhavan plot, near garden'),
                                                                         (1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad','“Jig’s Home”, Narol'),
                                                                         (1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55, Raj Residency '),
                                                                         (1066,'Ashok','Jani',NULL,'Baroda','A502, Club House Building');

SELECT * FROM STUDENT;
TRUNCATE TABLE STUDENT
--From the above given tables perform the following queries (LIKE Operation): 
--1. Display the name of students whose name starts with ‘k’. 
    
    SELECT Firstname
    FROM STUDENT
    WHERE Firstname LIKE 'K%';
    

--2. Display the name of students whose name consists of five characters. 

     SELECT Firstname
     FROM STUDENT
     WHERE Firstname LIKE '_____'

--3. Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters. 

     SELECT Firstname,Lastname
     FROM STUDENT
     WHERE City LIKE '_____a'

--4. Display all the students whose last name ends with ‘tel’. 

     SELECT *
     FROM STUDENT
     WHERE Lastname LIKE '%tel'

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’. 

     SELECT *
     FROM STUDENT
     WHERE Firstname LIKE 'ha%t'

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.

     SELECT *
     FROM STUDENT
     WHERE Firstname LIKE 'k_y%'

--7. Display the name of students having no website and name consists of five characters.

     SELECT Firstname
     FROM STUDENT
     WHERE  Firstname LIKE '_____' AND Website IS NULL 

--8. Display all the students whose last name consist of ‘jer’. 

     SELECT *
     FROM STUDENT
     WHERE Lastname LIKE '%jer%'

--9. Display all the students whose city name starts with either ‘r’ or ‘b’. 

     SELECT *
     FROM STUDENT 
     WHERE CITY LIKE '[R,B]%'

--10. Display all the name students having websites. 

     SELECT Firstname
     FROM STUDENT
     WHERE Website IS NOT NULL 

--11. Display all the students whose name starts from alphabet A to H. 

     SELECT *
     FROM STUDENT 
     WHERE Firstname LIKE '[A-H]%'

--12. Display all the students whose name’s second character is vowel. 

     SELECT *
     FROM STUDENT
     WHERE Firstname LIKE '_[a,e,i,o,u]%'

--13. Display the name of students having no website and name consists of minimum five characters.

     SELECT Firstname,Lastname
     FROM STUDENT  
     WHERE Firstname LIKE '_____%' AND Website IS NOT NULL

--14. Display all the students whose last name starts with ‘Pat’.   

     SELECT *
     FROM STUDENT
     WHERE Lastname LIKE 'Pat%'

--15. Display all the students whose city name does not starts with ‘b’. 

     SELECT *
     FROM STUDENT
     WHERE City NOT LIKE 'B%'

--16. Display all the students whose student ID ends with digit. 
     
      SELECT *
      FROM STUDENT
      WHERE StuID LIKE '%[0-9]'

--17. Display all the students whose address does not contain any digit.
   
      SELECT *
      FROM STUDENT 
      WHERE Address NOT LIKE '%[0-9]%'

--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 
--'math' or 'science'. Ensure that their city does not start with 'B'.

      SELECT Firstname
      FROM STUDENT
      WHERE Firstname LIKE 'B%' AND Lastname LIKE '%a' AND Website LIKE '%[math,science]%' AND City NOT LIKE 'B%'
       
--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their 
--website should be either null or contain 'com'. 

       SELECT *
       FROM STUDENT
       WHERE Lastname='SHAH' AND CITY LIKE '%D' AND (Website IS NULL OR Website LIKE '%[COM]%')

--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must 
--have a website containing '.com'. 

       SELECT *
       FROM STUDENT
       WHERE Firstname LIKE '[A,E,I,O,U][A,E,I,O,U]%' AND (CITY LIKE 'R%') AND (Website LIKE '%[.COM]%')


--Part – B: 
--1. Display all the students whose name’s second character is vowel and of and start with H. 

       SELECT *
       FROM STUDENT
       WHERE Firstname lIKE '_[a,e,i,o,u]%' AND Firstname LIKE 'H%'

--2. Display all the students whose last name does not ends with ‘a’. 

      SELECT *
      FROM STUDENT
      WHERE Lastname NOT LIKE '%A'

--3. Display all the students whose first name starts with consonant. 

     SELECT *
     FROM STUDENT
     WHERE Firstname NOT LIKE '[a,e,i,o,u]%'

--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their 
--website contains 'tech' or they live in a city starting with 'R'. 
   
      SELECT *
      FROM STUDENT 
      WHERE Firstname LIKE 'K%' AND (lastname LIKE '%TEL') AND (Website LIKE '%[TECH]%' OR CITY LIKE 'R%')


--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They 
--must have a website that ends with '.com' and their first name should not start with 'A'. 

    SELECT *
    FROM STUDENT
    WHERE ADDRESS LIKE '%[-]%' AND CITY LIKE '[R,B]%' AND Website LIKE '%[.COM]' AND FIRSTNAME NOT LIKE 'A%'
--Part – C: 
--1. Display all the students whose address contains single quote or double quote. 

    SELECT *
    FROM STUDENT 
    WHERE ADDRESS LIKE '%['' ""]%'

--2. Find students whose city does not contain the letter 'S' and their address contains either single or double 
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'.

    SELECT *
    FROM STUDENT
    WHERE CITY NOT LIKE '%S%' AND (ADDRESS LIKE '%['' ""]%') AND (Lastname LIKE 'P%') AND Website LIKE '%[ON]%'