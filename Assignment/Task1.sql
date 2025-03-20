--create new database
CREATE DATABASE TechShop;

USE TechShop;

-- Table for Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- Table for Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description TEXT,
    Price INT
);

-- Table for Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table for Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert records into the Customers table for TechShop
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'Ravi', 'Sharma', 'ravi.sharma@email.com', '9876543210', '123 Ashok Nagar'),
(2, 'Priya', 'Gupta', 'priya.gupta@email.com', '8765432109', '456 MG Road'),
(3, 'Amit', 'Patel', 'amit.patel@email.com', '7654321098', '789 Parsi Colony'),
(4, 'Neha', 'Mehta', 'neha.mehta@email.com', '6543210987', '101 Kaveri Lane'),
(5, 'Suresh', 'Kumar', 'suresh.kumar@email.com', '5432109876', '202 Banjara Hills'),
(6, 'Anjali', 'Reddy', 'anjali.reddy@email.com', '4321098765', '303 MG Nagar'),
(7, 'Vikas', 'Singh', 'vikas.singh@email.com', '3210987654', '404 Juhu Beach'),
(8, 'Pooja', 'Iyer', 'pooja.iyer@email.com', '2109876543', '505 Sea View Road'),
(9, 'Rajesh', 'Joshi', 'rajesh.joshi@email.com', '1098765432', '606 Pali Hill'),
(10, 'Sneha', 'Nair', 'sneha.nair@email.com', '1029384756', '707 Andheri East');

-- Insert records into the Products table for TechShop
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', 'A high-performance laptop for gaming and work', 799),
(2, 'Smartphone', 'Latest smartphone with a large screen', 499),
(3, 'Tablet', 'Compact tablet for reading and media', 299),
(4, 'Headphones', 'Noise-cancelling wireless headphones', 99),
(5, 'Smartwatch', 'Wearable smartwatch with health tracking', 149),
(6, 'Camera', 'High-resolution digital camera for photography', 599),
(7, 'Printer', 'All-in-one wireless printer for home and office use', 149),
(8, 'Keyboard', 'Mechanical keyboard with RGB lighting for gaming', 89),
(9, 'Mouse', 'Ergonomic wireless mouse with precision', 29),
(10, 'External Hard Drive', '1TB external storage for backups', 69);

-- Insert records into the Orders table for TechShop
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2025-03-01 12:30:00', 899),
(2, 2, '2025-03-02 15:00:00', 550),
(3, 3, '2025-03-05 10:00:00', 1200),
(4, 4, '2025-03-10 18:45:00', 350),
(5, 5, '2025-03-12 09:20:00', 100),
(6, 6, '2025-03-15 11:15:00', 200),
(7, 7, '2025-03-18 14:00:00', 650),
(8, 8, '2025-03-20 13:00:00', 230),
(9, 9, '2025-03-22 16:30:00', 1400),
(10, 10, '2025-03-25 17:45:00', 300);

-- Insert records into the OrderDetails table for TechShop
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 4, 1),
(3, 2, 2, 1),
(4, 2, 5, 1),
(5, 3, 3, 2),
(6, 3, 6, 1),
(7, 4, 7, 1),
(8, 4, 8, 1),
(9, 5, 4, 1),
(10, 6, 2, 1),
(11, 6, 5, 1),
(12, 7, 1, 2),
(13, 7, 9, 1),
(14, 8, 3, 1),
(15, 9, 1, 1),
(16, 9, 6, 1),
(17, 10, 8, 2);

-- Insert records into the Inventory table for TechShop
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 50, '2025-03-01 12:30:00'),
(2, 2, 30, '2025-03-02 14:00:00'),
(3, 3, 40, '2025-03-03 16:15:00'),
(4, 4, 100, '2025-03-04 10:45:00'),
(5, 5, 75, '2025-03-05 11:30:00'),
(6, 6, 20, '2025-03-06 13:00:00'),
(7, 7, 60, '2025-03-07 09:20:00'),
(8, 8, 90, '2025-03-08 15:10:00'),
(9, 9, 80, '2025-03-09 17:05:00'),
(10, 10, 150, '2025-03-10 12:00:00');
