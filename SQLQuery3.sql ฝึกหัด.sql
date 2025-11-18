CREATE TABLE Employee
(
    EmpID      char(4)       NOT NULL,
    FirstName  nvarchar(30)  NOT NULL,
    LastName   nvarchar(30)  NOT NULL,
    Address    nvarchar(50)  NOT NULL,
    HireDate   datetime      NOT NULL,
    Position   nvarchar(30)  NOT NULL,
    Salary     smallmoney    NOT NULL,
    EndDate    datetime      NULL,

    CONSTRAINT PK_Employee PRIMARY KEY (EmpID),
    CONSTRAINT AK_EmpName  UNIQUE (FirstName, LastName),
    CONSTRAINT CK_Salary   CHECK (Salary < 100000)
);


CREATE TABLE SaleOrder 
( 
  OrderID int IDENTITY(101, 1) NOT NULL, 

  CustID char(4) NOT NULL, 
  EmpID  char(4) NOT NULL, 

  OrderDate datetime NOT NULL 
      CONSTRAINT DF_OrderDate DEFAULT GETDATE(), 

  RequiredDate datetime NOT NULL, 
  ShippedDate  datetime NULL, 

  ModifiedDate datetime NOT NULL 
      CONSTRAINT DF_ModifiedDate DEFAULT GETDATE(), 

  EndDate datetime NULL, 

  CONSTRAINT PK_Order PRIMARY KEY(OrderID), 

  CONSTRAINT FK_Order_Employee FOREIGN KEY (EmpID) 
      REFERENCES Employee (EmpID)
);
EXEC sp_help 'SaleOrder';
SELECT * FROM Employee;

INSERT INTO Employee (EmpID, FirstName, LastName, Address, HireDate, Position, Salary, EndDate)
VALUES 
('E101', 'Steve', 'Rogers', '345 Street Ave', '2021-01-12', 'Manager',     60000, NULL),
('E201', 'Natasha','Romanoff', '10 Main Road', '2020-03-05', 'Assistant', 35000, NULL),
('E301', 'Sam',   'Wilson', '1205 Link St', '2023-01-01', 'Staff',        22000, NULL),
('E302', 'Tony',  'Stark',  '87 Avenue Rd', '2022-05-30', 'Supervisor',   45000, NULL);

INSERT INTO SaleOrder
(CustID, EmpID, OrderDate, RequiredDate, ShippedDate, ModifiedDate, EndDate)
VALUES
('C001', 'E302', DEFAULT, '2021-01-10', NULL, DEFAULT, NULL),
('C002', 'E301', DEFAULT, '2021-02-15', NULL, DEFAULT, NULL),
('C003', 'E101', DEFAULT, '2021-03-18', NULL, DEFAULT, NULL),
('C004', 'E201', DEFAULT, '2021-04-25', NULL, DEFAULT, NULL);



