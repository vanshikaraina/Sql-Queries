Create database school;
show databases;
use school;

create table Students(
student_id int auto_increment primary key,
student_name varchar(50),
roll_no int,
fee decimal(10,2),
course varchar(50),
phone_num varchar(15),
address varchar(20)
);

-- alter table students
-- add phone_num int;
-- modify phone_num varchar(15);
-- modify student_id int auto_increment primary key;

insert into students(student_name,roll_no,fee,course,phone_num,address)
VALUES
('Vasvi',101,100000,'CSE','1234567898','Punjab'),
('Rohit',102,80000,'ECE','9419756238','Haryana'),
('Agam',103,100000,'CSE','9419729638','Haryana'),
('Agastya',104,80000,'Marine','8273952947','Rajasthan'),
('Tanya',105,120000,'MBA','8766886329','Jammu');

select * from students; 
-- drop table students;

select distinct course from students;
select * from students
order by roll_no desc
limit 3;

select * from students limit 4 offset 2; 

select student_id,student_name ,
case
when fee>90000 then 'high'
when fee>80000 then 'medium'
else 'low'
end as fee_category
from students;

update students
set fee=70000 
where student_id=4;

delete from students where student_id = 16;

insert into students(student_id,student_name,roll_no,fee,course,phone_num,address)
VALUES
(5,'Tanya',105,120000,'MBA','8798886329','Jammu');

insert into students(student_id,student_name,roll_no,fee,course,phone_num,address)
VALUES
(6,'Shreya',106,100000,'CSE','1214567898','Punjab'),
(7,'Dhruv',107,80000,'ECE','9419756238','Haryana'),
(8,'Ravi',108,120000,'MBA','9419729448','Punjab'),
(9,'Dhruv',109,80000,'Marine','8244952907','Rajasthan'),
(10,'Neha',110,120000,'MBA','8766326329','Jammu');

select * from students
where course = 'CSE';

select * from students
where course in('CSE','Marine')
order by course desc;

select course, count(*) as num_stu
from students
-- where course in('CSE','Marine')
group by course;

select student_name,course from students
where not course = 'CSE';

select student_name from students where student_name like 'a%';

select student_name,fee,course from students 
where fee between 90000 and 120000
order by fee desc;

select count(*) from students;

select course,avg(fee) as avg_fee
from students
group by students
having avg_fee > 60000;

create table Courses(
course_id int primary key,
course_name varchar(50),
student_id int,
foreign key (student_id) references students(student_id)
on delete cascade
);

DROP TABLE COURSES;