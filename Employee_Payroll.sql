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
