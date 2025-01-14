-- This command is for looking at the whole table
--select * from TSQLV6.Sales.Orders

-- This command is for looking at part of the table - COLUMN NAMES
select * from TSQLV6.Sales.Orders

-- This command is for looking at some rows (customer id = 70) - WHERE 
select orderid, custid, empid, orderdate, freight
from TSQLV6.Sales.Orders
where custid = 71

-- GROUP BY - arranges the previous received rows in groups
-- grouped by empid
select empid, year(orderdate) as [Order Year]
from TSQLV6.Sales.Orders
where custid = 71
group by empid, year(orderdate)
-- grouped by Year
select empid, year(orderdate) as [Order Year]
from TSQLV6.Sales.Orders
where custid = 71
group by year(orderdate), empid

-- Applying COUNT()
select empid, year(orderdate) as [Order Year]
from TSQLV6.Sales.Orders
where custid = 71
group by empid, year(orderdate)

select empid, year(orderdate) as [Order Year], count(distinct custid) as [Number of Customers]
from TSQLV6.Sales.Orders
where custid = 71
group by empid, year(orderdate)
