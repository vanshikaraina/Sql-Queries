CREATE DATABASE PL_SQL;
USE PL_SQL;
DELIMITER //

CREATE PROCEDURE sum_fn()
BEGIN
    DECLARE a INT;
    DECLARE b INT;
    DECLARE c INT;
    SET a = 10;
    SET b = 20;
    SET c = a + b;
    SELECT c;
END //

DELIMITER ;
CALL sum_fn();

delimiter //
create procedure higher()
begin
declare a int;
declare b int;
set a =10;
set b = 20;
if a>b then
select a as output;
else 
select b as output;
end if;
end //

delimiter ;
call higher();

DELIMITER //

CREATE PROCEDURE CheckEvenOdd(IN num INT) -- in is for input
BEGIN
    IF num % 2 = 0 THEN
        SELECT CONCAT(num, ' is even.') AS Result;
    ELSE
        SELECT CONCAT(num, ' is odd.') AS Result;
    END IF;
END //

DELIMITER ;
CALL CheckEvenOdd(20);

delimiter //
create procedure highest(in x1 int,in x2 int,in x3 int, in x4 int)
begin
if x1>x2 then
select concat(x1, ' is greater than ', x2) as result;
elseif x2>x3 then
select concat(x2, ' is greater than ', x3) as result;
else 
select ('didnt calculate') as result;
end if;
end //

delimiter ;
call highest(1,2,3,4);
call highest(7,6,5,4);

-- switch case,switch keywor dis not used
DELIMITER //

CREATE PROCEDURE GetDayName(IN day_number INT)
BEGIN
    DECLARE day_name VARCHAR(20);

    CASE day_number
        WHEN 1 THEN
            SET day_name = 'Monday';
        WHEN 2 THEN
            SET day_name = 'Tuesday';
        WHEN 3 THEN
            SET day_name = 'Wednesday';
        WHEN 4 THEN
            SET day_name = 'Thursday';
        WHEN 5 THEN
            SET day_name = 'Friday';
        WHEN 6 THEN
            SET day_name = 'Saturday';
        WHEN 7 THEN
            SET day_name = 'Sunday';
        ELSE
            SET day_name = 'Invalid day';
    END CASE;

    SELECT CONCAT('The day is: ', day_name) AS Result;
END //

DELIMITER ;
call getdayname(4);

-- loop
DELIMITER //

CREATE PROCEDURE SimpleLoop()
BEGIN
    DECLARE counter INT DEFAULT 1;  -- Initialize the counter
    DECLARE max_count INT DEFAULT 5; -- Define the maximum count

    simple_loop: LOOP
        -- Output the current value of counter
        SELECT counter AS CurrentNumber;

        -- Increment the counter
        SET counter = counter + 1;

        -- Exit the loop when counter exceeds max_count
        IF counter > max_count THEN
            LEAVE simple_loop; -- Exit the loop
        END IF;
    END LOOP simple_loop;

END //

DELIMITER ;
call simpleloop();
