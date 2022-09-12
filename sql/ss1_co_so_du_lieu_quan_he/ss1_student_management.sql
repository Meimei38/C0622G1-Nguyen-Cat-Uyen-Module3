drop database if exists student_management;
create database student_management;
use student_management;
create table student(
id int not null primary key,
name varchar(45) default null,
age int default null,
country varchar(45) default null
);
create table teacher(
id int primary key,
name varchar(45) default null,
age int default null,
country varchar(45) default null
);
create table class(
id int not null primary key,
name varchar(45) default null
);
