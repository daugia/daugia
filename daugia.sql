USE [master]
GO
/****** Object:  Database [daugia]    Script Date: 5/29/2017 10:19:09 PM ******/
CREATE DATABASE [daugia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'daugia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\daugia.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'daugia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\daugia_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [daugia] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [daugia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [daugia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [daugia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [daugia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [daugia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [daugia] SET ARITHABORT OFF 
GO
ALTER DATABASE [daugia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [daugia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [daugia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [daugia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [daugia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [daugia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [daugia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [daugia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [daugia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [daugia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [daugia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [daugia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [daugia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [daugia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [daugia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [daugia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [daugia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [daugia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [daugia] SET  MULTI_USER 
GO
ALTER DATABASE [daugia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [daugia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [daugia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [daugia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [daugia] SET DELAYED_DURABILITY = DISABLED 
GO
USE [daugia]
GO
/****** Object:  Table [dbo].[binhluan]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[binhluan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noidung] [nvarchar](500) NULL,
	[ngaytao] [nchar](12) NULL,
	[ngaycapnhat] [nchar](12) NULL,
	[id_nguoidung] [int] NULL,
	[id_sanpham] [int] NULL,
 CONSTRAINT [PK_binhluan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[chitietdanhgia]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdanhgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
 CONSTRAINT [PK_chitietdanhgia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danhgia]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tot] [int] NULL,
	[xau] [int] NULL,
	[id_nguoidung] [int] NULL,
 CONSTRAINT [PK_danhgia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danhmuc]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhmuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[trinhtrang] [int] NULL,
	[ngaytao] [nchar](12) NULL,
	[ngaycapnhat] [nchar](12) NULL,
 CONSTRAINT [PK_danhmuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lichsudau]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lichsudau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[id_sanpham] [int] NULL,
	[tiendadau] [decimal](18, 0) NULL,
 CONSTRAINT [PK_lichsudau] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[username] [nvarchar](50) NULL,
	[pass] [nvarchar](100) NULL,
	[diachi] [nvarchar](500) NULL,
	[sodienthoai] [nvarchar](12) NULL,
	[ngaysinh] [datetime] NULL,
	[gioitinh] [nvarchar](50) NULL,
	[anhdaidien] [nvarchar](100) NULL,
	[ngaytao] [datetime] NULL,
	[ngaycapnhat] [datetime] NULL,
	[taikhoan] [decimal](18, 0) NULL,
	[diem] [int] NULL,
	[quyen] [int] NULL,
	[tinhtrang] [int] NULL,
 CONSTRAINT [PK_nguoidung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_danhmuc] [int] NULL,
	[id_nguoidung] [int] NULL,
	[ten] [nvarchar](50) NULL,
	[soluong] [int] NULL,
	[chitiet] [ntext] NULL,
	[giakhoidiem] [decimal](18, 0) NULL,
	[giahientai] [decimal](18, 0) NULL,
	[diemduocdau] [int] NULL,
	[id_nguoidunghientai] [int] NULL,
	[ngaybatdau] [datetime] NULL,
	[ngayketthuc] [datetime] NULL,
	[id_danhgia] [int] NULL,
	[tinhtrang] [int] NULL,
	[ngaytao] [nchar](12) NULL,
	[ngaycapnhat] [nchar](12) NULL,
	[hinhanh] [nchar](100) NULL,
	[giacaonhat] [decimal](18, 0) NULL,
	[giamuangay] [decimal](18, 0) NULL,
	[tang10phut] [int] NULL,
	[solantang10phut] [int] NULL,
	[mieutangan] [nvarchar](50) NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[thongbao]    Script Date: 5/29/2017 10:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thongbao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[noidung] [nvarchar](255) NULL,
 CONSTRAINT [PK_thongbao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[danhmuc] ON 

INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (1, N'Trang Sức', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (2, N'Điện Tử', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (3, N'Điện Thoại', 1, N'            ', NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (4, N'Quần Áo', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (5, N'Giày Dép', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (6, N'Xe Cộ', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (7, N'Nhà Cửa', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (8, N'Nghệ Thuật', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (9, N'Tranh Ảnh', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (10, N'Khác', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[danhmuc] OFF
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang]) VALUES (0, N'Phùng Quân Lạc', N'lac@gmail.com', N'lac', N'WW4q6nO2Npuz0+mdBO8DYw==                                                                            ', N'Hùng Vương,TPHCM', N'01212321312 ', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg                                                            ', CAST(N'2017-05-14 01:20:17.447' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), 5, 0, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang]) VALUES (1, N'Thái Hùng Đoàn', N'doan@gmail.com', N'doan', N'WW4q6nO2NputTiaaFYtHOw==', N'Thủ Đức', N'01232132322', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-05-14 01:34:57.487' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), 5, 0, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang]) VALUES (2, N'Lê Quốc Minh', N'minh@gmail.com', N'minh', N'WW4q6nO2NptDonhkH8ucyg==', N'Cần thơ', N'1231232132', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/2/default.jpg', CAST(N'2017-05-14 01:37:37.977' AS DateTime), CAST(N'2017-05-14 04:09:41.833' AS DateTime), CAST(1000000 AS Decimal(18, 0)), 5, 0, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang]) VALUES (3, N'Nguyễn Văn Công Tuấn', N'tuan@gmail.com', N'tuan', N'C9K7bP2hNeAzmHQkipa44w==', N'Thủ Đức', N'0123123123', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/3/default.jpg', CAST(N'2017-05-14 01:40:46.377' AS DateTime), CAST(N'2017-05-14 04:52:28.267' AS DateTime), CAST(1000000 AS Decimal(18, 0)), 5, 0, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang]) VALUES (4, N'Hứa Hoàng Nhất', N'nhat@gmail.com', N'nhat', N'WW4q6nO2Npsp4a5FLj+NLg==', N'Đồng Tháp', N'0523641897', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/4/default.jpg', CAST(N'2017-05-14 03:53:43.577' AS DateTime), CAST(N'2017-05-14 04:08:45.347' AS DateTime), CAST(1000000 AS Decimal(18, 0)), 5, 0, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang]) VALUES (5, N'quanlac', N'asd@gmail.com', N'quanlac', N'R5rgdDdIJ0fz5A1EF9fWgg==', N'123456789', N'1235467811', CAST(N'1997-02-06 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-05-14 20:59:29.797' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), 5, 0, 1)
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (3, 1, 0, N'Torrini KC241', 1, N'<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>
<UL>
    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>
    <LI>Loại đá: To paz</LI>
    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>
    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>
</UL>
', CAST(10000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 80, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(6000000 AS Decimal(18, 0)), CAST(16000000 AS Decimal(18, 0)), NULL, NULL, N'Nhẫn kim cương - vẻ đẹp kiêu sa')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (4, 2, 2, N'Nokia 7610', 1, N'<UL>
    <LI>Máy ảnh có độ phân giải 1 megapixel</LI>
    <LI>Màn hình 65.536 màu, rộng 2,1 inch, 176 X 208 pixel với đồ họa sắc nét, độ phân giải cao</LI>
    <LI>Quay phim video lên đến 10 phút với hình ảnh sắc nét hơn</LI>
    <LI>Kinh nghiệm đa phương tiện được tăng cường</LI>
    <LI>Streaming video &amp; âm thanh với RealOne Player (hỗ trợ các dạng thức MP3/AAC).</LI>
    <LI>Nâng cấp cho những đoạn phim cá nhân của bạn bằng các tính năng chỉnh sửa tự động thông minh</LI>
    <LI>In ảnh chất lượng cao từ nhà, văn phòng, kios và qua mạng</LI>
    <LI>Dễ dàng kết nối vớI máy PC để lưu trữ và chia sẻ (bằng cáp USB, PopPort, công nghệ Bluetooth)</LI>
    <LI>48 nhạc chuông đa âm sắc, True tones. Mạng GSM 900 / GSM 1800 / GSM 1900</LI>
    <LI>Kích thước 109 x 53 x 19 mm, 93 cc</LI>
    <LI>Trọng lượng 118 g</LI>
    <LI>Hiển thị: Loại TFT, 65.536 màu</LI>
    <LI>Kích cở: 176 x 208 pixels </LI>
</UL>
', CAST(20000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(9000000 AS Decimal(18, 0)), CAST(29000000 AS Decimal(18, 0)), NULL, NULL, N'Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (5, 1, 1, N'Áo thun nữ', 2, N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', CAST(40000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(8000000 AS Decimal(18, 0)), CAST(18000000 AS Decimal(18, 0)), NULL, NULL, N'Màu sắc tươi tắn, kiểu dáng trẻ trung')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (6, 2, 3, N'Simen AP75', 3, N'<UL>
    <LI>Hình ảnh hoàn hảo, rõ nét ở mọi góc màn hình</LI>
    <LI>Giảm thiểu sự phản chiếu ánh sáng</LI>
    <LI>Menu hiển thị tiếng Việt</LI>
    <LI>Hệ thống hình ảnh thông minh</LI>
    <LI>Âm thanh Hifi Stereo mạnh mẽ</LI>
    <LI>Hệ thống âm lượng thông minh</LI>
    <LI>Bộ nhớ 100 chương trình</LI>
    <LI>Chọn kênh ưa thích</LI>
    <LI>Các kiểu sắp đặt sẵn hình ảnh / âm thanh</LI>
    <LI>Kích thước (rộng x cao x dày): 497 x 458 x 487mm</LI>
    <LI>Trọng lượng: 25kg</LI>
    <LI>Màu: vàng, xanh, bạc </LI>
</UL>
', CAST(10000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(8000000 AS Decimal(18, 0)), CAST(28000000 AS Decimal(18, 0)), NULL, NULL, N'Thiết kế tinh xảo, hiện đại')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (7, 1, 4, N'Áo bé trai', 1, N'<UL>
    <LI>Quần áo bé trai</LI>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', CAST(30000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(700000 AS Decimal(18, 0)), CAST(2700000 AS Decimal(18, 0)), NULL, NULL, N'Hóm hỉnh dễ thương')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (8, 1, 2, N'Bông tai nạm hạt rubby', 2, N'<UL>
    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>
    <LI>Đóng nhãn hiệu: Torrini</LI>
    <LI>Nguồn gốc, xuất xứ: Italy</LI>
    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>
    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>
    <LI>Chất lượng/chứng chỉ: good</LI>
</UL>
', CAST(10000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(4000000 AS Decimal(18, 0)), CAST(24000000 AS Decimal(18, 0)), NULL, NULL, N'Trẻ trung và quý phái')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (9, 3, 1, N'Đầm dạ hội ánh kim', 3, N'<UL>
    <LI>Màu sắc: Khuynh hướng ánh kim có thể thể hiện trên vàng, bạc, đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>
    <LI>Một số biến tấu mang tính vui nhộn là vàng chanh, màu hoa vân anh và ngọc lam; trong đó hoàng kim và nhũ bạc khá phổ biến.</LI>
    <LI>Phong cách: Diềm đăng ten, rủ xuống theo chiều thẳng đứng, nhiều lớp, cổ chẻ sâu, eo chít cao tới ngực... được biến tấu tùy theo mỗi nhà thiết kế.</LI>
</UL>
', CAST(50000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(8000000 AS Decimal(18, 0)), CAST(28000000 AS Decimal(18, 0)), NULL, NULL, N'Đủ màu sắc - kiểu dáng')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (10, 3, 2, N'Dây chuyền ánh bạc', 4, N'<UL>
    <LI>Chất liệu chính: Bạc</LI>
    <LI>Màu sắc: Bạc</LI>
    <LI>Chất lượng: Mới</LI>
    <LI>Phí vận chuyển: Liên hệ</LI>
    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>
</UL>
', CAST(70000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(5000000 AS Decimal(18, 0)), CAST(25000000 AS Decimal(18, 0)), NULL, NULL, N'Kiểu dáng mới lạ')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (11, 4, 1, N'Đồ bộ bé gái', 5, N'<UL>
    <LI>Màu sắc: đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>
    <LI>Xuất xứ: Tp. Hồ Chí Minh</LI>
    <LI>Chất liệu: cotton</LI>
    <LI>Loại hàng: hàng trong nước</LI>
</UL>
', CAST(20000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(200000 AS Decimal(18, 0)), CAST(1200000 AS Decimal(18, 0)), NULL, NULL, N'Đủ màu sắc - kiểu dáng')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (12, 4, 1, N'Đầm dạ hội Xinh Xinh', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
<UL>
    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>
    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>
    <LI>Hãng sản xuất: NEM</LI>
    <LI>Kích cỡ : Tất cả các kích cỡ</LI>
    <LI>Kiểu dáng : Quây/Ống</LI>
    <LI>Chất liệu : Satin</LI>
    <LI>Màu : đen, đỏ</LI>
    <LI>Xuất xứ : Việt Nam</LI>
</UL>
', CAST(30000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(6000000 AS Decimal(18, 0)), CAST(26000000 AS Decimal(18, 0)), NULL, NULL, N'Đơn giản nhưng quý phái')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (13, 4, 0, N'Đầm dạ hội NEM', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
<UL>
    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>
    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>
    <LI>Hãng sản xuất: NEM</LI>
    <LI>Kích cỡ : Tất cả các kích cỡ</LI>
    <LI>Kiểu dáng : Quây/Ống</LI>
    <LI>Chất liệu : Satin</LI>
    <LI>Màu : đen, đỏ</LI>
    <LI>Xuất xứ : Việt Nam</LI>
</UL>
', CAST(50000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), CAST(12000000 AS Decimal(18, 0)), NULL, NULL, N'Táo bạo và quyến rũ')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (14, 6, 2, N'Dây chuyền đá quý', 1, N'<UL>
    <LI>Kiểu sản phẩm: Dây chuyền</LI>
    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>
</UL>
', CAST(60000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 3, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(9250000 AS Decimal(18, 0)), CAST(19250000 AS Decimal(18, 0)), NULL, NULL, N'Kết hợp vàng trắng và đá quý')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (15, 2, 3, N'Nokia N72', 1, N'<UL>
    <LI>Camera mega pixel : 2 mega pixel</LI>
    <LI>Bộ nhớ trong : 16 - 31 mb</LI>
    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>
    <LI>Hỗ trợ: Bluetooth, thẻ nhớ ngoài, nhạc MP3 &lt;br/&gt;</LI>
    <LI>Trọng lượng (g) : 124g</LI>
    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>
    <LI>Ngôn ngữ : Có tiếng việt</LI>
    <LI>Hệ điều hành: Symbian OS 8.1</LI>
</UL>
', CAST(10000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), CAST(32000000 AS Decimal(18, 0)), NULL, NULL, N'Sành điệu cùng N72')
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [id_danhgia], [tinhtrang], [ngaytao], [ngaycapnhat], [hinhanh], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan]) VALUES (16, 6, 4, N'Mặt dây chuyền Ruby', 1, N'<UL>
    <LI>Kiểu sản phẩm:&nbsp; Mặt dây</LI>
    <LI>Chất liệu: Vàng trắng 14K, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 0.32 Chỉ</LI>
</UL>', CAST(10000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), 50, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), CAST(32000000 AS Decimal(18, 0)), NULL, NULL, N'Toả sáng cùng Ruby')
SET IDENTITY_INSERT [dbo].[sanpham] OFF
USE [master]
GO
ALTER DATABASE [daugia] SET  READ_WRITE 
GO
