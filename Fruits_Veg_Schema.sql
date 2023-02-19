-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductCode VARCHAR(10),
    ProductName VARCHAR(50)
);

-- Insert 10 dummy entries into Products table
INSERT INTO Products (ProductID, ProductCode, ProductName)
VALUES 
    (101, 'P1001', 'Apple'),
    (102, 'P1002', 'Banana'),
    (103, 'P1003', 'Carrot'),
    (104, 'P1004', 'Tomato'),
    (105, 'P1005', 'Orange'),
    (106, 'P1006', 'Grapes'),
    (107, 'P1007', 'Cucumber'),
    (108, 'P1008', 'Broccoli'),
    (109, 'P1009', 'Strawberry'),
    (110, 'P1010', 'Watermelon');

-- Create Vendors table
CREATE TABLE Vendors (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(50)
);

-- Insert 10 dummy entries into Vendors table
INSERT INTO Vendors (VendorID, VendorName)
VALUES 
    (1, 'ABC Fruits'),
    (2, 'XYZ Produce'),
    (3, 'DEF Farms'),
    (4, 'GHI Gardens'),
    (5, 'JKL Orchard'),
    (6, 'MNO Produce'),
    (7, 'PQR Farms'),
    (8, 'STU Gardens'),
    (9, 'VWX Orchard'),
    (10, 'YZA Produce');

-- Create Regions table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

-- Insert 10 dummy entries into Regions table
INSERT INTO Regions (RegionID, RegionName)
VALUES 
    (1, 'North'),
    (2, 'South'),
    (3, 'East'),
    (4, 'West'),
    (5, 'Northeast'),
    (6, 'Southeast'),
    (7, 'Midwest'),
    (8, 'Southwest'),
    (9, 'Northwest'),
    (10, 'Central');

-- Create Sales table
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    VendorID INT,
    RegionID INT,
    Date DATETIME,
    Discount DECIMAL(4, 2),
    Quantity INT,
    SalesAmount DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

-- Insert 10 dummy entries into Sales table
INSERT INTO Sales (SalesID, ProductID, VendorID, RegionID, Date, Discount, Quantity, SalesAmount)
VALUES 
    (1, 101, 1, 1, '2022-01-01 08:00:00', 0.1, 5, 45.00),
    (2, 102, 2, 1, '2022-01-02 10:00:00', 0.2, 10, 80.00),
    (3, 103, 3, 2, '2022-01-03 12:00:00', 0.15, 7, 55.25),
    (4, 104, 4, 2, '2022-01-04 14:00:00', 0.25, 3, 37.50),
	(6, 106, 6, 3, '2022-01-06 16:00:00', 0.2, 12, 92.40),
	(7, 107, 7, 4, '2022-01-07 18:00:00', 0.15, 6, 47.60),
	(8, 108, 8, 4, '2022-01-08 20:00:00', 0.1, 8, 68.40),
	(9, 109, 9, 5, '2022-01-09 22:00:00', 0.3, 15, 105.00),
	(10, 110, 10, 5, '2022-01-10 08:00:00', 0.25, 20, 140.00);
