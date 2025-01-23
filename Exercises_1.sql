-- Return orders placed in June 2021
-- Tables involved: TSQLV6 database, Sales.Orders table

select *
from TSQLV6.Sales.Orders
where year(orderdate) = 2021 and month(orderdate) = 6

select * from TSQLV6.Sales.Orders
where orderdate >= '20210601' and orderdate < '20210701'


-- Return orders placed on the day before the last day of the month
-- Tables involved: Sales.Orders table

select * from TSQLV6.Sales.Orders
where orderdate = DATEADD(day, -1, EOMONTH(orderdate))


-- Return employees with last name containing the letter 'e' twice or more
-- Tables involved: HR.Employees table

select * from TSQLV6.HR.Employees
where lastname LIKE '%e%e%'
-- '%e%e': starts with any letter, has an 'e' in the middle, continues
--        with anything up to find another 'e', and ends with anything.

-- Return orders with total value(qty*unitprice) greater than 10000
-- sorted by total value
-- Tables involved: Sales.OrderDetails table


select orderid, SUM(qty * unitprice) as Total
from TSQLV6.Sales.OrderDetails
group by orderid
having SUM(qty * unitprice) > 10000
order by Total desc


-- Explain the difference between the following two queries

-- Query 1
SELECT empid, COUNT(*) AS numorders
FROM TSQLV6.Sales.Orders
WHERE orderdate < '20220501'
GROUP BY empid;

-- Query 2
SELECT empid, COUNT(*) AS numorders
FROM TSQLV6.Sales.Orders
GROUP BY empid
HAVING MAX(orderdate) < '20220501';


-- Figure out and return for each employee the gender based on the title of courtesy
-- Ms., Mrs. - Female, Mr. - Male, Dr. - Unknown
-- Tables involved: HR.Employees table

-- Return for each customer the customer ID and region
-- sort the rows in the output by region, ascending
-- having NULLs sort last (after non-NULL values)
-- Note that the default in T-SQL is that NULLs sort first
-- Tables involved: Sales.Customers table

select 
empid, 
firstname + ' ' + lastname as Fullname,
CASE titleofcourtesy
WHEN 'Ms.' THEN 'Female'
WHEN 'Mrs.' THEN 'Female'
WHEN 'Mr.' THEN 'Male'
ELSE 'Unknown'
END as gender
from TSQLV6.HR.Employees


-- Return for each customer the customer ID and region
-- sort the rows in the output by region, ascending
-- having NULLs sort last (after non-NULL values)
-- Note that the default in T-SQL is that NULLs sort first
-- Tables involved: Sales.Customers table

SELECT custid, region
FROM TSQLV6.Sales.Customers
ORDER BY region asc

-- Result with NULLS last
SELECT custid, 
       region,
       CASE WHEN region IS NULL THEN 1 ELSE 0 END AS [value]
FROM TSQLV6.Sales.Customers
ORDER BY [value], region