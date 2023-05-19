/* Create a virtual table called OrdersView that focuses 
on OrderID, Quantity and TotalCost columns within the Orders 
table for all orders with a quantity greater than 2.  *	
CREATE VIEW `LittleLemon`.`OrdersView` AS
    SELECT 
        `LittleLemon`.`Orders`.`OrderID` AS `OrderID`,
        `LittleLemon`.`Orders`.`Quantity` AS `Quantity`,
        `LittleLemon`.`Orders`.`TotalCost` AS `TotalCost`
    FROM
        `LittleLemon`.`Orders`
    WHERE
        (`LittleLemon`.`Orders`.`Quantity` > 2)


/*Extract the required information from the Customer, Orders, Menu and MenuItems table 
  by using the relevant join clausen on all customers with orders that cost more than $150.
  The result set should be sorted by the lowest cost amount.*/
SELECT c.CustomerID, CONCAT(c.FirstName, " ", c.LastName) AS CustomerName, 
o.OrderID, o.TotalCost, 
m.Name AS "Menu", mi.CourseName AS Course, mi.StarterName AS Starter
FROM Customer c
INNER JOIN Orders o INNER JOIN Menu m INNER JOIN MenuItems mi
ON c.CustomerID = o.CustomerID AND o.MenuID = m.MenuID AND m.ItemID = mi.ItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost;

/* Find all Menu items for which more than 2 orders have been placed
   Create a subquery that checks if any item quantity in the orders table is more than 2
   The outer query should be used to select hte menu name from the menu table*/
SELECT Menu.Name AS "Menu Name"
FROM Menu
WHERE MenuID = ANY (SELECT MenuID
		FROM Orders
		WHERE Quantity > 2)
 