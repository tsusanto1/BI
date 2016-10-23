CREATE DATABASE CheesecakeFactoryDB
GO

USE CheesecakeFactoryDB;
GO

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Gender varchar(10) NOT NULL,
  Birthdate date NOT NULL,
  Address varchar(70) NOT NULL,
  City varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  ZIP smallint NOT NULL);

  CREATE TABLE Sales(
  SalesID bigint NOT NULL PRIMARY KEY,
  SalesDate timestamp NOT NULL,
  SalesTotalAmount money NOT NULL );

  CREATE TABLE SalesDetail(
  SalesDetailID bigint NOT NULL PRIMARY KEY,
  OrderQuantity smallint NOT NULL);

  CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  Address varchar(70) NOT NULL,
  City varchar (50) NOT NULL,
  State varchar (50) NOT NULL,
  ZIP smallint NOT NULL);

  CREATE TABLE Dish(
  DishID bigint NOT NULL PRIMARY KEY,
  DishName varchar(100) NOT NULL,
  UnitPrice money NOT NULL);

  CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  Lastname varchar (50) NOT NULL,
  Gender varchar (10) NOT NULL,
  Birthdate date NOT NULL,
  Address varchar (100) NOT NULL,
  City varchar (50) NOT NULL,
  State varchar (50) NOT NULL,
  ZIP smallint NOT NULL);

  CREATE TABLE Job(
  JobID bigint NOT NULL PRIMARY KEY,
  JobName varchar (50) NOT NULL);
   
CREATE TABLE Ingredients(
IngredientID bigint NOT NULL PRIMARY KEY,
IngredientName varchar (70) NOT NULL,
AmountofIngredient smallint NOT NULL,
Measurement varchar (20) NOT NULL);

CREATE TABLE Supplier(
SupplierID bigint NOT NULL PRIMARY KEY,
SupplierName varchar (70) NOT NULL,
Address varchar (100) NOT NULL,
City varchar (50) NOT NULL,
State varchar (50) NOT NULL,
ZIP smallint NOT NULL);

ALTER TABLE Sales 
ADD CONSTRAINT FK_Sales_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
Go

INSERT INTO Customer (CustomerID, FirstName, LastName, Gender, Birthdate, Address, City, State, ZIP) VALUES
(1, 'Josephine', 'Boenawan', 'Female', '05-22-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(2, 'Theresia', 'Susanto', 'Female', '09-13-1996', '300 2nd Ave', 'Needham', 'MA','02494'),
(3, 'Amanda', 'Chrisanty', 'Female', '09-03-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(4, 'Gianca', 'Devina', 'Female', '12-28-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(5, 'Regina', 'Pranata', 'Female', '03-31-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(6, 'Adeline', 'Cherissa', 'Female', '04-30-1994', '231 Forest Street', 'Wellesley', 'MA', '02481'),
(7, 'John', 'Smith', 'Male', '08-17-1993', '231 Forest Street', 'Wellesley', 'MA', '02481'),
(8, 'Kevin', 'Santoso', 'Male', '12-02-1994', '325 Speen Street', 'Natick', 'MA', '01760'),
(9, 'Abel', 'Veraldi', 'Male', '03-21-1994', '1 Leighton Street', 'Cambridge', 'MA', '02141'),
(10, 'Conrad', 'Edrick', 'Male', '01-27-1994', '300 2nd Ave', 'Needham', 'MA', '02494'),
(11, 'Handi', 'Herman', 'Male', '03-15-1994', '325 Speen Street', 'Natick', 'MA', '01760');

INSERT INTO Employee (EmployeeID, FirstName, Lastname, Gender, Address, City, State, ZIP, Birthdate) VALUES
(1, 'Cady', 'Heron', 'Female', '374 Hillside Drive', 'San Diego', 'MA', '92114', '01-17-1974'),
(2, 'Regina', 'George', 'Female', '660 Washington Street', 'Boston', 'MA', '02111', '09-28-1959'),
(3, 'Gretchen', 'Wieners', 'Female', '651 Kapkowski Road', 'Elizabeth', 'NJ', '07201', '08-05-1986'),
(4, 'Janis', 'Ian', 'Female', '99 Needham Street', 'Newton', 'MA', '02461', '07-10-1982'),
(5, 'Aaron', 'Samuels', 'Male', '12 Lisbon Str5eet', 'Providence', 'RI', '02908', '03-11-1988'),
(6, 'Karen', 'Smith', 'Female', '1433 14th Street', 'Santa Monica', 'CA', '90404', '04-16-1990'),
(7, 'Kevin', 'Gnapoor', 'Male', '22 Harvey Court', 'Irvine', 'CA', '92617', '07-18-1987'),
(8, 'Chuck', 'Bass', 'Male', '937 Jefferson Street NorthWest', 'Atlanta', 'GA', '30344', '08-02-1990'),
(9, 'Blair', 'Waldorf', 'Female', '1070 Grant Terrace SouthEast', 'Atlanta', 'GA', '30315', '11-12-1984'),
(10, 'Nate', 'Archibald', 'Male', '2107 Lincoln Ave', 'Fort Worth', 'TX', '76164', '09-31-1982'),
(11, 'Serena', 'VanderWoodsen', 'Female', '1703 Westover Road', 'Austin', 'TX', '78703', '05-19-1979');

INSERT INTO Store (StoreID, Address, City, State, ZIP) VALUES
(1, '199 Boylston Street', 'Chestnut Hill', 'MA', '02467'),
(2, '115 Huntington Avenue', 'Boston', 'MA','02199'),
(3, '3393 Peachtree Road NorthEast', 'Atlanta', 'GA', '30326'),
(4, '395 Santa Monica Place', 'Santa Monica', 'CA', '90401'),
(5, '600 Spectrum Center Drive', 'Irvine', 'CA', '92618'),
(6, '789 W Harbor Drive', 'San Diego', 'CA', '92101'),
(7, '94 Providence Place', 'Providence', 'RI', '02903'),
(8, '2901 S Capital of Texas Highway', 'Austin', 'TX', '78746'),
(9, '30 Mall Drive West', 'Jersey City', 'NJ', '07310'),
(10,'4400 Ashford-Dunwoody Road', 'Atlanta', 'GA', '30346'),
(11,'455 Commerce Street', 'Fort Worth', 'TX', '76102');

INSERT INTO Customer (CustomerID, FirstName, LastName, Gender, Birthdate, Address, City, State, ZIP) VALUES
(1, 'Josephine', 'Boenawan', 'Female', '05-22-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(2, 'Theresia', 'Susanto', 'Female', '09-13-1996', '300 2nd Ave', 'Needham', 'MA','02494'),
(3, 'Amanda', 'Chrisanty', 'Female', '09-03-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(4, 'Gianca', 'Devina', 'Female', '12-28-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(5, 'Regina', 'Pranata', 'Female', '03-31-1996', '300 2nd Ave', 'Needham', 'MA', '02494'),
(6, 'Adeline', 'Cherissa', 'Female', '04-30-1994', '231 Forest Street', 'Wellesley', 'MA', '02481'),
(7, 'John', 'Smith', 'Male', '08-17-1993', '231 Forest Street', 'Wellesley', 'MA', '02481'),
(8, 'Kevin', 'Santoso', 'Male', '12-02-1994', '325 Speen Street', 'Natick', 'MA', '01760'),
(9, 'Abel', 'Veraldi', 'Male', '03-21-1994', '1 Leighton Street', 'Cambridge', 'MA', '02141'),
(10, 'Conrad', 'Edrick', 'Male', '01-27-1994', '300 2nd Ave', 'Needham', 'MA', '02494'),
(11, 'Handi', 'Herman', 'Male', '03-15-1994', '325 Speen Street', 'Natick', 'MA', '01760');