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





