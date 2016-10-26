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
  ZIP varchar(5) NOT NULL);

CREATE TABLE Sales(
  SalesID bigint NOT NULL PRIMARY KEY,
  SalesDate datetime NOT NULL,
  SalesTotalAmount money NOT NULL,
  CustomerID bigint NULL,
  StoreID bigint NULL);

CREATE TABLE SalesDetail(
  SalesDetailID bigint NOT NULL PRIMARY KEY,
  OrderQuantity smallint NOT NULL,
  DishID bigint NULL);

CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  Address varchar(70) NOT NULL,
  City varchar (50) NOT NULL,
  State varchar (50) NOT NULL,
  ZIP varchar(5) NOT NULL);

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
  ZIP varchar(5) NOT NULL,
  StoreID bigint NULL,
  JobID bigint NULL);

CREATE TABLE Job(
  JobID bigint NOT NULL PRIMARY KEY,
  JobName varchar (50) NOT NULL);
   
CREATE TABLE Ingredients(
IngredientID bigint NOT NULL PRIMARY KEY,
IngredientName varchar (70) NOT NULL,
AmountofIngredient varchar(10) NOT NULL,
Measurement varchar (20) NOT NULL,
SupplierID bigint NULL);

CREATE TABLE IngredientDish(
IngredientID bigint NULL,
DishID bigint NULL);

CREATE TABLE Supplier(
SupplierID bigint NOT NULL PRIMARY KEY,
SupplierName varchar (70) NOT NULL,
Address varchar (100) NOT NULL,
City varchar (50) NOT NULL,
State varchar (50) NOT NULL,
ZIP varchar(5) NOT NULL);

ALTER TABLE Sales 
ADD CONSTRAINT FK_Sales_Customer 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
Go

ALTER TABLE Sales 
ADD CONSTRAINT FK_Sales_Store
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
Go

ALTER TABLE SalesDetail
ADD CONSTRAINT FK_SalesDetail_Dish
FOREIGN KEY (DishID) REFERENCES Dish(DishID);
Go

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Store
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
Go

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Job
FOREIGN KEY (JobID) REFERENCES Job(JobID);
Go

ALTER TABLE Ingredients
ADD CONSTRAINT FK_Ingredients_Supplier
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);
Go

ALTER TABLE IngredientDish
ADD CONSTRAINT FK_IngredientDish_Ingredients
FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID);
Go

ALTER TABLE IngredientDish
ADD CONSTRAINT FK_IngredientDish_Dish
FOREIGN KEY (DishID) REFERENCES Dish(DishID);
Go


INSERT INTO Customer (CustomerID, FirstName, LastName, Gender, Birthdate, Address, City, State, ZIP) VALUES
(1, 'Josephine', 'Boenawan', 'Female', '1996-05-22', '300 2nd Ave', 'Needham', 'MA', '02494'),
(2, 'Theresia', 'Susanto', 'Female', '1996-09-13', '300 2nd Ave', 'Needham', 'MA','02494'),
(3, 'Amanda', 'Chrisanty', 'Female', '1996-09-03', '300 2nd Ave', 'Needham', 'MA', '02494'),
(4, 'Gianca', 'Devina', 'Female', '1996-12-28', '300 2nd Ave', 'Needham', 'MA', '02494'),
(5, 'Regina', 'Pranata', 'Female', '1996-03-31', '300 2nd Ave', 'Needham', 'MA', '02494'),
(6, 'Adeline', 'Cherissa', 'Female', '1994-04-30', '231 Forest Street', 'Wellesley', 'MA', '02481'),
(7, 'John', 'Smith', 'Male', '1993-08-17', '231 Forest Street', 'Wellesley', 'MA', '02481'),
(8, 'Kevin', 'Santoso', 'Male', '1994-12-02', '325 Speen Street', 'Natick', 'MA', '01760'),
(9, 'Abel', 'Velardi', 'Male', '1994-03-21', '1 Leighton Street', 'Cambridge', 'MA', '02141'),
(10, 'Conrad', 'Edrick', 'Male', '1994-01-27', '300 2nd Ave', 'Needham', 'MA', '02494'),
(11, 'Handi', 'Herman', 'Male', '1994-03-15', '325 Speen Street', 'Natick', 'MA', '01760');



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

INSERT INTO Job (JobID, JobName) VALUES
(1, 'Senior Manager'),
(2, 'Server'),
(3, 'Host'),
(4, 'Bartender'),
(5, 'Line cook'),
(6, 'Prep cook'),
(7, 'Steward'),
(8, 'Dishwasher'),
(9, 'Busser'),
(10,'Cashier');

INSERT INTO Employee (EmployeeID, FirstName, Lastname, Gender, Address, City, State, ZIP, Birthdate, StoreID, JobID) VALUES
(1, 'Cady', 'Heron', 'Female', '374 Hillside Drive', 'San Diego', 'CA', '92114', '1974-01-17','6', '2'),
(2, 'Regina', 'George', 'Female', '660 Washington Street', 'Boston', 'MA', '02111', '1959-09-28','2','5'),
(3, 'Gretchen', 'Wieners', 'Female', '651 Kapkowski Road', 'Elizabeth', 'NJ', '07201', '1986-08-05','9','8'),
(4, 'Janis', 'Ian', 'Female', '99 Needham Street', 'Newton', 'MA', '02461', '1982-07-10','1','1'),
(5, 'Aaron', 'Samuels', 'Male', '12 Lisbon Street', 'Providence', 'RI', '02908', '1988-03-11','7','9'),
(6, 'Karen', 'Smith', 'Female', '1433 14th Street', 'Santa Monica', 'CA', '90404', '1990-04-16','4','3'),
(7, 'Kevin', 'Gnapoor', 'Male', '22 Harvey Court', 'Irvine', 'CA', '92617', '1987-07-18','5','10'),
(8, 'Chuck', 'Bass', 'Male', '937 Jefferson Street NorthWest', 'Atlanta', 'GA', '30344', '1990-08-02','3','3'),
(9, 'Blair', 'Waldorf', 'Female', '1070 Grant Terrace SouthEast', 'Atlanta', 'GA', '30315', '1984-11-12','10','6'),
(10, 'Nate', 'Archibald', 'Male', '2107 Lincoln Ave', 'Fort Worth', 'TX', '76164', '1982-09-30','11','7'),
(11, 'Serena', 'VanderWoodsen', 'Female', '1703 Westover Road', 'Austin', 'TX', '78703', '1979-05-19','8','8');

INSERT INTO Dish (DishID, DishName, UnitPrice) VALUES
(1, 'Stuffed Mushrooms','$6.95'),
(2, 'Crabcakes', '$13.95'),
(3, 'Caesar Salad','$10.50'),
(4, 'Chicken Madeira', '$18.50'),
(5, 'Orange Chicken', '$16.95'),
(6, 'Chicken Piccata','$17.95'),
(7, 'Shrimp Scampi', '$19.95'),
(8, 'Herb Crusted Filet of Salmon','$19.95'),
(9, 'Cobb Salad','$14.95'),
(10,'Greek Salad', '$6.95'),
(11,'Orange Juice','$3.95'),
(12,'Coffee','$3.95'),
(13,'Fried Macaroni and Cheese','$10.20'),
(14,'Smokehouse BBQ Burger','$22.05');


INSERT INTO Sales (SalesID, SalesDate, SalesTotalAmount, CustomerID, StoreID) VALUES
(1, '2016-08-25 11:45:58', '$50.42', '1', '1'),
(2, '2016-09-13 12:31:04', '$20.18', '2', '2'),
(3, '2016-05-09 19:53:19', '$32.66', '3', '3'),
(4, '2016-06-17 14:00:23', '$69.37', '4', '4'),
(5, '2016-08-31 18:17:28', '$21.59', '5', '5'),
(6, '2016-07-06 22:15:27', '$37.25', '6', '6'),
(7, '2016-05-01 13:10:44', '$39.12', '7', '7'),
(8, '2016-10-22 19:24:37', '$27.83', '8', '8'),
(9, '2016-08-03 13:59:01', '$19.35', '9', '8'),
(10,'2016-10-19 12:59:29', '$28.13', '10','10'),
(11,'2016-08-05 17:50:38', '$41.03', '11', '11'),
(12,'2016-08-05 18:52:13', '$33.21', '3', '7'),
(13,'2016-08-05 19:23:10', '$20.57', '9', '8'),
(14,'2016-08-05 11:02:11', '$23.80', '8', '8'),
(15,'2016-08-03 11:02:18', '$11.29', '7', '9');

INSERT INTO Supplier(SupplierID, SupplierName, Address, City, State, ZIP) VALUES
(1, 'Wegmans', '200 Boylston Street', 'Chestnut Hill', 'MA', '02467'),
(2, 'Roche Bros', '338 Washington Street', 'Westwood', 'MA','02090'),
(3, 'Star', '1 Boylston Street', 'Chestnut Hill', 'MA', '02467'),
(4, 'Hannaford', '55 Russel Street', 'Waltham', 'MA', '02154'),
(5, 'Stop & Shop', '1025 Truman Pkwy', 'Hyde Park', 'MA', '02136'),
(6, 'Trader Joes', '748 Memorial Drive', 'Cambridge', 'MA', '02139'),
(7, 'Whole Foods', '77 West Paces Fairy Road NW', 'Atlanta', 'GA', '30305'),
(8, 'Shaws', '102 East Commerce Street', 'Crowell', 'TX', '79227'),
(9, 'Baza', '30 Tower Road', 'Newton Upper Falls', 'MA', '02464'),
(10,'Tropical', '450 Melnea Cass Boulevard', 'Roxbury', 'MA', '02119'),
(11,'Russo', '1150 Bern Road', 'Wyomissing', 'PA', '19610');

INSERT INTO Ingredients(IngredientID, SupplierID, IngredientName, AmountofIngredient, Measurement) VALUES
(1, 1, 'Chicken', '0.5', 'pounds'),
(2, 2, 'Lettuce', '0.5', 'pounds'),
(3, 3, 'Spaghetti', '0.25', 'pounds'),
(4, 4, 'Shrimp', '0.3', 'pounds'),
(5, 5, 'Salmon', '0.4', 'pounds'),
(6, 6, 'Mushroom', '0.2', 'pounds'),
(7, 7, 'Orange', '0.5', 'pounds'),
(8, 8, 'Coffee Beans', '0.2', 'pounds'),
(9, 9, 'Tomato', '1', 'piece'),
(10, 10, 'Crabsticks', '2', 'piece'),
(11, 11, 'White Jasmine Rice', '0.5', 'cup');


INSERT INTO IngredientDish (IngredientID, DishID) VALUES
(1,5),
(2,3),
(3,7),
(4,7),
(5,8),
(6,1),
(7,11),
(8,12),
(9,10),
(10,2),
(11,5);


INSERT INTO SalesDetail(SalesDetailID, DishID, OrderQuantity) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 4),
(7, 7, 2),
(8, 8, 3),
(9, 9, 2),
(10, 10, 1),
(11, 11, 1);