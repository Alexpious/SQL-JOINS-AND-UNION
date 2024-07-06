Sales Data Analysis Project Using Joins and Union

Project Overview:
This project involves analyzing sales data using joins and union operations in SQL. The tables provided for this project are:

Product Table: Contains ProductID, ProductName, and Price.

OrderDetails Table: Contains OrderID, ProductID, and Quantity.

Order Table: Contains OrderID, CustomerID, OrderDate, and TotalAmount.

Customer Table: Contains CustomerID, Name, Email, and Phone.

The goal of this project is to answer specific questions about the sales data using various types of joins and the union operation. The SQL queries and their results are included in the SQL file in this repository.

What Are Joins and Union?

Joins

Joins are used in SQL to combine rows from two or more tables based on a related column.

Inner Join: Combines rows from two tables where the related column matches in both tables. If there's no match, the row is not included.

Left Join (or Left Outer Join): Returns all rows from the left table and the matched rows from the right table. If there's no match, the result is NULL from the right table.

Right Join (or Right Outer Join): Returns all rows from the right table and the matched rows from the left table. If there's no match, the result is NULL from the left table

Full Join (or Full Outer Join): Returns rows when there is a match in one of the tables. If there's no match, the result is NULL from the table without a match.

Union

Union is used to combine the results of two or more SELECT statements. Each SELECT statement within the UNION must have the same number of columns in the result sets with similar data types.

Project Content

SQL File: Contains the SQL queries used to answer the project questions using joins and union operations.

Questions: The specific questions that were answered using these SQL operations.

For any questions or feedback, feel free to reach out.
