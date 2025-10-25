
CREATE DATABASE DO_AN_GIOVANNI;
GO
USE DO_AN_GIOVANNI;
GO



-- THƯƠNG HIỆU
CREATE TABLE THUONGHIEU(
    MaTH CHAR(5) PRIMARY KEY,
    TenTH NVARCHAR(100),
    MoTa NVARCHAR(200)
);

-- DANH MỤC
CREATE TABLE DANHMUC(
    MaDM CHAR(5) PRIMARY KEY,
    TenDM NVARCHAR(100)
);

-- SẢN PHẨM
CREATE TABLE SANPHAM(
    MaSP CHAR(5) PRIMARY KEY,
    TenSP NVARCHAR(150),
    GiaGoc DECIMAL(12,2),
    GiaGiam DECIMAL(12,2) NULL,
    MaTH CHAR(5) REFERENCES THUONGHIEU(MaTH),
    MaDM CHAR(5) REFERENCES DANHMUC(MaDM)
);

-- BIẾN THỂ
CREATE TABLE BIENTHE(
    MaBT CHAR(5) PRIMARY KEY,
    MaSP CHAR(5) REFERENCES SANPHAM(MaSP),
    Mau NVARCHAR(50),
    Size NVARCHAR(10),
    TonKho INT DEFAULT 0
);

-- KHÁCH HÀNG
CREATE TABLE KHACHHANG(
    MaKH CHAR(5) PRIMARY KEY,
    HoTen NVARCHAR(100),
    DienThoai VARCHAR(15),
    DiaChi NVARCHAR(150)
);

-- ĐƠN HÀNG
CREATE TABLE DONHANG(
    MaDH CHAR(5) PRIMARY KEY,
    MaKH CHAR(5) REFERENCES KHACHHANG(MaKH),
    NgayDat DATE DEFAULT GETDATE(),
    MaSP CHAR(5) REFERENCES SANPHAM(MaSP),
    SoLuong INT,
    ThanhTien DECIMAL(12,2)
);

/* =============== DỮ LIỆU MẪU =============== */

-- Thương hiệu
INSERT INTO THUONGHIEU VALUES
('TH01', N'Giovanni', N'Thương hiệu cao cấp Ý'),
('TH02', N'Bernini', N'Phong cách sang trọng'),
('TH03', N'Zeneton', N'Thời trang nam hiện đại'),
('TH04', N'Donna', N'Nữ thanh lịch'),
('TH05', N'GioGio', N'Phong cách năng động');

-- Danh mục
INSERT INTO DANHMUC VALUES
('DM01', N'Áo sơ mi'),
('DM02', N'Áo Polo'),
('DM03', N'Quần âu'),
('DM04', N'Túi xách'),
('DM05', N'Dây lưng'),
('DM06', N'Ví da'),
('DM07', N'Áo phông nữ'),
('DM08', N'Áo khoác'),
('DM09', N'Phụ kiện'),
('DM10', N'Áo golf');

-- Sản phẩm (20 dòng)
INSERT INTO SANPHAM VALUES
('SP01', N'Áo sơ mi nam dài tay GLS0323-1OB', 1554000, 777000, 'TH01', 'DM01'),
('SP02', N'Áo sơ mi nam dài tay GLS0325-1BB', 1554000, 777000, 'TH01', 'DM01'),
('SP03', N'Quần âu nam GPT0087-1', 1554000, 777000, 'TH03', 'DM03'),
('SP04', N'Ví da nam GPK0075-1', 998000, 499000, 'TH02', 'DM06'),
('SP05', N'Áo Polo nam GPO0091-1', 1899000, 1399000, 'TH01', 'DM02'),
('SP06', N'Dây lưng nam GBL0340-1', 2398000, 1199000, 'TH01', 'DM05'),
('SP07', N'Túi xách nữ DLD0175-1', 8080000, 4999000, 'TH04', 'DM04'),
('SP08', N'Áo golf nữ DLP0003-1OB', 998000, 499000, 'TH04', 'DM10'),
('SP09', N'Áo T-shirt nam GTS0009-1', 1398000, 699000, 'TH01', 'DM02'),
('SP10', N'Áo khoác nam GJK0005-1', 2990000, NULL, 'TH03', 'DM08'),
('SP11', N'Áo sơ mi nữ DLS0012-1', 1590000, 890000, 'TH04', 'DM01'),
('SP12', N'Quần tây nam GPT0101-2', 1790000, 1290000, 'TH03', 'DM03'),
('SP13', N'Túi xách tay nữ Donna DLD0205-1', 6990000, 4590000, 'TH04', 'DM04'),
('SP14', N'Ví cầm tay nam BCL0009-1', 1990000, NULL, 'TH02', 'DM06'),
('SP15', N'Dây lưng da nam GBL0375-1', 2490000, 1890000, 'TH01', 'DM05'),
('SP16', N'Áo phông nữ GioGio GLD1001-1', 1290000, 790000, 'TH05', 'DM07'),
('SP17', N'Áo Polo nữ DLP0007-2', 1790000, 990000, 'TH04', 'DM02'),
('SP18', N'Áo khoác gió nam GJK0020-1', 2990000, 2490000, 'TH03', 'DM08'),
('SP19', N'Túi đeo chéo nam GMB0005-1', 3590000, 2590000, 'TH02', 'DM04'),
('SP20', N'Áo golf nam GGP0010-1', 1990000, 1290000, 'TH01', 'DM10');

-- Biến thể (ít nhất 20)
INSERT INTO BIENTHE VALUES
('BT01','SP01',N'Đen','M',20),
('BT02','SP02',N'Trắng','L',15),
('BT03','SP03',N'Xanh navy','L',10),
('BT04','SP04',N'Nâu','OneSize',30),
('BT05','SP05',N'Xanh','M',25),
('BT06','SP06',N'Đen','M',22),
('BT07','SP07',N'Be','OneSize',12),
('BT08','SP08',N'Hồng','L',15),
('BT09','SP09',N'Xanh','L',18),
('BT10','SP10',N'Xám','XL',8),
('BT11','SP11',N'Trắng','S',10),
('BT12','SP12',N'Đen','L',12),
('BT13','SP13',N'Nâu','OneSize',9),
('BT14','SP14',N'Đen','OneSize',20),
('BT15','SP15',N'Nâu','OneSize',14),
('BT16','SP16',N'Hồng','M',25),
('BT17','SP17',N'Tím','L',19),
('BT18','SP18',N'Đen','XL',11),
('BT19','SP19',N'Xanh rêu','OneSize',13),
('BT20','SP20',N'Trắng','M',20);

-- Khách hàng (5 người)
INSERT INTO KHACHHANG VALUES
('KH01',N'Nguyễn Văn A','0901112233',N'12 Lê Lợi, Hà Nội'),
('KH02',N'Trần Thị B','0902223344',N'45 Nguyễn Huệ, TP.HCM'),
('KH03',N'Lê Minh C','0903334455',N'9 Nguyễn Văn Linh, Đà Nẵng'),
('KH04',N'Phạm Thảo D','0904445566',N'123 Hai Bà Trưng, Huế'),
('KH05',N'Ngô Tuấn E','0905556677',N'78 Lý Thường Kiệt, Cần Thơ');

-- Đơn hàng (5 dòng)
INSERT INTO DONHANG VALUES
('DH01','KH01',GETDATE(),'SP01',2,1554000),
('DH02','KH02',GETDATE(),'SP03',1,777000),
('DH03','KH03',GETDATE(),'SP07',1,4999000),
('DH04','KH04',GETDATE(),'SP12',3,3870000),
('DH05','KH05',GETDATE(),'SP15',2,3780000);

   --VIEW: Danh sách sản phẩm giảm giá

CREATE VIEW v_SanPhamGiamGia AS
SELECT 
    sp.MaSP, sp.TenSP, sp.GiaGoc, sp.GiaGiam,
    th.TenTH, dm.TenDM,
    PhanTramGiam = CASE 
        WHEN sp.GiaGiam IS NOT NULL AND sp.GiaGoc>0 
        THEN ROUND((sp.GiaGoc - sp.GiaGiam)*100.0/sp.GiaGoc,0)
        ELSE 0 END
FROM SANPHAM sp
JOIN THUONGHIEU th ON sp.MaTH = th.MaTH
JOIN DANHMUC dm ON sp.MaDM = dm.MaDM
WHERE sp.GiaGiam IS NOT NULL AND sp.GiaGiam < sp.GiaGoc;
GO

/*
   FUNCTION: Tính phần trăm giảm giá
 */
CREATE FUNCTION fn_PhanTramGiam(@GiaGoc DECIMAL(12,2), @GiaGiam DECIMAL(12,2))
RETURNS INT
AS
BEGIN
    DECLARE @kq INT;
    IF @GiaGoc IS NULL OR @GiaGoc = 0 OR @GiaGiam IS NULL
        SET @kq = 0;
    ELSE
        SET @kq = ROUND((@GiaGoc - @GiaGiam)*100.0/@GiaGoc,0);
    RETURN @kq;
END;
GO

-- Test function
SELECT dbo.fn_PhanTramGiam(1554000,777000) AS PhanTram;

/* 
   TRIGGER: Tự động trừ tồn kho khi thêm đơn hàng
 */
CREATE TRIGGER TRG_TruTonKho
ON DONHANG
AFTER INSERT
AS
BEGIN
    UPDATE BIENTHE
    SET TonKho = TonKho - i.SoLuong
    FROM BIENTHE bt
    JOIN SANPHAM sp ON bt.MaSP = sp.MaSP
    JOIN inserted i ON i.MaSP = sp.MaSP;
END;
GO

/* 
   TRUY VẤN KIỂM TRA KẾT QUẢ
 */
-- Toàn bộ dữ liệu
SELECT * FROM THUONGHIEU;
SELECT * FROM DANHMUC;
SELECT * FROM SANPHAM;
SELECT * FROM BIENTHE;
SELECT * FROM KHACHHANG;
SELECT * FROM DONHANG;

-- View giảm giá
SELECT * FROM v_SanPhamGiamGia;

-- Function test
SELECT MaSP, TenSP, GiaGoc, GiaGiam, dbo.fn_PhanTramGiam(GiaGoc, GiaGiam) AS PhanTramGiam
FROM SANPHAM
WHERE GiaGiam IS NOT NULL;

-- Trigger test (thêm đơn hàng mới)
INSERT INTO DONHANG VALUES ('DH06','KH01',GETDATE(),'SP01',1,777000);
SELECT MaBT, TonKho FROM BIENTHE WHERE MaSP='SP01';
ALTER TABLE SANPHAM ADD MoTa NVARCHAR(500);
UPDATE SANPHAM SET MoTa = N'Áo sơ mi nam cao cấp, chất liệu cotton thoáng mát, kiểu dáng hiện đại.' WHERE MaSP='SP01';
UPDATE SANPHAM SET MoTa = N'Áo sơ mi trắng tinh tế, phù hợp đi làm hoặc dự tiệc.' WHERE MaSP='SP02';
UPDATE SANPHAM SET MoTa = N'Quần âu nam form chuẩn, dễ phối áo sơ mi hoặc áo polo.' WHERE MaSP='SP03';
UPDATE SANPHAM SET MoTa = N'Ví da thật, thiết kế nhỏ gọn, sang trọng.' WHERE MaSP='SP04';
UPDATE SANPHAM SET MoTa = N'Áo Polo nam trẻ trung, thoải mái trong mọi hoạt động.' WHERE MaSP='SP05';
UPDATE SANPHAM SET MoTa = N'Dây lưng da thật, mặt khóa kim loại cao cấp.' WHERE MaSP='SP06';
UPDATE SANPHAM SET MoTa = N'Túi xách nữ phong cách châu Âu, dung tích lớn.' WHERE MaSP='SP07';
UPDATE SANPHAM SET MoTa = N'Áo golf nữ tay dài, thấm hút mồ hôi tốt, co giãn 4 chiều.' WHERE MaSP='SP08';
UPDATE SANPHAM SET MoTa = N'Áo thun nam cổ tròn, chất liệu mềm mịn, co giãn nhẹ.' WHERE MaSP='SP09';
UPDATE SANPHAM SET MoTa = N'Áo khoác nam chống gió, phù hợp thời tiết lạnh nhẹ.' WHERE MaSP='SP10';
UPDATE SANPHAM SET MoTa = N'Áo sơ mi nữ thanh lịch, chất vải nhẹ và thoáng.' WHERE MaSP='SP11';
UPDATE SANPHAM SET MoTa = N'Quần tây nam lịch lãm, phối hợp cùng áo sơ mi công sở.' WHERE MaSP='SP12';
UPDATE SANPHAM SET MoTa = N'Túi xách tay nữ sang trọng, quai da mềm và chắc chắn.' WHERE MaSP='SP13';
UPDATE SANPHAM SET MoTa = N'Ví nam da bò thật, nhiều ngăn tiện lợi.' WHERE MaSP='SP14';
UPDATE SANPHAM SET MoTa = N'Dây lưng nam trẻ trung, thích hợp cho dân công sở.' WHERE MaSP='SP15';
UPDATE SANPHAM SET MoTa = N'Áo phông nữ thời trang, họa tiết đơn giản, form rộng thoải mái.' WHERE MaSP='SP16';
UPDATE SANPHAM SET MoTa = N'Áo Polo nữ cao cấp, cổ đứng sang trọng.' WHERE MaSP='SP17';
UPDATE SANPHAM SET MoTa = N'Áo khoác gió nam năng động, thiết kế thể thao.' WHERE MaSP='SP18';
UPDATE SANPHAM SET MoTa = N'Túi đeo chéo nam tiện lợi, thiết kế hiện đại.' WHERE MaSP='SP19';
UPDATE SANPHAM SET MoTa = N'Áo golf nam co giãn, chất vải thoáng khí, màu sắc trẻ trung.' WHERE MaSP='SP20';
ALTER TABLE SANPHAM
ADD AnhBia NVARCHAR(200);
UPDATE SANPHAM SET AnhBia = 'SP01.jpg' WHERE MaSP = 'SP01';
UPDATE SANPHAM SET AnhBia = 'SP02.jpg' WHERE MaSP = 'SP02';
UPDATE SANPHAM SET AnhBia = 'SP03.jpg' WHERE MaSP = 'SP03';
UPDATE SANPHAM SET AnhBia = 'SP04.jpg' WHERE MaSP = 'SP04';
UPDATE SANPHAM SET AnhBia = 'SP05.jpg' WHERE MaSP = 'SP05';
UPDATE SANPHAM SET AnhBia = 'SP06.jpg' WHERE MaSP = 'SP06';
UPDATE SANPHAM SET AnhBia = 'SP07.jpg' WHERE MaSP = 'SP07';
UPDATE SANPHAM SET AnhBia = 'SP08.jpg' WHERE MaSP = 'SP08';
UPDATE SANPHAM SET AnhBia = 'SP09.jpg' WHERE MaSP = 'SP09';
UPDATE SANPHAM SET AnhBia = 'SP10.jpg' WHERE MaSP = 'SP10';
UPDATE SANPHAM SET AnhBia = 'SP01.jpg' WHERE MaSP = 'SP11';
UPDATE SANPHAM SET AnhBia = 'SP02.jpg' WHERE MaSP = 'SP12';
UPDATE SANPHAM SET AnhBia = 'SP03.jpg' WHERE MaSP = 'SP13';
UPDATE SANPHAM SET AnhBia = 'SP04.jpg' WHERE MaSP = 'SP14';
UPDATE SANPHAM SET AnhBia = 'SP05.jpg' WHERE MaSP = 'SP15';
UPDATE SANPHAM SET AnhBia = 'SP06.jpg' WHERE MaSP = 'SP16';
UPDATE SANPHAM SET AnhBia = 'SP07.jpg' WHERE MaSP = 'SP17';
UPDATE SANPHAM SET AnhBia = 'SP08.jpg' WHERE MaSP = 'SP18';
UPDATE SANPHAM SET AnhBia = 'SP09.jpg' WHERE MaSP = 'SP19';
UPDATE SANPHAM SET AnhBia = 'SP10.jpg' WHERE MaSP = 'SP20';
