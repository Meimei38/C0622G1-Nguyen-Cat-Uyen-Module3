use co_so_du_lieu_furama;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

update nhan_vien as nv
set trang_thai_hien_thi = 1
where nv.ma_nhan_vien not in ( select hd.ma_nhan_vien from hop_dong as hd
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by hd.ma_nhan_vien);

select * from nhan_vien where trang_thai_hien_thi = 0;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ.

update khach_hang as kh
set ma_loai_khach = 1
where ma_khach_hang in
(select ma_khach_hang from task_5 
where (year(ngay_lam_hop_dong) = 2021)
and (ma_loai_khach = 2)
group by ma_khach_hang
having sum(tong_tien) > 1000000);

select * from khach_hang;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

update khach_hang 
set trang_thai_hien_thi = 1
where ma_khach_hang in (
select hd.ma_khach_hang from hop_dong as hd
where year(hd.ngay_lam_hop_dong) < 2021
group by ma_khach_hang);

select * from khach_hang 
where trang_thai_hien_thi = 0;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem as dvdk
set dvdk.gia = (dvdk.gia *2)
where dvdk.ma_dich_vu_di_kem in (
select hdct.ma_dich_vu_di_kem from hop_dong_chi_tiet as hdct
join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
where (year(hd.ngay_lam_hop_dong) = 2020) and (hdct.so_luong >10)
group by hdct.ma_dich_vu_di_kem);

select * from dich_vu_di_kem;
 
 -- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
 -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
 select 'nhan vien' as type,  ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
 from nhan_vien 
 where nhan_vien.trang_thai_hien_thi = 0
 union all
 select 'khach_hang' as type, ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
 from khach_hang
 where khach_hang.trang_thai_hien_thi = 0;
 









