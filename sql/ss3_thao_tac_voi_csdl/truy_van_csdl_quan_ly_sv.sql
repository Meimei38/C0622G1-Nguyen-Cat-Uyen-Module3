drop database if exists quan_ly_sinh_vien;
create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
id int auto_increment primary key,
class_name varchar(20),
start_date date,
class_status bit
);
create table student(
id int auto_increment primary key,
student_name varchar(50),
address varchar(50),
phone varchar(50),
student_status bit,
class_id int,
foreign key(class_id) references class(id)
);
create table `subject`(
id int auto_increment primary key,
subject_name varchar(50),
credit int,
subject_status bit

);
create table mark(
id int auto_increment primary key,
subject_id int, 
foreign key (subject_id) references `subject`(id),
student_id int,
foreign key (student_id) references student(id),
mark double,
exam_times int
);
-- Thêm dữ liệu vào class
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

-- Thêm dữ liệu vào student
INSERT INTO student (student_name, address, phone, student_status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, student_status, class_id) 
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, student_status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

-- Thêm dữ liệu vào subject
INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

-- Thêm dữ liệu vào mark
INSERT INTO `mark` (subject_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 8, 2),
       (2, 1, 12, 1);
       
-- Thực hiện truy vấn

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM student WHERE student_name LIKE 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_date) =12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set SQL_SAFE_UPDATES = 0;
update student
set class_id = 2 where student_name ="Hung";
select * from student;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student_name, subject_name, mark 
from student join mark on student.id = mark.student_id 
join subject on mark.subject_id = subject.id 
order by mark.mark desc, student_name asc;

