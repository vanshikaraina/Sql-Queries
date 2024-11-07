CREATE DATABASE ORG;
show DATABASES;
USE ORG;

CREATE TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(50),
LAST_NAME CHAR(50),
SALARY INT,
JOINING_DATE DATETIME,
DEPT VARCHAR(50)
);

INSERT INTO Worker
(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPT) VALUES
(1,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
(2,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
(4,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
(5,'Vivek','Gupta',500000,'2014-06-11 09:00:00','Admin'),
(6,'Vipul','Mahajan',200000,'2014-06-11 09:00:00','Account'),
(7,'Satish','Sharma',75000,'2014-06-11 09:00:00','Account'),
(8,'Geetika','Raina',90000,'2014-04-11 09:00:00','Admin');

SELECT * FROM Worker;

CREATE TABLE Bonus(
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY(WORKER_REF_ID)
 REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES
(1,5000,'2016-02-20 00:00:00'),
(2,3000,'2016-02-20 00:00:00'),
(3,4000,'2016-02-20 00:00:00'),
(4,4500,'2016-02-20 00:00:00'),
(5,3500,'2016-02-20 00:00:00');

Select * from Bonus;

CREATE TABLE Title(
WORKER_REF_ID INT,
WORKER_TITLE VARCHAR(50),
AFFECTED_FROM DATETIME,
FOREIGN KEY(WORKER_REF_ID) 
REFERENCES Worker(WORKER_ID) 
ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst. Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00');

SELECT * FROM Title;

SELECT * FROM Worker;
select 44+11;
select now();
select ucase('VAYFVGAHJ');

select * from worker limit 4;
drop table Bonus;