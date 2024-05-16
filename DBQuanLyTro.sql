if  exists  (select name from sys.databases where name='QuanLyTro' ) 
--Nếu trong server có file DBtest xóa đi
begin	 
	use master --sử dụng db master de xoa DBtest2, tránh việc DBtest2 đang được sử dụng thì ko thể xóa dc
	drop database QuanLyTro		
end
CREATE DATABASE QuanLyTro;
GO

USE QuanLyTro;
GO


CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    TaiKhoan VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Role INT NOT NULL,
	HoVaTen NVARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	CCCD INT NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL
);


CREATE TABLE Khu (
    KhuID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    AccountID INT NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);


CREATE TABLE Phong (
    PhongID INT PRIMARY KEY,
    SoPhong INT NOT NULL,
    KhuID INT NOT NULL,
    LoaiPhong NVARCHAR(50) NOT NULL,
    PhongConTrong INT NOT NULL,
    Gia INT NOT NULL,
    FOREIGN KEY (KhuID) REFERENCES Khu(KhuID)
);


CREATE TABLE ThietBi (
    ThietBiID INT PRIMARY KEY,
	PhongID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,  
    SoLuong INT NOT NULL,
    TinhTrang NVARCHAR(50) NOT NULL,
    Gia INT NOT NULL,
    FOREIGN KEY (PhongID) REFERENCES Phong(PhongID)
);


CREATE TABLE KhachThue (
    KhachID INT PRIMARY KEY,
    HoVaTen NVARCHAR(50) NOT NULL,
    CCCD VARCHAR(20) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
    QueQuan NVARCHAR(100) NOT NULL,
    TenNguoiThan NVARCHAR(50),
    SDTNguoiThan VARCHAR(20),
    QuanHeVoiNguoiThan NVARCHAR(50)
);


CREATE TABLE HopDong (
    HopDongID INT PRIMARY KEY,
    KhachID INT NOT NULL,
    PhongID INT NOT NULL,
    TienCoc INT,
    NgayThue DATE NOT NULL,
    NgayTra DATE NOT NULL,
    SoKhachThue INT NOT NULL,
    GhiChu TEXT,
    CCCD INT NOT NULL,
    SDT INT NOT NULL,
    HoVaTen NVARCHAR(50) NOT NULL,
    FOREIGN KEY (KhachID) REFERENCES KhachThue(KhachID),
    FOREIGN KEY (PhongID) REFERENCES Phong(PhongID)
);


CREATE TABLE DichVu (
    DichVuID INT PRIMARY KEY,
	SoPhong INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    GiaTien INT NOT NULL,
    TuNgay DATE,
    DenNgay DATE,
    ChiSoCu INT,
    ChiSoMoi INT
);


CREATE TABLE HoaDon (
    HoaDonID INT PRIMARY KEY,
    HopDongID INT NOT NULL,
    TinhTrangThanhToan NVARCHAR(50) NOT NULL,
    TuNgay DATE NOT NULL,
    DenNgay DATE NOT NULL,
    TongTien INT NOT NULL,
    FOREIGN KEY (HopDongID) REFERENCES HopDong(HopDongID),
);


CREATE TABLE HoaDonDetail (
    HoaDonDetailID INT PRIMARY KEY,
    HoaDonID INT NOT NULL,
    TuNgay DATE,
    DenNgay DATE,
    TongSoDien INT,
	TongSoNuoc INT,
    ThanhTien INT NOT NULL,
    DichVuID INT NOT NULL,
    FOREIGN KEY (HoaDonID) REFERENCES HoaDon(HoaDonID),
    FOREIGN KEY (DichVuID) REFERENCES DichVu(DichVuID)
);


CREATE TABLE Request (
    RequestID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    RequestText TEXT NOT NULL,
    SubmittedAt DATE NOT NULL,
    TinhTrang NVARCHAR(500) NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
GO

insert into Accounts values(1,N'hai','123',0,N'PhanHai',N'phanhai@gmail.com','001548596257',N'Hà Nội')
insert into Accounts values(2,N'linh','123',1,N'KhanhLinh',N'khanhlinh@gmail.com','001548596258',N'Hà Nội')
insert into Accounts values(3,N'lan','123',1,N'NgocLan',N'ngoclan@gmail.com','001548596259',N'Hà Nội')

insert into Khu values(1,N'A','2')
insert into Khu values(2,N'B','3')

--Phong
insert into Phong values(1001,'1','1',N'Đơn','0','1500000')
insert into Phong values(1002,'2','1',N'Đơn','0','1500000')
insert into Phong values(1003,'3','1',N'Đơn','1','1500000')
insert into Phong values(1004,'4','1',N'Đơn','0','1500000')
insert into Phong values(1005,'5','1',N'Đơn','1','1500000')
insert into Phong values(1006,'6','1',N'Đơn','1','1500000')
insert into Phong values(1007,'7','1',N'Đôi','1','2000000')
insert into Phong values(1008,'8','1',N'Đôi','1','2000000')
insert into Phong values(1009,'9','1',N'Đôi','0','2000000')
insert into Phong values(1010,'10','1',N'Đôi','0','2000000')
insert into Phong values(2011,'11','2',N'Đơn','1','1500000')
insert into Phong values(2012,'12','2',N'Đơn','0','1500000')
insert into Phong values(2013,'13','2',N'Đơn','1','1500000')
insert into Phong values(2014,'14','2',N'Đơn','1','1500000')
insert into Phong values(2015,'15','2',N'Đơn','1','1500000')
insert into Phong values(2016,'16','2',N'Đôi','0','2000000')
insert into Phong values(2017,'17','2',N'Đôi','0','2000000')
insert into Phong values(2018,'18','2',N'Đôi','1','2000000')
insert into Phong values(2019,'19','2',N'Đôi','0','2000000')
insert into Phong values(2020,'20','2',N'Đôi','1','2000000')


insert into ThietBi values(11001,1001,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21001,1001,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31001,1001,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41001,1001,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11002,1002,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21002,1002,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31002,1002,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41002,1002,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11003,1003,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21003,1003,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31003,1003,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41003,1003,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11004,1004,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21004,1004,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31004,1004,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41004,1004,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11005,1005,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21005,1005,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31005,1005,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(11006,1006,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21006,1006,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31006,1006,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41006,1006,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11007,1007,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21007,1007,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31007,1007,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41007,1007,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11008,1008,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21008,1008,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31008,1008,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(41008,1008,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(11009,1009,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21009,1009,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31009,1009,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(11010,1010,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(21010,1010,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(31010,1010,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42011,2011,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(12011,2011,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(22011,2011,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(32011,2011,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12012,2012,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22012,2012,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32012,2012,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42012,2012,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12013,2013,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22013,2013,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32013,2013,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42013,2013,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12014,2014,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22014,2014,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32014,2014,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42014,2014,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12015,2015,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22015,2015,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32015,2015,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(12016,2016,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22016,2016,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32016,2016,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42016,2016,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12017,2017,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22017,2017,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32017,2017,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42017,2017,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12018,2018,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22018,2018,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32018,2018,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42018,2018,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12019,2019,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22019,2019,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32019,2019,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42019,2019,N'Bình nóng lạnh',1,N'Bình thường',200000)
insert into ThietBi values(12020,2020,N'Tủ lạnh mini',1,N'Bình thường',250000)
insert into ThietBi values(22020,2020,N'Giường',1,N'Bình thường',200000)
insert into ThietBi values(32020,2020,N'Điều hòa',1,N'Bình thường',300000)
insert into ThietBi values(42020,2020,N'Bình nóng lạnh',1,N'Bình thường',200000)

insert into KhachThue values(1011,N'Phan Đức Hải','001126484354','0254896354',N'Bắc Ninh',N'Phan Đức Quân','0903456789',N'Bố')
insert into KhachThue values(1012,N'PhanThanh Sơn','001226594873','0354896575',N'Phú Yên',N'Phan Văn Hải','0912345678',N'Bố')
insert into KhachThue values(1013,N'Vũ Thị Kiều Linh','001132369854','0954875216',N'Hà Nội ',N'Vũ Mạnh Khởi','0934567890',N'Chú')
insert into KhachThue values(1014,N'Nguyễn Tiến Đạt','001369854724','0358964758',N'Bắc Giang',N'Nguyễn Minh Hoàng','0987654321',N'Anh')
insert into KhachThue values(1015,N'Trần Thị Ngọc Lan','001369584214','0365874951',N'Lào Cai',N'Trần Quốc Việt','0902123456',N'Bố')
insert into KhachThue values(1016,N'Trần Quang Trường','001356987425','0954875236',N'Nghệ An',N'Nguyễn Thị Hiền','0978123456',N'Bà')
insert into KhachThue values(1017,N'Trần Mạnh Dũng','001254789650','0912400948',N'Hà Nội ',N'Trần Kim Liên','0911234567',N'Mẹ')
insert into KhachThue values(1018,N'Nguyễn Phương Nam','001254876312','0368549101',N'Hà Nội ',N'Bùi Minh Phương','0965432109',N'Mẹ')
insert into KhachThue values(1019,N'Lê Thị Linh','001201453658','0912458888',N'Vĩnh Phúc',N'Vũ Hoài Nam','0933222111',N'Bố')
insert into KhachThue values(1020,N'Trịnh Minh Hiếu','001250154864','0969876543',N'Phú Thọ',N'Trịnh Minh Vũ','0921987654',N'Bố')
insert into KhachThue values(1021,N'Nguyễn Tuấn Đạt','001874362793','0928765432',N'Thái Bình',N'Nguyễn Thị Lý','0986543210',N'Mẹ')
insert into KhachThue values(1022,N'Nguyễn Hữu Huy','001093874625','0931987654',N'Hà Nam',N'Lê Thùy Linh','0905678912',N'Mẹ')
insert into KhachThue values(1023,N'Trần Khánh Ly','001346735732','0917654321',N'Nam Định',N'Trần Mai Loan','0919876543',N'Mẹ')
insert into KhachThue values(1024,N'Vũ Đức Mạnh','001365825524','0974321098',N'Hà Nội',N'Vũ Ngọc Linh','0932456789',N'Mẹ')
insert into KhachThue values(1025,N'Nguyễn Thu Hoài','001236568378','0906543210',N'Quảng Ninh',N'Nguyễn Mạnh Tiến','0972345678',N'Bố')
insert into KhachThue values(1026,N'Nguyễn Hương Giang','001235547324','0981234567',N'Thái Nguyên',N'Nguyễn Tuấn Đạt','0983456789',N'Bố')
insert into KhachThue values(1027,N'Chạc Trường Lộc','001623143523','0936789012',N'Bạc Liêu',N'Vũ Khánh Ly','0945678123',N'Mẹ')
insert into KhachThue values(1028,N'Nông Đức Đại','001354572455','0913456789',N'Bắc Ninh',N'Trần Thị Giang','0967543210',N'Mẹ')
insert into KhachThue values(1029,N'Phạm Long Vũ','001354572456','0908123456',N'Hà Giang ',N'Bùi Thị Hạnh','0939876543',N'Mẹ')
insert into KhachThue values(1030,N'Nguyễn Hà Mi','001354572457','0971234567',N'Hà Nội',N'Nguyễn Phúc Thọ','0971234567',N'Bố')


insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(01,1011,1001,1500000,'2024-01-01','2024-03-01',1,'001126484354','0254896354',N'Phan Đức Hải')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(02,1012,1002,1500000,'2024-01-02','2024-06-01',1,'001226594873','0354896575',N'PhanThanh Sơn')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(03,1013,1004,1500000,'2024-01-03','2025-01-01',2,'001132369854','0954875216',N'Vũ Thị Kiều Linh')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(04,1014,1009,2000000,'2024-01-04','2024-06-01',3,'001369854724','0358964758',N'Nguyễn Tiến Đạt')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(05,1015,1010,2000000,'2024-01-05','2024-03-01',3,'001369584214','0365874951',N'Trần Thị Ngọc Lan')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(06,1016,2012,1500000,'2024-01-06','2025-01-01',2,'001356987425','0954875236',N'Trần Quang Trường')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(07,1017,2016,2000000,'2024-01-07','2025-01-01',2,'001254789650','0912400948',N'Trần Mạnh Dũng')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(08,1018,2017,2000000,'2024-01-08','2024-03-01',3,'001254876312','0368549101',N'Nguyễn Phương Nam')
insert into HopDong(HopDongID,KhachID,PhongID,TienCoc,NgayThue,NgayTra,SoKhachThue,CCCD,SDT,HoVaTen) values(09,1019,2019,2000000,'2024-01-09','2024-06-01',3,'001201453658','0912458888',N'Lê Thị Linh')

insert into DichVu values(1,1001,N'Nước',11000,'2024-01-01','2024-01-31',0,5)
insert into DichVu values(2,1001,N'Điện',2500,'2024-01-01','2024-01-31',0,175)
insert into DichVu values(3,1001,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(4,1001,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(5,1002,N'Nước',11000,'2024-01-01','2024-01-31',0,6)
insert into DichVu values(6,1002,N'Điện',2500,'2024-01-01','2024-01-31',0,165)
insert into DichVu values(7,1002,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(8,1002,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(9,1004,N'Nước',11000,'2024-01-01','2024-01-31',0,4)
insert into DichVu values(10,1004,N'Điện',2500,'2024-01-01','2024-01-31',0,164)
insert into DichVu values(11,1004,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(12,1004,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(13,1009,N'Nước',11000,'2024-01-01','2024-01-31',0,5)
insert into DichVu values(14,1009,N'Điện',2500,'2024-01-01','2024-01-31',0,148)
insert into DichVu values(15,1009,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(16,1009,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(17,1010,N'Nước',11000,'2024-01-01','2024-01-31',0,7)
insert into DichVu values(18,1010,N'Điện',2500,'2024-01-01','2024-01-31',0,169)
insert into DichVu values(19,1010,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(20,1010,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(21,2012,N'Nước',11000,'2024-01-01','2024-01-31',0,6)
insert into DichVu values(22,2012,N'Điện',2500,'2024-01-01','2024-01-31',0,125)
insert into DichVu values(23,2012,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(24,2012,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(25,2016,N'Nước',11000,'2024-01-01','2024-01-31',0,4)
insert into DichVu values(26,2016,N'Điện',2500,'2024-01-01','2024-01-31',0,185)
insert into DichVu values(27,2016,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(28,2016,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(29,2017,N'Nước',11000,'2024-01-01','2024-01-31',0,4)
insert into DichVu values(30,2017,N'Điện',2500,'2024-01-01','2024-01-31',0,200)
insert into DichVu values(31,2017,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(32,2017,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(33,2019,N'Nước',11000,'2024-01-01','2024-01-31',0,6)
insert into DichVu values(34,2019,N'Điện',2500,'2024-01-01','2024-01-31',0,160)
insert into DichVu values(35,2019,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(36,2019,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(37,1001,N'Nước',11000,'2024-02-01','2024-03-02',5,11)
insert into DichVu values(38,1001,N'Điện',2500,'2024-02-01','2024-03-02',175,320)
insert into DichVu values(39,1001,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(40,1001,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(41,1002,N'Nước',11000,'2024-02-01','2024-03-02',165,301)
insert into DichVu values(42,1002,N'Điện',2500,'2024-02-01','2024-03-02',6,10)
insert into DichVu values(43,1002,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(44,1002,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(45,1004,N'Nước',11000,'2024-02-01','2024-03-02',4,9)
insert into DichVu values(46,1004,N'Điện',2500,'2024-02-01','2024-03-02',164,284)
insert into DichVu values(47,1004,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(48,1004,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(49,1009,N'Nước',11000,'2024-02-01','2024-03-02',5,13)
insert into DichVu values(50,1009,N'Điện',2500,'2024-02-01','2024-03-02',148,340)
insert into DichVu values(51,1009,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(52,1009,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(53,1010,N'Nước',11000,'2024-01-01','2024-01-31',7,13)
insert into DichVu values(54,1010,N'Điện',2500,'2024-01-01','2024-01-31',169,364)
insert into DichVu values(55,1010,N'Wifi',50000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(56,1010,N'Rác',15000,'2024-01-01','2024-01-31',null,null)
insert into DichVu values(57,2012,N'Nước',11000,'2024-02-01','2024-03-02',6,11)
insert into DichVu values(58,2012,N'Điện',2500,'2024-02-01','2024-03-02',125,235)
insert into DichVu values(59,2012,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(60,2012,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(61,2016,N'Nước',11000,'2024-02-01','2024-03-02',4,12)
insert into DichVu values(62,2016,N'Điện',2500,'2024-02-01','2024-03-02',185,332)
insert into DichVu values(63,2016,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(64,2016,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(65,2017,N'Nước',11000,'2024-02-01','2024-03-02',4,11)
insert into DichVu values(66,2017,N'Điện',2500,'2024-02-01','2024-03-02',200,420)
insert into DichVu values(67,2017,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(68,2017,N'Rác',15000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(69,2019,N'Nước',11000,'2024-02-01','2024-03-02',6,13)
insert into DichVu values(70,2019,N'Điện',2500,'2024-02-01','2024-03-02',160,325)
insert into DichVu values(71,2019,N'Wifi',50000,'2024-02-01','2024-03-02',null,null)
insert into DichVu values(72,2019,N'Rác',15000,'2024-02-01','2024-03-02',null,null)

insert into HoaDon values(1,'01',N'Đã thanh toán','2024-01-01','2024-01-31',2058000)
insert into HoaDon values(2,'02',N'Đã thanh toán','2024-01-01','2024-01-31',2033000)
insert into HoaDon values(3,'03',N'Đã thanh toán','2024-01-01','2024-01-31',2069000)
insert into HoaDon values(4,'04',N'Đã thanh toán','2024-01-01','2024-01-31',2590000)
insert into HoaDon values(5,'05',N'Đã thanh toán','2024-01-01','2024-01-31',2664500)
insert into HoaDon values(6,'06',N'Đã thanh toán','2024-01-01','2024-01-31',1993500)
insert into HoaDon values(7,'07',N'Đã thanh toán','2024-01-01','2024-01-31',2621500)
insert into HoaDon values(8,'08',N'Đã thanh toán','2024-01-01','2024-01-31',2709000)
insert into HoaDon values(9,'09',N'Đã thanh toán','2024-01-01','2024-01-31',2609000)
insert into HoaDon values(10,'01',N'Đã thanh toán','2024-02-01','2024-02-28',1993500)
insert into HoaDon values(11,'02',N'Đã thanh toán','2024-02-01','2024-02-28',1949000)
insert into HoaDon values(12,'03',N'Đã thanh toán','2024-02-01','2024-02-28',1970000)
insert into HoaDon values(13,'04',N'Đã thanh toán','2024-02-01','2024-02-28',2733000)
insert into HoaDon values(14,'05',N'Đã thanh toán','2024-02-01','2024-02-28',2618500)
insert into HoaDon values(15,'06',N'Đã thanh toán','2024-02-01','2024-02-28',1945000)
insert into HoaDon values(16,'07',N'Đã thanh toán','2024-02-01','2024-02-28',2570500)
insert into HoaDon values(17,'08',N'Đã thanh toán','2024-02-01','2024-02-28',2792000)
insert into HoaDon values(18,'09',N'Đã thanh toán','2024-02-01','2024-02-28',2654500)


insert into HoaDonDetail values(1,1,'2024-01-01','2024-01-31',null,5,55000,1)
insert into HoaDonDetail values(2,1,'2024-01-01','2024-01-31',175,null,438000,2)
insert into HoaDonDetail values(3,1,'2024-01-01','2024-01-31',null,null,50000,3)
insert into HoaDonDetail values(4,1,'2024-01-01','2024-01-31',null,null,15000,4)
insert into HoaDonDetail values(5,2,'2024-01-01','2024-01-31',null,5,55000,5)
insert into HoaDonDetail values(6,2,'2024-01-01','2024-01-31',165,null,413000,6)
insert into HoaDonDetail values(7,2,'2024-01-01','2024-01-31',null,null,50000,7)
insert into HoaDonDetail values(8,2,'2024-01-01','2024-01-31',null,null,15000,8)
insert into HoaDonDetail values(9,3,'2024-01-01','2024-01-31',null,4,44000,9)
insert into HoaDonDetail values(10,3,'2024-01-01','2024-01-31',164,null,410000,10)
insert into HoaDonDetail values(11,3,'2024-01-01','2024-01-31',null,null,100000,11)
insert into HoaDonDetail values(12,3,'2024-01-01','2024-01-31',null,null,15000,12)
insert into HoaDonDetail values(13,4,'2024-01-01','2024-01-31',null,5,55000,13)
insert into HoaDonDetail values(14,4,'2024-01-01','2024-01-31',148,null,370000,14)
insert into HoaDonDetail values(15,4,'2024-01-01','2024-01-31',null,null,150000,15)
insert into HoaDonDetail values(16,4,'2024-01-01','2024-01-31',null,null,15000,16)
insert into HoaDonDetail values(17,5,'2024-01-01','2024-01-31',null,7,77000,17)
insert into HoaDonDetail values(18,5,'2024-01-01','2024-01-31',169,null,422500,18)
insert into HoaDonDetail values(19,5,'2024-01-01','2024-01-31',null,null,150000,19)
insert into HoaDonDetail values(20,5,'2024-01-01','2024-01-31',null,null,15000,20)
insert into HoaDonDetail values(21,6,'2024-01-01','2024-01-31',null,6,66000,21)
insert into HoaDonDetail values(22,6,'2024-01-01','2024-01-31',125,null,312500,22)
insert into HoaDonDetail values(23,6,'2024-01-01','2024-01-31',null,null,100000,23)
insert into HoaDonDetail values(24,6,'2024-01-01','2024-01-31',null,null,15000,24)
insert into HoaDonDetail values(25,7,'2024-01-01','2024-01-31',null,4,44000,25)
insert into HoaDonDetail values(26,7,'2024-01-01','2024-01-31',185,null,462500,26)
insert into HoaDonDetail values(27,7,'2024-01-01','2024-01-31',null,null,100000,27)
insert into HoaDonDetail values(28,7,'2024-01-01','2024-01-31',null,null,15000,28)
insert into HoaDonDetail values(29,8,'2024-01-01','2024-01-31',null,4,44000,29)
insert into HoaDonDetail values(30,8,'2024-01-01','2024-01-31',200,null,500000,30)
insert into HoaDonDetail values(31,8,'2024-01-01','2024-01-31',null,null,150000,31)
insert into HoaDonDetail values(32,8,'2024-01-01','2024-01-31',null,null,15000,32)
insert into HoaDonDetail values(33,9,'2024-01-01','2024-01-31',null,4,44000,33)
insert into HoaDonDetail values(34,9,'2024-01-01','2024-01-31',160,null,400000,34)
insert into HoaDonDetail values(35,9,'2024-01-01','2024-01-31',null,null,150000,35)
insert into HoaDonDetail values(36,9,'2024-01-01','2024-01-31',null,null,15000,36)
insert into HoaDonDetail values(37,10,'2024-02-01','2024-02-28',null,6,66000,37)
insert into HoaDonDetail values(38,10,'2024-02-01','2024-02-28',145,null,362500,38)
insert into HoaDonDetail values(39,10,'2024-02-01','2024-02-28',null,null,50000,39)
insert into HoaDonDetail values(40,10,'2024-02-01','2024-02-28',null,null,15000,40)
insert into HoaDonDetail values(41,11,'2024-02-01','2024-02-28',null,4,44000,41)
insert into HoaDonDetail values(42,11,'2024-02-01','2024-02-28',136,null,340000,42)
insert into HoaDonDetail values(43,11,'2024-02-01','2024-02-28',null,null,50000,43)
insert into HoaDonDetail values(44,11,'2024-02-01','2024-02-28',null,null,15000,44)
insert into HoaDonDetail values(45,12,'2024-02-01','2024-02-28',null,5,55000,45)
insert into HoaDonDetail values(46,12,'2024-02-01','2024-02-28',120,null,300000,46)
insert into HoaDonDetail values(47,12,'2024-02-01','2024-02-28',null,null,100000,47)
insert into HoaDonDetail values(48,12,'2024-02-01','2024-02-28',null,null,15000,48)
insert into HoaDonDetail values(49,13,'2024-02-01','2024-02-28',null,8,88000,49)
insert into HoaDonDetail values(50,13,'2024-02-01','2024-02-28',192,null,480000,50)
insert into HoaDonDetail values(51,13,'2024-02-01','2024-02-28',null,null,150000,51)
insert into HoaDonDetail values(52,13,'2024-02-01','2024-02-28',null,null,15000,52)
insert into HoaDonDetail values(53,14,'2024-02-01','2024-02-28',null,6,66000,53)
insert into HoaDonDetail values(54,14,'2024-02-01','2024-02-28',195,null,487500,54)
insert into HoaDonDetail values(55,14,'2024-02-01','2024-02-28',null,null,50000,55)
insert into HoaDonDetail values(56,14,'2024-02-01','2024-02-28',null,null,15000,56)
insert into HoaDonDetail values(57,15,'2024-02-01','2024-02-28',null,5,55000,57)
insert into HoaDonDetail values(58,15,'2024-02-01','2024-02-28',110,null,275000,58)
insert into HoaDonDetail values(59,15,'2024-02-01','2024-02-28',null,null,100000,59)
insert into HoaDonDetail values(60,15,'2024-02-01','2024-02-28',null,null,15000,60)
insert into HoaDonDetail values(61,16,'2024-02-01','2024-02-28',null,8,88000,61)
insert into HoaDonDetail values(62,16,'2024-02-01','2024-02-28',147,null,367500,62)
insert into HoaDonDetail values(63,16,'2024-02-01','2024-02-28',null,null,100000,63)
insert into HoaDonDetail values(64,16,'2024-02-01','2024-02-28',null,null,15000,64)
insert into HoaDonDetail values(65,17,'2024-02-01','2024-02-28',null,7,77000,65)
insert into HoaDonDetail values(66,17,'2024-02-01','2024-02-28',220,null,550000,66)
insert into HoaDonDetail values(67,17,'2024-02-01','2024-02-28',null,null,150000,67)
insert into HoaDonDetail values(68,17,'2024-02-01','2024-02-28',null,null,15000,68)
insert into HoaDonDetail values(69,18,'2024-02-01','2024-02-28',null,7,77000,69)
insert into HoaDonDetail values(70,18,'2024-02-01','2024-02-28',165,null,412500,70)
insert into HoaDonDetail values(71,18,'2024-02-01','2024-02-28',null,null,150000,71)
insert into HoaDonDetail values(72,18,'2024-02-01','2024-02-28',null,null,15000,72)

insert into Request values(1,2,N'Sửa tủ lạnh phòng 1001','2024-02-17',N'Đã sửa')
insert into Request values(2,2,N'Sửa giường phòng2012','2024-02-18',N'Chưa sửa')