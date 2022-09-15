use quan_ly_sinh_vien;
-- Thực hiện truy vấn
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject where credit = (select max(credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject
join mark on subject.id = mark.subject_id
and mark = (select max(mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.*, avg (mark) as avarage_mark from student
join mark on student.id = mark.student_id
group by student.id
order by avg(mark) desc;