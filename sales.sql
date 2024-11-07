CREATE DATABASE gfgpractice;
SHOW DATABASES;
USE gfgpractice;

-- https://www.geeksforgeeks.org/sql-exercises/

create table SALES(
sale_id int primary key,
product_id int,
quantity_Sold int,
sale_date date,
total_price decimal(10,2)
);

insert into SALES
(sale_id,product_id,quantity_sold,sale_date,total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);
select * from sales;
 
create table PRODUCTS(
product_id int primary key,
product_name varchar(50),
category varchar(50),
unti_price decimal(10,2));

ALTER TABLE PRODUCTS
CHANGE unti_price unit_price varchar(50);

insert into PRODUCTS
(product_id,product_name,category,unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

-- SQL Practice Exercises for Beginners

Select * from sales;
select product_name,unit_price from products;
select sale_id,sale_date from sales;
select * from sales where total_price > 100;
select * from products where category = 'Electronics';
select sale_id,total_price from sales where sale_date='2024-01-03';
select product_id,product_name from products where unit_price>100;
select sum(total_price) as total_revenue from sales;
select avg(unit_price) as avg_unit_price from products;
select sum(quantity_sold) as total_quantity_sold from sales;
select sale_id,product_id,total_price from sales where quantity_sold>4;
select product_name,unit_price from products 
order by unit_price desc;
select round(sum(total_price),2) as total_sales from sales;
select avg(total_price) as avg_total_price from sales;
select sale_id,sale_date as formatted_date from sales;

select sum(sales.total_price)
as total_revenue
from sales
join products on sales.product_id=products.product_id
where products.category='electronics';

select product_name,unit_price from products
where unit_price >= 20 and  unit_price <= 600;

select product_name,category from products 
order by category asc;

select sum(sales.quantity_sold) as
total_quantity_sold
from sales
join products on sales.product_id=products.product_id
where products.category='electronics';

select product_name,quantity_sold*unit_price as
total_price
from sales
join products on sales.product_id=products.product_id;

-- SQL Practice Exercises for Intermediate

select p.category,sum(total_price) as total_revenue
from sales s
join products p on s.product_id=p.product_id
group by p.category;

select category 
from products 
group by category
order by avg(unit_price) desc
limit 1;
