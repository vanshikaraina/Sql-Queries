create database joins;
show databases;
use joins;

-- gfg

create table Student(
roll_no int primary key,
sname varchar(255),
address varchar(255),
phone bigint,
age int);

insert into Student(roll_no,sname,address,phone,age)
values
(1,'Harsh','Delhi',1111111111,18),
(2,'Pratik','Bihar',2222222222,19),
(3,'Riyanka','Siliguri',3333333333,20),
(4,'Deep','Ramnagar',4444444444,18),
(5,'Saptarhi','Kolkata',5555555555,19),
(6,'Dhanraj','Barabajar',6666666666,20),
(7,'Rohit','Balurghat',7777777777,18),
(8,'Harsh','Alipur',8888888888,19);

create table StudentCourse(
course_id int,
roll_no int);

insert into StudentCourse(course_id,roll_no)
values
(1,1),(2,2),(2,3),(3,4),(1,5),(4,9),(5,10),(4,11);

select * from Student;
select * from StudentCourse;

-- inner join
select s.roll_no,s.sname,s.address,s.phone,s.age
from Student s
join StudentCourse sc On s.roll_no=sc.roll_no;

-- left join
select s.roll_no,s.sname,sc.course_id
from Student s
join StudentCourse sc On s.roll_no=sc.roll_no;

-- right join
select s.roll_no,s.sname,sc.course_id
from Student s
right join StudentCourse sc
on s.roll_no=sc.roll_no;
 
-- full join: left join and reversed left join
SELECT s.roll_no, s.sname, sc.course_id
FROM Student s
LEFT JOIN StudentCourse sc ON s.roll_no = sc.roll_no

UNION ALL

SELECT sc.roll_no, s.sname, sc.course_id
FROM StudentCourse sc
LEFT JOIN Student s ON s.roll_no = sc.roll_no
WHERE s.roll_no IS NULL;
-- 
-- no full join on mysql workbench

-- cross join 
select s.roll_no,s.sname,sc.course_id
from Student s
cross join StudentCourse sc On s.roll_no=sc.roll_no;

 CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);
    
    
    CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);

-- q1
    select s.name as salesperson,c.cust_name,c.city
    from customer c 
    join salesman s 
    on s.city=c.city;

-- q2
select o.ord_no,o.purch_amt,c.cust_name,c.city
from customer c 
join orders o 
on c.customer_id=o.customer_id
where purch_amt>500 and purch_amt<2000;

-- q3
select s.name,c.cust_name,c.city,s.commission
from customer c
right join salesman s 
on s.salesman_id=c.salesman_id;