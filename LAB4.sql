USE CSE_3A_182;

CREATE TABLE CRICKET(
       NAME VARCHAR(25),
       City VARCHAR(25),
       Age INT,
);

INSERT INTO CRICKET(NAME,City,Age) VALUES ('Sachin Tendulkar','Mumbai',30),
                                 ('Rahul Dravid','Bombay',35),
                                 ('M. S. Dhoni','Jharkhand',31),
                                 ('Suresh Raina','Gujarat',30);

SELECT *
FROM CRICKET;

--1. Create table Worldcup from cricket with all the columns and data.  

     SELECT *
     INTO WORLDCUP
     FROM CRICKET;
--2. Create table T20 from cricket with first two columns with no data. 

     SELECT NAME,CITY
     INTO T20
     FROM CRICKET
     WHERE 2=3;

     SELECT *
     FROM T20;
--3. Create table IPL From Cricket with No Data. 

     SELECT *
     INTO IPL
     FROM CRICKET
     WHERE 2=3;

     SELECT *
     FROM IPL;
--4. Select players who are either older than 30 and from 'Mumbai' or exactly 31 years old and not from 
--'Bombay', and insert them into a new table PLAYER. 


     SELECT NAME
     INTO PLAYER
     FROM CRICKET
     WHERE (AGE>30 AND CITY='MUMBAI') OR (AGE=31 AND CITY!='BOMBAY');


--5. Select players whose age is a prime number or their city belongs to India Country, and insert them into 
--a new table PLAYER_INFO. (Consider Cricketer age between 18 to 55) 
       
       SELECT NAME
       INTO PLAYER_INFO
       FROM CRICKET
       WHERE CITY IN('Mumbai','Bombay','Jharkhand','Gujarat')  OR AGE IN (19,23,29,31,37,41,43,47,53)

       SELECT * 
       FROM PLAYER_INFO

--6. Select players whose age is a multiple of 5 and insert them into a new table PLAYER_DATA. 
       
      SELECT NAME
      INTO PLAYER_DATA
      FROM CRICKET
      WHERE AGE%5=0;

      SELECT *
      FROM PLAYER_DATA

      --DROP TABLE PLAYER_DATA

--7. Insert the cricketer into IPL table whose city is ‘Jharkhand’ 

     INSERT INTO IPL
     SELECT * FROM CRICKET
     WHERE CITY='JHARKHAND';

-- Part – B:  
CREATE TABLE EMPLOYEE(
          NAME VARCHAR(25),
          CITY VARCHAR(25),
          AGE INT
);
  
INSERT INTO EMPLOYEE(NAME,CITY,AGE) VALUES('Jay Patel','Rajkot',30),
                                          ('Rahul Dave','Baroda',35),
                                          ('Jeet Patel','Surat',31),
                                          ('Vijay Raval','Rajkot',30);

SELECT *
FROM EMPLOYEE;
    
 
--1. Create table Employee_detail from Employee with all the columns and data.  

     SELECT *
     INTO EMPLOYEE_DETAIL
     FROM EMPLOYEE
     WHERE 1=1


--2. Create table Employee_data from Employee with first two columns with no data. 


     SELECT TOP 2*
     INTO EMPLOYEE_DATA
     FROM EMPLOYEE
     WHERE 1=2

     SELECT * 
     FROM EMPLOYEE_DATA
--3. Create table Employee_info from Employee with no Data

     SELECT *
     INTO EMPLOYEE_INFO
     FROM EMPLOYEE
     WHERE 1=2


--Part – C:  
--Perform following queries on Employee table. 
--1. Insert the Data into Employee_info from Employee whose CITY is Rajkot 


      INSERT INTO EMPLOYEE_INFO
      SELECT * FROM EMPLOYEE
      WHERE CITY='RAJKOT'


--2. Insert the Data into Employee_info from Employee whose age is more than 32.


     INSERT INTO EMPLOYEE_INFO
     SELECT * FROM EMPLOYEE 
     WHERE AGE>32
      


--UPDATE OPERATION

--Part – A:  
--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table) 


     UPDATE DEPOSIT
     SET AMOUNT=5000
     WHERE AMOUNT=3000


--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)  

      UPDATE BORROW
      SET BNAME='C.G. ROAD'
      WHERE CNAME='ANIL'


--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table) 
 
       UPDATE DEPOSIT
       SET ACTNO=11,AMOUNT=5000
       WHERE CNAME='SANDIP'


--4. Update amount of KRANTI to 7000. (Use Deposit Table) 

       UPDATE DEPOSIT
       SET AMOUNT=7000
       WHERE CNAME='KRANTI'


--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table) 

      UPDATE BRANCH
      SET BNAME='ANDHERI WEST'
      WHERE BNAME='ANDHERI'


--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) 

      UPDATE DEPOSIT
      SET BNAME='NEHRU PALACE'
      WHERE CNAME='MEHUL'

--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit 
--Table) 

      UPDATE DEPOSIT
      SET AMOUNT=5000
      WHERE ACTNO BETWEEN 103 AND 107


--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 

      UPDATE DEPOSIT
      SET ADATE='1995-04-01'
      WHERE CNAME='ANIL'

--9. Update the amount of MINU to 10000. (Use Deposit Table) 

      UPDATE DEPOSIT
      SET AMOUNT=10000
      WHERE CNAME='MINU'

--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table) 

      UPDATE DEPOSIT
      SET AMOUNT=5000,ADATE='1996-04-01'
      WHERE CNAME='PRAMOD'



--  -- Part – B:  
--1. Give 10% Increment in Loan Amount. (Use Borrow Table) 

       UPDATE BORROW
       SET AMOUNT=AMOUNT+(0.01*AMOUNT)


--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table) 

      UPDATE DEPOSIT
      SET AMOUNT=AMOUNT+(0.2*AMOUNT)

--3. Increase Amount by 1000 in all the account.  (Use Deposit Table) 

      UPDATE DEPOSIT
      SET AMOUNT=AMOUNT+1000

--4. Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the 
--customer name is ‘MEHUL’ and the loan number is even. 

      UPDATE BORROW
      SET AMOUNT=7000,BNAME='CENTRAL'
      WHERE CNAME='MEHUL' AND LOANNO%2=0


--5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in 
--‘VRCE’ and with an account number less than 105. 

      UPDATE DEPOSIT
      SET ADATE='2022-05-15',AMOUNT=2500
      WHERE BNAME='VRCE' AND ACTNO<105


--Part – C:  
--1. Update amount of loan no 321 to NULL. (Use Borrow Table) 

      UPDATE BORROW
      SET LOANNO=NULL
      WHERE LOANNO=321


--2. Update branch name of KRANTI to NULL (Use Borrow Table) 

       UPDATE BORROW 
       SET BNAME=NULL
       WHERE BNAME='KRANTI'

--3. Display the name of borrowers whose Loan number is NULL. (Use Borrow Table) 

      SELECT BNAME
      FROM BORROW
      WHERE LOANNO IS NULL
        
--4. Display the Borrowers whose having branch. (Use Borrow Table) 
     
       SELECT BNAME
       FROM BORROW
       
 
--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. 
--(Use Borrow Table) 

        UPDATE BORROW
        SET LOANNO=5000,BNAME='VRCE',CNAME='DARSHAN'
        WHERE LOANNO=481

--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less 
--than 2000. 
   
         UPDATE DEPOSIT
         SET ADATE='2021-01-01'
         WHERE AMOUNT<2000

--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 
--110.   

         UPDATE DEPOSIT
         SET ADATE=NULL,BNAME='ANDHERI'
         WHERE ACTNO=110
