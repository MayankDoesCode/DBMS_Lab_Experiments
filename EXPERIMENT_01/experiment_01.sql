-- ============================================================================
-- EXPERIMENT 01: E-Commerce Database E-R Modeling & Relational Schema
-- Format: Executable .sql script (MySQL 8.0+)
-- Source: DBMS Practical Experiments
-- ============================================================================
-- Aim: Design an e-commerce ER diagram and create its relational tables in MySQL
--      with primary keys, foreign keys, cascading constraints, and insert
--      sample records to verify referential integrity.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- STEP 1: Database Initialization & Safe Reset
-- ----------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

-- Drop child tables first to avoid foreign key constraints violations
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Seller;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Customer;

-- ----------------------------------------------------------------------------
-- STEP 2: Table Creation with Constraints
-- ----------------------------------------------------------------------------

-- 1. Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20)
);

-- 2. Address Table (Customer Addresses)
CREATE TABLE Address (
    Address_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Address_Line VARCHAR(200),
    City VARCHAR(60),
    State VARCHAR(60),
    Postal_Code VARCHAR(15),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
);

-- 3. Seller Table
CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY AUTO_INCREMENT,
    Seller_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- 4. Category Table
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(80) NOT NULL UNIQUE
);

-- 5. Product Table
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(120) NOT NULL,
    Category_ID INT NOT NULL,
    Seller_ID INT NOT NULL,
    Product_Type VARCHAR(30),
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);

-- 6. Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Address_ID INT,
    Order_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Order_Status VARCHAR(30) DEFAULT 'Placed',
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID) ON DELETE SET NULL
);

-- 7. OrderItem Table (Weak entity / Junction table between Orders & Product)
CREATE TABLE OrderItem (
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- 8. Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL UNIQUE,
    Payment_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Method VARCHAR(30),
    Payment_Status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

-- 9. Delivery Table
CREATE TABLE Delivery (
    Delivery_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL UNIQUE,
    Tracking_Number VARCHAR(60) UNIQUE,
    Delivery_Status VARCHAR(30) DEFAULT 'Processing',
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);

-- ----------------------------------------------------------------------------
-- STEP 3: Sample Data Insertion
-- ----------------------------------------------------------------------------

-- Insert Customers
INSERT INTO Customer (Full_Name, Email, Phone) VALUES 
('Aarav Sharma', 'aarav@example.com', '9000000001'),
('Diya Singh', 'diya@example.com', '9000000002');

-- Insert Customer Addresses
INSERT INTO Address (Customer_ID, Address_Line, City, State, Postal_Code) VALUES 
(1, '12 Main Road', 'Lucknow', 'Uttar Pradesh', '226001'),
(2, '24 Park Street', 'Kanpur', 'Uttar Pradesh', '208001');

-- Insert Sellers
INSERT INTO Seller (Seller_Name, Email) VALUES 
('Tech Seller', 'seller@example.com');

-- Insert Product Categories
INSERT INTO Category (Category_Name) VALUES 
('Electronics'),
('Accessories');

-- Insert Products
INSERT INTO Product (Product_Name, Category_ID, Seller_ID, Product_Type, Price) VALUES 
('Laptop', 1, 1, 'Physical', 55000.00),
('Mouse', 2, 1, 'Physical', 700.00);

-- Insert Orders
INSERT INTO Orders (Customer_ID, Address_ID) VALUES 
(1, 1);

-- Insert Order Items
INSERT INTO OrderItem (Order_ID, Product_ID, Quantity, Unit_Price) VALUES 
(1, 1, 1, 55000.00),
(1, 2, 2, 700.00);

-- Insert Payments
INSERT INTO Payment (Order_ID, Amount, Payment_Method, Payment_Status) VALUES 
(1, 56400.00, 'UPI', 'Paid');

-- Insert Delivery Information
INSERT INTO Delivery (Order_ID, Tracking_Number, Delivery_Status) VALUES 
(1, 'TRK10001', 'Shipped');

-- ----------------------------------------------------------------------------
-- STEP 4: Verification Queries
-- ----------------------------------------------------------------------------
SELECT * FROM Customer;
SELECT * FROM Address;
SELECT * FROM Seller;
SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
SELECT * FROM Payment;
SELECT * FROM Delivery;

-- ============================================================================
-- Output (expected; run the SQL to capture your actual result):
-- Expected result: Database and tables are created; sample e-commerce rows are 
-- inserted and SELECT statements display the inserted records.
-- ============================================================================

