--Customers table, order details table, orders table, products table where given
--INNER JOIN
--List the names of customers who made orders, along with the total amount of each order

SELECT C. NAME , O. TOTALAMOUNT
FROM TDIPROJECT.DBO.CUSTOMERST C
INNER JOIN TDIPROJECT.DBO.ORDERST O
ON C.CUSTOMERID = O .CUSTOMERID

	--Show the order ID, product name, and quantity of each item ordered.

	SELECT P. PRODUCTNAME , O. QUANTITY, O .ORDERID
FROM TDIPROJECT.DBO.ORDERDETAILST O
INNER JOIN TDIPROJECT.DBO.PRODUCTST P
ON O.PRODUCTID  = P.PRODUCTID

	--Display the email addresses of customers along with the products they ordered and the quantities.

SELECT C. EMAIL , OD. QUANTITY , P. PRODUCTNAME 
FROM TDIPROJECT.DBO.CUSTOMERST C
INNER JOIN TDIPROJECT.DBO.ORDERST O
ON C.CUSTOMERID  = O. CUSTOMERID
INNER JOIN TDIPROJECT.DBO.ORDERDETAILST OD
ON O.ORDERID = OD.ORDERID
INNER JOIN TDIPROJECT.DBO.PRODUCTST P
ON OD. PRODUCTID = P.PRODUCTID

	--Find the total amount spent by each customer.

	SELECT C. CUSTOMERID , C. NAME , SUM (OD. QUANTITY * P.PRICE) AS TOTALAMOUNTSPENT
FROM TDIPROJECT.DBO.CUSTOMERST C
INNER JOIN TDIPROJECT.DBO.ORDERST O
ON C. CUSTOMERID  = O. CUSTOMERID
INNER JOIN TDIPROJECT.DBO.ORDERDETAILST OD
ON O.ORDERID = OD.ORDERID
INNER JOIN TDIPROJECT.DBO.PRODUCTST P 
ON OD.PRODUCTID = P.PRODUCTID
GROUP BY C. CUSTOMERID , C. NAME 
ORDER BY TOTALAMOUNTSPENT DESC

--RIGHT OUTER JOIN
	--Show all products along with the order details. Include products that haven't been ordered

 SELECT *
 FROM TDIPROJECT.DBO.PRODUCTST P
RIGHT OUTER JOIN TDIPROJECT.DBO.ORDERDETAILST R
ON P. PRODUCTID = R . PRODUCTID


	--Display the names of customers and the total amount spent on orders. Include customers who haven't placed any orders.

SELECT C. NAME, SUM (O.TOTALAMOUNT) AS TOTALamountSPENT
FROM TDIPROJECT.DBO.ORDERST o
RIGHT OUTER JOIN TDIPROJECT.DBO.CUSTOMERST C
ON c.customerid = o.customerid
group by c.name
order by c.name

--List all orders and their associated products. Include orders without products.

SELECT R. ORDERID , P. PRODUCTNAME
FROM TDIPROJECT.DBO.ORDERDETAILST R
RIGHT OUTER JOIN TDIPROJECT.DBO.PRODUCTST P
ON R. PRODUCTID = P. PRODUCTID

	--Show the product names and quantities ordered. Include products without orders


SELECT R. QUANTITY  AS QUANTITYORDERED , P. PRODUCTNAME
FROM TDIPROJECT.DBO.PRODUCTST P
RIGHT OUTER JOIN TDIPROJECT.DBO.ORDERDETAILST R
ON P. PRODUCTID = R. PRODUCTID


----LEFT OUTER JOIN	
--Show all customers along with their orders. Include customers who haven't placed any orders.

 SELECT C. CUSTOMERID, C. NAME, O. ORDERID, O. ORDERDATE, O. TOTALAMOUNT
 FROM TDIPROJECT.DBO.CUSTOMERST C
LEFT OUTER JOIN TDIPROJECT.DBO.ORDERST O
ON C. CUSTOMERID = O . CUSTOMERID

	---Display the names of customers and the total amount spent on orders. Include customers who haven't placed any orders, showing "0" as the total amount for them.

	SELECT C. NAME, COALESCE(SUM (O.TOTALAMOUNT) , '0' ) AS TOTALAMOUNT
FROM TDIPROJECT.DBO.CUSTOMERST C
LEFT OUTER JOIN TDIPROJECT.DBO.ORDERST O
ON c.customerid = o.customerid
group by c.name
order by c.name

	--List all orders and their associated products. Include orders without products.

	SELECT R. ORDERID , P. PRODUCTNAME
FROM TDIPROJECT.DBO.ORDERDETAILST R
LEFT OUTER JOIN TDIPROJECT.DBO.PRODUCTST P
ON R. PRODUCTID = P. PRODUCTID

---Show the product names and quantities ordered. Include products without orders, displaying "0" as the quantity for them.

SELECT COALESCE (R. QUANTITY , 0) AS QUANTITYORDERED , P. PRODUCTNAME
FROM TDIPROJECT.DBO.PRODUCTST P
LEFT OUTER JOIN TDIPROJECT.DBO.ORDERDETAILST R
ON P. PRODUCTID = R. PRODUCTID


--FULL OUTER JOIN

---	List all orders along with the names of the customers who made them. Include orders without customers and customers without orders.


SELECT C . NAME, O. ORDERID
FROM TDIPROJECT.DBO.ORDERST O
FULL OUTER JOIN TDIPROJECT.DBO.CUSTOMERST C
ON O. CUSTOMERID = C. CUSTOMERID

---	Show all products along with the order details. Include products that haven't been ordered and order details without products.

SELECT *
FROM TDIPROJECT.DBO.PRODUCTST P
FULL OUTER JOIN TDIPROJECT.DBO.ORDERDETAILST O
ON O. PRODUCTID = P. PRODUCTID
ORDER BY P. PRODUCTID

---Display the names of customers and the total amount spent on orders. Include customers who haven't placed any orders and the total amount spent for orders without customers

   SELECT C. NAME, COALESCE(SUM (O.TOTALAMOUNT) , '0' ) AS TOTALAMOUNT , C.CUSTOMERID , O. ORDERID
FROM TDIPROJECT.DBO.CUSTOMERST C
FULL OUTER JOIN TDIPROJECT.DBO.ORDERST O
ON O. CUSTOMERID = C. CUSTOMERID
GROUP BY C.NAME , C. CUSTOMERID , O. ORDERID
ORDER BY TOTALAMOUNT

---	List all orders and their associated products. Include orders without products and products without orders

SELECT O.ORDERID, R.PRODUCTID, P.PRODUCTNAME, R.QUANTITY
FROM TDIPROJECT.DBO.ORDERST O
FULL OUTER JOIN TDIPROJECT.DBO.ORDERDETAILST R
ON O.ORDERID = R.ORDERID
FULL OUTER JOIN TDIPROJECT.DBO.PRODUCTST P
ON R. PRODUCTID = P. PRODUCTID
ORDER BY P. PRODUCTID 

--UNION

---	Combine the names of all customers from the "Customers" table with the names of all products from the "Products" table.
SELECT NAME
FROM TDIPROJECT.DBO.CUSTOMERST C
UNION

SELECT PRODUCTNAME
FROM TDIPROJECT.DBO.PRODUCTST C

 ---	Merge the lists of unique product names from the "Products" table with the order IDs from the "Orders" table.

 SELECT DISTINCT ProductName AS ID_ITEM
FROM TDIPROJECT.DBO.PRODUCTST

UNION

SELECT DISTINCT CAST(OrderID AS VARCHAR)  AS ID_ITEM 
FROM TDIPROJECT.DBO.ORDERST

---Create a unified list of order dates from the "Orders" table and the customer names from the "Customers" table.

SELECT CAST(OrderDate AS VARCHAR) AS UnifiedList
FROM TDIPROJECT.DBO.ORDERST 

UNION

SELECT Name AS UnifiedList
FROM TDIPROJECT.DBO.CUSTOMERST

---Combine the results of two queries: one selecting customer names from the "Customers" table and another selecting order dates from the "Orders" table, showing all instances, even duplicates


SELECT Name AS Two_queries
FROM TDIPROJECT.DBO.CUSTOMERST

UNION 

SELECT ProductName AS Two_queries
FROM TDIPROJECT.DBO.PRODUCTST 

--UNION ALL
--Concatenate all product names from the "Products" table with all order IDs from the "Orders" table, including duplicates.


SELECT PRODUCTNAME AS CONCATENATED
FROM TDIPROJECT.DBO.PRODUCTST

UNION ALL

SELECT CAST(ORDERID AS VARCHAR) AS CONCATENATED
FROM TDIPROJECT.DBO.ORDERST
