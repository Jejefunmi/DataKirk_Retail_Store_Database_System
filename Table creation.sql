----- Creating Customer Table
    CREATE TABLE Customers (
        CustomersID int PRIMARY KEY,
        FirstName VARCHAR(100) Unique,
        LastName VARCHAR(100) Unique,
        Email VARCHAR(50) UNIQUE,
        Phone VARCHAR(15),
        Address VARCHAR(100),
        City VARCHAR(50),
        State VARCHAR(50),
        ZipCode VARCHAR(10),
        Country VARCHAR(50)
        );

-----Category Table
    CREATE TABLE Categories (
        CategoryID int PRIMARY KEY,
        CategoryName VARCHAR(100),
        Description VARCHAR(255)
        );

-----Product Table
    CREATE TABLE Products (
        ProductID int PRIMARY KEY,
        ProductName VARCHAR(100),
        Description VARCHAR(255),
        Price INT
        CategoryID int FOREIGN KEYreferences Category (CategoryID)
    );

----SalesRepresentative Table
    CREATE TABLE SalesRepresentatives (
        SalesRepreID int PRIMARY KEY,
        FirstName VARCHAR(100),
        LastName VARCHAR(100),
        Email VARCHAR(50),
        Phone VARCHAR(15),
    );

-----SalesOrder Table
    CREATE TABLE SalesOrder(
        OrderID int PRIMARY KEY,
        OrderDate DATETIME,
        CustomerID int FOREIGN KEY references Customers (CustomersID),
        SalesRepreID int FOREIGN KEY references SalesRepresentatives (SalesRepreID),
        TotalAmount int(10)
    );
    


----Orderdetail Tables
    Create Table Orderdetails(
        OrderdetailID int Primary Key,
        OrderID int Foreign Key References SaleOrders(OrderID),
        ProductID int Foreign Key References Products (ProductID,
        Quantity INT CHECK(Quantity> 0),
        UnitPrice INT
    );

---  