use co_so_du_lieu_furama;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.* from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong as hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quảng Ngãi')
group by ma_dich_vu_di_kem;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten as nhan_vien, kh.ho_ten as khach_hang, kh.so_dien_thoai, dv.ten_dich_vu, dv.ma_dich_vu, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong as hd 
join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
where ((quarter(hd.ngay_lam_hop_dong) = 4) and (year (hd.ngay_lam_hop_dong) = 2020))
and (dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu as dv 
join hop_dong as hd on dv.ma_dich_vu = hd.ma_dich_vu
where (quarter(hd.ngay_lam_hop_dong) in (1,2)) and (year (hd.ngay_lam_hop_dong) = 2021)))
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select * from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where count(hdct.ma_dich_vu_di_kem) = (select max(count(hdct.ma_dich_vu_di_kem)) from hop_dong_chi_tiet)
group  by hdct.ma_dich_vu_di_kem;
select kh.ma_khach_hang from khach_hang as kh
join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang;
select sum(hdct.ma_dich_vu_di_kem), ma_dich_vu_di_kem from hop_dong_chi_tiet as hdct
group  by hdct.ma_dich_vu_di_kem;

