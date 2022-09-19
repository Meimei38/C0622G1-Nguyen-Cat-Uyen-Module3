use co_so_du_lieu_furama;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where(ho_ten REGEXP '^[H,T,K]') and (CHAR_LENGTH(ho_ten) <= 15);

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *  from khach_hang 
where (timestampdiff(year,ngay_sinh, now()) between 18 and 50) and (dia_chi like '%Quảng Trị' or dia_chi like '%Đà Nẵng');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select khach_hang.*, count(hop_dong.ma_khach_hang) as so_lan_dat_phong from khach_hang 
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach like 'Diamond'
group by ma_khach_hang
order by count(hop_dong.ma_khach_hang) asc;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
-- Làm view cho dui

DROP VIEW IF EXISTS task_5;
create view task_5 as
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu,hd.ngay_lam_hop_dong, ifnull((dv.chi_phi_thue+ifnull(sum(hdct.so_luong*dvdk.gia),0)),0) as tong_tien from khach_hang as kh 
left join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by kh.ma_khach_hang, hd.ma_hop_dong;
select * from task_5;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in 
(select dv.ma_dich_vu from dich_vu dv 
join hop_dong as hd on dv.ma_dich_vu = hd.ma_dich_vu
where (quarter(hd.ngay_lam_hop_dong) = 1) 
group by dv.ma_dich_vu);

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu as dv 
inner join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong as hd on dv.ma_dich_vu = hd.ma_dich_vu
where (year(hd.ngay_lam_hop_dong)='2020') and dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu as dv
inner join hop_dong as hd on dv.ma_dich_vu = hd.ma_dich_vu
 where year(hd.ngay_lam_hop_dong)='2021')
group by dv.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cách 1:
select distinct kh.ho_ten from khach_hang as kh;

-- Cách 2:
select kh.ho_ten from khach_hang as kh
group by kh.ho_ten;

-- Cách 3: 
select kh.ho_ten from khach_hang as kh
union
select kh.ho_ten from khach_hang as kh;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hop_dong.ngay_lam_hop_dong) as thang, count(hop_dong.ma_khach_hang) as so_luong_khach from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by (month(hop_dong.ngay_lam_hop_dong)) 
order by (month(hop_dong.ngay_lam_hop_dong)) asc;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong as hd
left join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;








