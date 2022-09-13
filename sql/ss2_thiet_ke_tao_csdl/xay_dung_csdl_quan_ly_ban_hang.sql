drop database if exists sales_management;
create database sales_management;
use sales_management;
create table customer(
id int auto_increment primary key,
name varchar(50),
age int
);
create table sale_order(
id int auto_increment primary key,
customer_id int,
foreign key (customer_id) references customer (id),
order_date date,
total_price double
);
create table product(
id int auto_increment primary key,
name varchar (50),
price double
 );
 create table order_detail(
 order_id int,
 product_id int,
 foreign key (order_id) references  sale_order (id),
 foreign key (product_id) references product (id),
 primary key (order_id, product_id),
 order_quantity int
 );