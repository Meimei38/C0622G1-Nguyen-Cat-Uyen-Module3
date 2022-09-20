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

select hd.ma_hop_dong, nv.ho_ten as nhan_vien, kh.ho_ten as khach_hang, kh.so_dien_thoai, 
dv.ten_dich_vu, dv.ma_dich_vu, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong as hd 
left join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
where ((quarter(hd.ngay_lam_hop_dong) = 4) and (year (hd.ngay_lam_hop_dong) = 2020))
and (dv.ma_dich_vu not in 
(select dv.ma_dich_vu from dich_vu as dv 
join hop_dong as hd on dv.ma_dich_vu = hd.ma_dich_vu
where (quarter(hd.ngay_lam_hop_dong) in (1,2)) and (year (hd.ngay_lam_hop_dong) = 2021)
)
)
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
-- dùng >= all

select dvdk.*, sum(hdct.so_luong) as so_luong_dich_vu_di_kem from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group  by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) >= all (select sum(hdct.so_luong) as so_luong_dich_vu_di_kem from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group  by hdct.ma_dich_vu_di_kem);

/* cách tạo view ảo (view ảo > all > view thật), không nên sử dụng view thật vì tốn bộ nhớ, 
dùng view ảo xong câu truy vấn sẽ tự xóa

select dvdk.*, sum(hdct.so_luong) as so_luong_dich_vu_di_kem from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group  by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (select max(so_luong_dich_vu_di_kem) from 
(select sum(hdct.so_luong) as so_luong_dich_vu_di_kem from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group  by hdct.ma_dich_vu_di_kem) as view_ne);
*/

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, dv.ten_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong as hd
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) =1
order by hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, nv.so_dien_thoai, nv.dia_chi, bp.ten_bo_phan from nhan_vien as nv
join bo_phan as bp on nv.ma_bo_phan = bp.ma_bo_phan
join trinh_do as td on nv.ma_trinh_do = td.ma_trinh_do
join hop_dong as hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having count(hd.ma_hop_dong) <4
order by hd.ma_nhan_vien;






