-- UC1
create database payroll_services;
show databases;
use payroll_service;
-- UC2
create table employee_payroll
( id int not null auto_increment ,
name varchar(50) not null,
salary Double not null,
startDate Date not null,
primary key(id)
);

desc employee_payroll;
select * from employee_payroll;


-- UC3
insert into employee_payroll (name,salary,startDate)
values('Ned', 3800, '2022-01-10');

insert into employee_payroll (name,salary,startDate)
values('Jamie', 3000, '2022-04-10');

insert into employee_payroll (name,salary,startDate)
values('Tyron', 5000, '2021-02-20');

insert into employee_payroll (name,salary,startDate)
values('Jon', 5000, '2021-03-10');

-- UC4
select * from employee_payroll;

-- UC5
select * from employee_payroll where
Salary > 3000;

select * from employee_payroll where
StartDate BETWEEN CAST('2022-01-01' AS DATE) AND Date(now());


-- UC6
alter table employee_payroll add gender char(1) not null;
update employee_payroll
set gender = 'M'
where id > 0;

select * from employee_payroll;

insert into employee_payroll (name,salary,startDate,gender)
values('Sansa', 3000, '2022-03-10','F');
insert into employee_payroll (name,salary,startDate,gender)
values('Cersi', 2000, '2021-03-10','F');

select * from employee_payroll;

-- UC-7
select sum(salary) from employee_payroll
Where gender = 'M' group by gender;

select avg(salary) from employee_payroll
Where gender = 'M' group by gender;

select min(salary) from employee_payroll
Where gender = 'M' group by gender;

select count(salary) from employee_payroll
Where gender = 'M' group by gender;

select max(salary) from employee_payroll
Where gender = 'M' group by gender;

-- UC-8
use payroll_service;
select * from employee_payroll;

ALTER TABLE employee_payroll ADD phoneNo BIGINT;
UPDATE employee_payroll SET phoneNo = '99999999' 
where id = 1;
ALTER table employee_payroll ADD empAddress VARCHAR(100) NOT NULL DEFAULT 'INDIA';
ALTER TABLE employee_payroll ADD dept VARCHAR(30) NOT NULL DEFAULT 'Research';
select * from employee_payroll;


-- UC9 
ALTER TABLE employee_payroll RENAME COLUMN salary TO BasicPay;
ALTER TABLE employee_payroll ADD Deductions FLOAT NOT NULL DEFAULT 0.00;
ALTER TABLE employee_payroll ADD TaxablePay FLOAT NOT NULL DEFAULT 0.00;
ALTER TABLE employee_payroll ADD IncomeTax FLOAT NOT NULL DEFAULT 0.00;
ALTER TABLE employee_payroll ADD NetPay FLOAT NOT NULL DEFAULT 0.00;

UPDATE employee_payroll SET NetPay = (BasicPay - Deductions - TaxablePay - IncomeTax);
SET SQL_SAFE_UPDATES = 0; -- turns off safe update mode
SET SQL_SAFE_UPDATES = 1; -- turns on safe update mode

-- UC10 Adding Department Cersi as Sales & Marketing Both
UPDATE employee_payroll SET dept = 'Sales' WHERE name = 'Cersi';
select * from employee_payroll;
INSERT INTO employee_payroll 
VALUES
(7,'Cersi',2000,'2021-03-10','F',NULL,'INDIA','Marketing',0.00,0.00,0.00,6000);


-- UC11 Creating ER Diagrams
-- Employee Table, Company Table, Payroll Table, Department Table(For Joining many to many Relationship), Employee Department Table will be the entities.
DROP TABLE employee_payroll;
-- Creating Company Table
CREATE TABLE CompanyTable
(
CompanyID INT NOT NULL AUTO_INCREMENT,
CompanyName VARCHAR(100),
PRIMARY KEY (CompanyID)
);

INSERT INTO CompanyTable
VALUES
(1,'APE AUTO'),(2,'BPL INDIA');

SELECT * FROM CompanyTable;

CREATE TABLE EmployeeTable
(
EmployeeID int not null auto_increment PRIMARY KEY,
CompanySelect INT,
EmployeeName VARCHAR(20) NOT NULL,
Gender CHAR(1) NOT NULL,
PhoneNo BIGINT,
EmployeeAddress VARCHAR(150),
StartDate DATE NOT NULL,
FOREIGN KEY (CompanySelect) REFERENCES CompanyTable(CompanyID)
);
SELECT * FROM EmployeeTable;

INSERT INTO EmployeeTable
VALUES
(1,1,'Rocky','M',1234567671,'Starks North','2018-09-15'),
(2,1,'Jon','M',9876543243,'Starks  Banner','2019-09-15'),
(3,2,'Robr','M',3214567893,'Starks Hound','2020-05-12'),
(4,2,'Arya','F',3456781289,'Starks South','2016-05-09');

-- PayRoll Table Entity
CREATE TABLE PayrollTable
(
BasicPay FLOAT NOT NULL DEFAULT 0.00,
Deductions FLOAT NOT NULL DEFAULT 0.00,
TaxablePay FLOAT,
IncomeTax FLOAT NOT NULL DEFAULT 0.00,
NetPay FLOAT,
EmployeeSelect INT,
FOREIGN KEY (EmployeeSelect) REFERENCES EmployeeTable(EmployeeID)
);
SELECT * FROM PayrollTable;

INSERT INTO PayrollTable(BasicPay,Deductions,IncomeTax,EmployeeSelect)
VALUES
(200000,20000,10000,1),
(180000,18000,9000,2),
(250000,25000,12500,3),
(300000,30000,15000,4);

-- Updating Values of Deriving Attribute in Payroll Table
UPDATE PayrollTable SET TaxablePay = (BasicPay - Deductions);
UPDATE PayrollTable SET NetPay = (TaxablePay - IncomeTax);
SELECT * FROM PayrollTable;

CREATE TABLE DepartmentTable
(
DepartmentID INT NOT NULL auto_increment,
DepartmentName VARCHAR(100),
primary key(DepartmentID)
);
SELECT * FROM DepartmentTable;

INSERT INTO DepartmentTable(DepartmentName)
VALUES
('Sales'),('Marketing'),('Research'),('HR');

CREATE TABLE EmployeeDepartmentTable
(
EmployeeSelect INT,
DepartmentSelect INT,
FOREIGN KEY (EmployeeSelect) REFERENCES EmployeeTable(EmployeeID),
FOREIGN KEY (DepartmentSelect) REFERENCES DepartmentTable(DepartmentID)
);
SELECT * FROM EmployeeDepartmentTable;

INSERT INTO EmployeeDepartmentTable
VALUES
(1,1),(2,2),(3,2),(4,3),(4,4);

