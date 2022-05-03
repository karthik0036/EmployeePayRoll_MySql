-- UC1
create database payroll_services;
show databases;
use payroll_services;

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
StartDate BETWEEN '2022-01-01' AND Date(now());


-- UC6
alter table employee_payroll add gender char(1) not null;
update employee_payroll
set gender = 'M'
where id > 0;

select * from employee_payroll;

insert into employee_payroll (name,salary,startDate,gender)
values('Sansa', 3000, '2022-03-10','F');
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
