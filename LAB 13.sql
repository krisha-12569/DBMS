SELECT * FROM AUTHOR;
SELECT * FROM PUBLISHER;
SELECT * FROM BOOK;

--From the above given table perform the following queries:  
--Part – A: 
--1. List all books with their authors. 
 
    SELECT TITLE,AUTHORNAME
    FROM BOOK
    RIGHT JOIN AUTHOR
    ON AUTHOR.AuthorID=BOOK.AuthorID

--2. List all books with their publishers. 
   
    SELECT TITLE,PublisherName
    FROM BOOK
    RIGHT JOIN Publisher
    ON Publisher.PublisherID=BOOK.PublisherID

--3. List all books with their authors and publishers. 
  
    SELECT TITLE,AUTHORNAME,PUBLISHERNAME
    FROM BOOK
    JOIN AUTHOR
    ON BOOK.AuthorID=Author.AuthorID
    JOIN PUBLISHER
    ON BOOK.PublisherID=Publisher.PublisherID

--4. List all books published after 2010 with their authors and publisher and price.
 
     SELECT TITLE,AUTHORNAME,PUBLISHERNAME,PRICE
     FROM BOOK
     JOIN AUTHOR
     ON BOOK.AuthorID=Author.AuthorID
     JOIN Publisher
     ON BOOK.PublisherID=Publisher.PublisherID
     WHERE PublicationYear>2010

--5. List all authors and the number of books they have written. 

    SELECT AUTHORNAME,COUNT(AUTHORNAME) AS TOTAL_BOOKS
    FROM AUTHOR
    LEFT JOIN BOOK
    ON AUTHOR.AuthorID=BOOK.AuthorID
    GROUP BY AuthorName

--6. List all publishers and the total price of books they have published.
 
    SELECT PUBLISHERNAME,SUM(PRICE) AS TOTAL_PRICE
    FROM Publisher
    LEFT JOIN BOOK
    ON Publisher.PublisherID=BOOK.PublisherID
    GROUP BY PublisherName

--7. List authors who have not written any books. 
  
    SELECT AUTHORNAME,COUNT(BOOK.AuthorID) AS COUNT_AUTH
    FROM AUTHOR
    LEFT JOIN BOOK
    ON AUTHOR.AuthorID=BOOK.AuthorID
    GROUP BY AuthorName
    HAVING COUNT(BOOK.AuthorID)=0

--8. Display total number of Books and Average Price of every Author. 

   SELECT COUNT(BOOKID) AS COUNT_BOOK,AVG(PRICE) AS AVG_PRICE,AUTHORNAME
   FROM Author
   LEFT JOIN BOOK
   ON AUTHOR.AuthorID=BOOK.AuthorID
   GROUP BY AuthorName

--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 

  SELECT PUBLISHERNAME,COUNT(TITLE) AS COUNT_BOOK
  FROM Publisher
  LEFT JOIN BOOK
  ON BOOK.PublisherID=Publisher.PublisherID
  GROUP BY PublisherName
  ORDER BY COUNT(TITLE) DESC

--10. Display number of books published each year. 
 
   SELECT COUNT(TITLE) AS COUNT_BOOK,PublicationYear
   FROM BOOK
   GROUP BY PublicationYear
 
--Part – B: 
--1. List the publishers whose total book prices exceed 500, ordered by the total price.  
 
    SELECT PUBLISHERNAME
    FROM BOOK
    LEFT JOIN PUBLISHER
    ON PUBLISHER.PublisherID=BOOK.PublisherID
    GROUP BY PublisherName
    HAVING SUM(PRICE)>500
    ORDER BY SUM(PRICE)

--2. List most expensive book for each author, sort it with the highest price. 

   SELECT AUTHORNAME,MAX(PRICE) AS MAX_PRICE
   FROM AUTHOR
   LEFT JOIN BOOK
   ON AUTHOR.AuthorID=BOOK.AuthorID
   GROUP BY AuthorName
   ORDER BY MAX(PRICE) DESC

--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 

CREATE TABLE EMP_INFO(
     EID INT PRIMARY KEY,
     ENAME VARCHAR(25),
     DID INT,
     CID INT,
     SALARY DECIMAL(5,2) CHECK(SALARY>0),
     EXPERIENCE INT CHECK (EXPERIENCE>=0),
     FOREIGN KEY (Did) REFERENCES Dept_info(Did),
     FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);

DROP TABLE Emp_info

CREATE TABLE DEPT_INFP(
      DID INT PRIMARY KEY,
      DNAME VARCHAR(25)
);

DROP TABLE Dept_info


CREATE TABLE CITY_INFO(
       CID INT PRIMARY KEY,
       CNAME VARCHAR(25)
       DID INT,
       FOREIGN KEY (Did) REFERENCES District(Did)
);

DROP TABLE City_info

CREATE TABLE DISTRICT(
       DID INT PRIMARY KEY,
       DNAME VARCHAR(25),
       SID INT,
       FOREIGN KEY (Sid) REFERENCES State(Sid)
);

DROP TABLE District

CREATE TABLE STATE(
        SID INT PRIMARY KEY,
        SNAME VARCHAR(25),
        CID INT,
        FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

DROP TABLE STATE

CREATE TABLE COUNTRY(
       CID INT PRIMARY KEY,
       CNAME VARCHAR(25)
);

DROP TABLE Country

--2. Insert 5 records in each table.

INSERT INTO Emp_info VALUES(101,'RITU',
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 