
-- select * FROM Test_table


--- Compare your salary with you + 3 next persons

select *,
sum(code)over(order by id asc ROWS BETWEEN current row AND 3 FOLLOWING) as compari
FROM Test_table


-- Compare each person salary with next 3 person total salary


select *,
sum(code)over(order by id asc ROWS BETWEEN 1 following AND 3 FOLLOWING) as compari
FROM Test_table


--- Compare your salary with you + 2 above persons

select *,
sum(code)over(order by id rows between 2 preceding and current row) as compi
FROM Test_table
 
 --- Compare your salary with 2 above persons

 select *,
sum(code)over(order by id rows between 2 preceding and 1 preceding) as compi
FROM Test_table


-- 3 days above total (means find 3 days total above current rows)

select *,
sum(code) over(order by id rows between 3 preceding and 1 preceding) as running_total
FROM Test_table


-- 3 days running total

select *,
sum(code) over(order by id rows between 2 preceding and current row) as running_total
FROM Test_table
 

 -- Daily Running total

select *,
sum(code) over(order by id rows between UNBOUNDED preceding and current row) as running_total
FROM Test_table


-- compare each id with last id

select *,
last_value(code)over(order by id asc ROWS BETWEEN current row AND UNBOUNDED FOLLOWING) as compari
FROM Test_table

-- compare each id with first id

SELECT *,
first_VALUE(code) OVER (ORDER BY id) AS compari
FROM Test_table;


SELECT *,
first_VALUE(code) OVER (ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING and current row) AS compari
FROM Test_table;