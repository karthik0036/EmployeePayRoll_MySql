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