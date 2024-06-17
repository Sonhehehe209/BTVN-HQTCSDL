
DROP TABLE IF EXISTS PhanCong;
DROP TABLE IF EXISTS DuAn;
DROP TABLE IF EXISTS NhanVien;
DROP TABLE IF EXISTS PhongBan;


CREATE TABLE PhongBan (
    MaPhongBan INT PRIMARY KEY,
    TenPhongBan VARCHAR(100) NOT NULL
);

CREATE TABLE NhanVien (
    MaNhanVien INT PRIMARY KEY,
    TenNhanVien VARCHAR(100) NOT NULL,
    NgaySinh DATE,
    DiaChi VARCHAR(200),
    SoDienThoai VARCHAR(15),
    MaPhongBan INT,
    FOREIGN KEY (MaPhongBan) REFERENCES PhongBan(MaPhongBan)
);

CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn VARCHAR(100) NOT NULL,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    MaPhongBan INT,
    FOREIGN KEY (MaPhongBan) REFERENCES PhongBan(MaPhongBan)
);

CREATE TABLE PhanCong (
    MaNhanVien INT,
    MaDuAn INT,
    NgayThamGia DATE,
    PRIMARY KEY (MaNhanVien, MaDuAn),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);


INSERT INTO PhongBan (MaPhongBan, TenPhongBan) VALUES (1, 'Phòng Kỹ Thuật');
INSERT INTO PhongBan (MaPhongBan, TenPhongBan) VALUES (2, 'Phòng Nhân Sự');


INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, DiaChi, SoDienThoai, MaPhongBan) 
VALUES (1, 'Nguyễn Văn A', '1985-05-10', '123 Đường ABC, Quận 1', '0901234567', 1);
INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, DiaChi, SoDienThoai, MaPhongBan) 
VALUES (2, 'Trần Thị B', '1990-08-15', '456 Đường XYZ, Quận 2', '0907654321', 2);


INSERT INTO DuAn (MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc, MaPhongBan) 
VALUES (1, 'Dự án Xây dựng A', '2023-01-01', '2023-12-31', 1);
INSERT INTO DuAn (MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc, MaPhongBan) 
VALUES (2, 'Dự án Phát triển B', '2023-03-01', '2023-09-30', 2);


INSERT INTO PhanCong (MaNhanVien, MaDuAn, NgayThamGia) VALUES (1, 1, '2023-01-15');
INSERT INTO PhanCong (MaNhanVien, MaDuAn, NgayThamGia) VALUES (2, 2, '2023-03-15');


SELECT NhanVien.TenNhanVien, PhongBan.TenPhongBan
FROM NhanVien
JOIN PhongBan ON NhanVien.MaPhongBan = PhongBan.MaPhongBan;


SELECT DuAn.TenDuAn, PhongBan.TenPhongBan
FROM DuAn
JOIN PhongBan ON DuAn.MaPhongBan = PhongBan.MaPhongBan;


SELECT NhanVien.TenNhanVien, DuAn.TenDuAn
FROM PhanCong
JOIN NhanVien ON PhanCong.MaNhanVien = NhanVien.MaNhanVien
JOIN DuAn ON PhanCong.MaDuAn = DuAn.MaDuAn
WHERE DuAn.TenDuAn = 'Dự án Xây dựng A';


INSERT INTO NhanVien (MaNhanVien, TenNhanVien, NgaySinh, DiaChi, SoDienThoai, MaPhongBan) 
VALUES (3, 'Phạm Văn C', '1992-11-20', '789 Đường DEF, Quận 3', '0908765432', 1);


UPDATE NhanVien
SET DiaChi = '123 Đường mới, Quận 1', SoDienThoai = '0912345678'
WHERE MaNhanVien = 1;


DELETE FROM PhanCong WHERE MaDuAn = 2;


DELETE FROM DuAn WHERE MaDuAn = 2;
