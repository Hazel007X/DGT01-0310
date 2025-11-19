CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20)
 );
 INSERT INTO orders (customer_id, order_date, total_amount, payment_status) VALUES 
(101, '2025-11-01', 1200.00, 'Paid'),
 (102, '2025-11-01', 850.00, 'Pending'),
 (101, '2025-11-02', 640.00, 'Paid'),
 (103, '2025-11-03', 300.00, 'Cancelled');

CREATE NONCLUSTERED INDEX IX_Orders_CustomerID
ON orders(customer_id);

IF OBJECT_ID('DEPSAL', 'V') IS NOT NULL
    DROP VIEW DEPSAL;
GO

CREATE VIEW DEPSAL
AS
SELECT depno, depname, location
FROM dep
WHERE depname = 'finance'
   OR location = 'silom';
GO

IF OBJECT_ID('EMPCHECK', 'V') IS NOT NULL
    DROP VIEW EMPCHECK;
GO

CREATE VIEW EMPCHECK
AS
SELECT e.empnum,
       e.empname,
       e.position,
       e.depno
FROM employee AS e
JOIN dep AS d
    ON e.depno = d.depno
WITH CHECK OPTION;
GO

INSERT INTO dep (depno, depname, location) VALUES
('10','accounting','silom'),
('20','administration','sukumvit'),
('30','marketing','ratchada'),
('40','finance','silom'),
('50','research','sukumvit');

INSERT INTO employee(empnum,empname,hiredate,salary,position,depno,mgrno) VALUES
('1001','Anya','1992-06-12',15000,'clerk','10','1002'),
('1002','Arnon','1991-03-15',25000,'clerk','10','1003'),
('1003','Chana','1987-07-08',60000,'manager','10','2002'),
('2001','Darin','1997-07-20',27000,'clerk','20','1002'),
('2002','Gavin','1987-10-10',55000,'manager','20','2003'),
('2003','Kris','2002-01-01',30000,'clerk','20',NULL),
('3001','Sandy','1982-05-05',70000,'supervisor','30','2002'),
('3002','Tara','2001-02-01',22000,'clerk','30','3004'),
('3003','Tisha','1983-09-10',90000,'supervisor','30','3004'),
('3759','StudentName','1990-08-16',50000,'manager','40','2002');
SELECT * FROM employee;

INSERT INTO projwork(projno,empnum,hours) VALUES
('01','3001',25),
('01','3003',30),
('02','3759',40),
('03','2003',20),
('03','2001',30);
SELECT * FROM DEPSAL;







SELECT * FROM EMPCHECK;
GO
SELECT * FROM DEPSAL;
GO

EXEC sp_helpindex orders;
SELECT * FROM dep;