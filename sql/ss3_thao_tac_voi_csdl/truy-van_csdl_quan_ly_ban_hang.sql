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
 
 -- Thêm dữ liệu vào bảng
 -- Customer
 insert into customer (id, name, age) 
 values (1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
-- Order
insert into sale_order (id, customer_id, order_date, total_price)
values (1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);
-- Product
insert into product(id,name,price)
values (1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat', 1),
(5,'Bep Dien',2);
-- Order detail
insert into order_detail (order_id, product_id, order_quantity)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Thực hiện truy vấn
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select id, order_date, total_price from sale_order;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.name, product.name from customer
inner join sale_order on customer.id = sale_order.customer_id
inner join order_detail on sale_order.id = order_detail.order_id 
inner join product on order_detail.product_id = product.id; 
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select *from customer where customer.id not in (select customer_id from sale_order);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select sale_order.id,sale_order.order_date,SUM(order_detail.order_quantity*product.price) as total_order_price
from sale_order
inner join order_detail on sale_order.id = order_detail.order_id
inner join product on order_detail.product_id = product.id
group by sale_order.id;

 