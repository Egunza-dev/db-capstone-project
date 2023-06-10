/* Create a stored procedure that displays the maximum ordered quantity in the orders tables. */
USE `LittleLemon`;
DROP procedure IF EXISTS `GetMaxQuantity`;

DELIMITER $$
USE `LittleLemon`$$
CREATE PROCEDURE `GetMaxQuantity` ()
BEGIN
SELECT MAX(Quantity) AS "Maximum Quantity"
FROM Orders;
END$$

DELIMITER ;

/* Create a prepared statement called GetOrderDetail which should accept one input argument, the CustomerID value, 
   from a variable. The statement should return the order id, the quantity and the order cost from the Orders table.*/
USE `LittleLemon`;
/* PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?'; */

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


/* Create a stored procedure called CncelOrder to be used to delete an order record based on the user input
   of the order id. */
USE `LittleLemon`;
DROP procedure IF EXISTS `CancelOrder`;

DELIMITER $$
USE `LittleLemon`$$
CREATE PROCEDURE `CancelOrder` (IN order_id INT)
BEGIN
DELETE FROM Orders WHERE OrderID = order_id;
END$$

DELIMITER ;


