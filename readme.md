# Database Engineering Capstone Project

> Step 1 involves setting up a MySQL instance server in MySQL Workbench, then creating an ER Diagram data model and implementing it in MySQL.

### LittleLemon Database Model
![LittleLemon Database Model](LittleLemonDM.png)

### LittleLemon Database Schema
<a href="LittleLemonDB.sql" target="_blank">LittleLemon Database Schema Link</a>

![LittleLemon Database in MySQL Workbench](show_databases.png)

### Adding Sales Reports

> Create a virtual table called OrdersView that focuses on OrderID, Quantity and TotalCost columns within the Orders table for all orders with a quantity greater than 2.

![LittleLemon OrdersView in MySQL Workbench](ordersView.png)



> Extract the required information from the Customer, Orders, Menu and MenuItems table by using the relevant join clausen on all customers with orders that cost more than $150. The result set should be sorted by the lowest cost amount.

![LittleLemon query1 in MySQL Workbench](query1.png)

> Find all Menu items for which more than 2 orders have been placed. Create a subquery that checks if any item quantity in the orders table is more than 2. The outer query should be used to select hte menu name from the menu table

![LittleLemon query2 in MySQL Workbench](query2.png)

> Create a stored procedure that displays the maximum ordered quantity in the orders tables.

![LittleLemon query3 in MySQL Workbench](query3.png)

> Create a prepared statement called GetOrderDetail which should accept one input argument, the CustomerID value, 
   from a variable. The statement should return the order id, the quantity and the order cost from the Orders table.
   
![LittleLemon query4 in MySQL Workbench](query4.png)

> Create a stored procedure called CncelOrder to be used to delete an order record based on the user input
   of the order id.
   
![LittleLemon query5 in MySQL Workbench](query5.png)
