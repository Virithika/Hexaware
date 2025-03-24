USE TechShop;
-- Retrieve the names and emails of all customers
SELECT FirstName, LastName, Email FROM Customers;

-- List all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Insert a new customer record into the "Customers" table
INSERT INTO Customers (CustomerID,FirstName, LastName, Email, Phone, Address)
VALUES ('11','Amit', 'Kumar', 'amitkumar@email.com', '9876543210', '1234 New Street, City');

-- Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products
SET Price = Price * 1.10
WHERE ProductName LIKE '%Gadget%';

-- Delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables (order ID is a parameter)
-- Delete from OrderDetails first to maintain referential integrity
DELETE FROM OrderDetails WHERE OrderID = 5;

-- Now delete from Orders table
DELETE FROM Orders WHERE OrderID = 5;

-- Insert a new order into the "Orders" table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (11, 5, '2025-03-28 14:30:00', 450);

-- Update the contact information (e.g., email and address) of a specific customer in the "Customers" table (customer ID is a parameter)
UPDATE Customers
SET Email = 'newemail@email.com', Address = '5678 Updated Avenue, City'
WHERE CustomerID = 1;

-- Recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table
UPDATE Orders 
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);


-- Delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables (customer ID is a parameter)
-- Delete from OrderDetails first
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 10);

-- delete from Orders
DELETE FROM Orders WHERE CustomerID = 10;

-- Insert a new electronic gadget product into the "Products" table
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES (11, 'Wireless Earbuds', 'Bluetooth noise-canceling earbuds', 129);

--Update the orders table
--OrderStatus column should be added as it is not there
ALTER TABLE Orders ADD OrderStatus VARCHAR(20);

UPDATE Orders
SET OrderStatus = 'Shipped'
WHERE OrderID = 5;

UPDATE Orders
SET OrderStatus = 'Pending'
WHERE OrderStatus IS NULL;

-- Calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table
ALTER TABLE Customers ADD NumberOfOrders INT DEFAULT 0;

UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);

--To check the details are correct
SELECT CustomerID, FirstName, LastName, NumberOfOrders FROM Customers;

