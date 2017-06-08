USE [daugia]
GO
/****** Object:  Table [dbo].[binhluan]    Script Date: 6/8/2017 17:53:13 ******/
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
/****** Object:  Table [dbo].[chinhsuachitietsp]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chinhsuachitietsp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_sanpham] [int] NULL,
	[noidungchinhsua] [ntext] NULL,
	[thoigian] [datetime] NULL,
 CONSTRAINT [PK_chinhsuachitietsp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[chitietdanhgia]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietdanhgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[noidung] [nvarchar](200) NULL,
	[id_nguoidanhgia] [int] NULL,
	[ngaytao] [datetime] NULL,
	[mat] [int] NULL,
 CONSTRAINT [PK_chitietdanhgia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danhgia]    Script Date: 6/8/2017 17:53:16 ******/
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
/****** Object:  Table [dbo].[danhmuc]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhmuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[trinhtrang] [int] NULL,
	[ngaytao] [datetime] NULL,
	[ngaycapnhat] [datetime] NULL,
 CONSTRAINT [PK_danhmuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kichnguoidung]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kichnguoidung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[id_sanpham] [int] NULL,
	[id_nguoidungquanlysp] [int] NULL,
 CONSTRAINT [PK_kichnguoidung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lichsudau]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lichsudau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[id_sanpham] [int] NULL,
	[tiendadau] [decimal](18, 0) NULL,
	[ngaydaugia] [datetime] NULL,
 CONSTRAINT [PK_lichsudau] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 6/8/2017 17:53:16 ******/
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
	[capphep] [int] NULL,
 CONSTRAINT [PK_nguoidung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 6/8/2017 17:53:16 ******/
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
	[tinhtrang] [int] NULL,
	[giacaonhat] [decimal](18, 0) NULL,
	[giamuangay] [decimal](18, 0) NULL,
	[tang10phut] [int] NULL,
	[solantang10phut] [int] NULL,
	[mieutangan] [nvarchar](50) NULL,
	[luotview] [int] NULL,
	[giabanmongmuon] [decimal](18, 0) NULL,
	[hinh1] [nchar](200) NULL,
	[hinh2] [nchar](200) NULL,
	[hinh3] [nchar](200) NULL,
	[luotragia] [int] NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[thongbao]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thongbao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[noidung] [nvarchar](255) NULL,
	[ngaytao] [datetime] NULL,
	[daxem] [int] NULL,
 CONSTRAINT [PK_thongbao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yeucau]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yeucau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[capphep] [int] NULL,
	[ngaytao] [datetime] NULL,
	[ngayduocban] [datetime] NULL,
	[ngayketthuc] [datetime] NULL,
	[tinhtrang] [int] NULL,
	[noidung] [nvarchar](500) NULL,
 CONSTRAINT [PK_yeucau] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yeuthich]    Script Date: 6/8/2017 17:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yeuthich](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidung] [int] NULL,
	[id_sanpham] [int] NULL,
 CONSTRAINT [PK_yeuthich] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[danhmuc] ON 

INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (1, N'Trang Sức', 1, NULL, CAST(N'2017-06-05 11:51:46.860' AS DateTime))
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (2, N'Điện Tử', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (3, N'Điện Thoại', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (4, N'Quần Áo', 1, NULL, CAST(N'2017-06-05 11:52:03.617' AS DateTime))
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (5, N'Giày Dép', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (6, N'Xe Cộ', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (7, N'Nhà Cửa', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (8, N'Nghệ Thuật', 1, NULL, CAST(N'2017-06-05 11:52:00.457' AS DateTime))
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (9, N'Tranh Ảnh', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (10, N'Khác', 1, NULL, NULL)
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (11, N'Gaming', 0, NULL, CAST(N'2017-06-05 11:55:08.573' AS DateTime))
INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (12, N'new', 0, CAST(N'2017-06-05 12:01:12.000' AS DateTime), CAST(N'2017-06-05 12:18:19.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[danhmuc] OFF
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (0, N'Phùng Quân Lạc', N'lac@gmail.com', N'lac', N'5OG5iJSQZuY=', N'Hùng Vương,TPHCM', N'01212321312 ', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg                                                            ', CAST(N'2017-05-14 01:20:17.447' AS DateTime), NULL, CAST(10000000 AS Decimal(18, 0)), 5, 0, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (1, N'Thái Hùng Đoàn', N'doan@gmail.com', N'doan', N'3Wm92dzNlgU=', N'Thủ Đức', N'01232132322', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-05-14 01:34:57.487' AS DateTime), NULL, CAST(10000000 AS Decimal(18, 0)), 5, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (2, N'Lê Quốc Minh', N'minh@gmail.com', N'minh', N'fYfL52VN+54=', N'Cần thơ', N'1231232132', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/2/default.jpg', CAST(N'2017-05-14 01:37:37.977' AS DateTime), CAST(N'2017-05-14 04:09:41.833' AS DateTime), CAST(10000000 AS Decimal(18, 0)), 5, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (3, N'Nguyễn Văn Công Tuấn', N'tuan@gmail.com', N'tuan', N'M5h0JIqWuOM=', N'Thủ Đức', N'0123123123', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/3/default.jpg', CAST(N'2017-05-14 01:40:46.377' AS DateTime), CAST(N'2017-05-14 04:52:28.267' AS DateTime), CAST(10000000 AS Decimal(18, 0)), 5, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (4, N'Hứa Hoàng Nhất', N'nhat@gmail.com', N'nhat', N'2G0zN/fTFfE=', N'Đồng Tháp', N'0523641897', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/4/default.jpg', CAST(N'2017-05-14 03:53:43.577' AS DateTime), CAST(N'2017-05-14 04:08:45.347' AS DateTime), CAST(10000000 AS Decimal(18, 0)), 5, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (5, N'quanlac', N'asd@gmail.com', N'quanlac', N'R5rgdDdIJ0fz5A1EF9fWgg==', N'123456789', N'1235467811', CAST(N'1997-02-06 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-05-14 20:59:29.797' AS DateTime), NULL, CAST(10000000 AS Decimal(18, 0)), 5, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (6, N'Lu', N'lu@gmail.com', N'bnh', N'C9K7bP2hNeCD7v8IoiybyA==', N'cmt8', N'0949646171', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-06-04 21:21:05.897' AS DateTime), NULL, CAST(0 AS Decimal(18, 0)), 5, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (3, 1, 1, N'Torrini KC241', 1, N'<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>
<UL>
    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>
    <LI>Loại đá: To paz</LI>
    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>
    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 02:00:48.000' AS DateTime), CAST(N'2017-06-11 01:00:48.000' AS DateTime), 1, CAST(1600000000 AS Decimal(18, 0)), CAST(4000000000 AS Decimal(18, 0)), 1, 1, N'Nhẫn kim cương - vẻ đẹp kiêu sa', 14, CAST(2000000 AS Decimal(18, 0)), N'/Source/Images/sp/3/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (4, 1, 2, N'Nokia 7610', 1, N'<UL>
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
', CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-05 02:00:48.000' AS DateTime), CAST(N'2017-06-12 02:00:48.000' AS DateTime), 1, CAST(290000000 AS Decimal(18, 0)), CAST(5000000000 AS Decimal(18, 0)), 1, 0, N'Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.', 19, CAST(3000000 AS Decimal(18, 0)), N'/Source/Images/sp/4/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (5, 2, 3, N'Áo thun nữ', 1, N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(4000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-05 05:00:48.000' AS DateTime), CAST(N'2017-06-12 03:00:48.000' AS DateTime), 1, CAST(18000000 AS Decimal(18, 0)), CAST(6000000000 AS Decimal(18, 0)), 1, 0, N'Màu sắc tươi tắn, kiểu dáng trẻ trung', 10, CAST(5000000 AS Decimal(18, 0)), N'/Source/Images/sp/5/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (6, 1, 4, N'Simen AP75', 1, N'<UL>
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
', CAST(100000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-06 06:00:48.000' AS DateTime), CAST(N'2017-06-13 05:00:48.000' AS DateTime), 1, CAST(280000000 AS Decimal(18, 0)), CAST(7000000000 AS Decimal(18, 0)), 1, 1, N'Thiết kế tinh xảo, hiện đại', 11, CAST(6000000 AS Decimal(18, 0)), N'/Source/Images/sp/6/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (7, 1, 1, N'Áo bé trai', 1, N'<UL>
    <LI>Quần áo bé trai</LI>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 07:00:48.000' AS DateTime), CAST(N'2017-06-11 07:00:48.000' AS DateTime), 1, CAST(27000000 AS Decimal(18, 0)), CAST(8000000000 AS Decimal(18, 0)), 0, NULL, N'Hóm hỉnh dễ thương', 21, CAST(7000000 AS Decimal(18, 0)), N'/Source/Images/sp/7/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (8, 2, 1, N'Bông tai nạm hạt rubby', 1, N'<UL>
    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>
    <LI>Đóng nhãn hiệu: Torrini</LI>
    <LI>Nguồn gốc, xuất xứ: Italy</LI>
    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>
    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>
    <LI>Chất lượng/chứng chỉ: good</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(6000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-05 08:00:48.000' AS DateTime), CAST(N'2017-06-12 08:00:48.000' AS DateTime), 1, CAST(240000000 AS Decimal(18, 0)), CAST(4000000000 AS Decimal(18, 0)), 0, NULL, N'Trẻ trung và quý phái', 10, CAST(1000000 AS Decimal(18, 0)), N'/Source/Images/sp/8/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (9, 4, 2, N'Đầm dạ hội ánh kim', 1, NULL, CAST(100000 AS Decimal(18, 0)), CAST(7000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-07 06:00:48.000' AS DateTime), CAST(N'2017-06-13 09:00:48.000' AS DateTime), 1, CAST(28000000 AS Decimal(18, 0)), CAST(5000000000 AS Decimal(18, 0)), 0, NULL, N'Đủ màu sắc - kiểu dáng', 10, CAST(2000000 AS Decimal(18, 0)), N'/Source/Images/sp/9/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (10, 5, 3, N'Dây chuyền ánh bạc', 1, N'<UL>
    <LI>Chất liệu chính: Bạc</LI>
    <LI>Màu sắc: Bạc</LI>
    <LI>Chất lượng: Mới</LI>
    <LI>Phí vận chuyển: Liên hệ</LI>
    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(8000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-08 02:00:48.000' AS DateTime), CAST(N'2017-06-15 02:00:48.000' AS DateTime), 1, CAST(25000000 AS Decimal(18, 0)), CAST(6000000000 AS Decimal(18, 0)), 1, 1, N'Kiểu dáng mới lạ', 11, CAST(5000000 AS Decimal(18, 0)), N'/Source/Images/sp/10/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (11, 6, 0, N'Đồ bộ bé gái', 1, N'<UL>
    <LI>Màu sắc: đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>
    <LI>Xuất xứ: Tp. Hồ Chí Minh</LI>
    <LI>Chất liệu: cotton</LI>
    <LI>Loại hàng: hàng trong nước</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(9000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 08:00:48.000' AS DateTime), CAST(N'2017-06-11 01:00:48.000' AS DateTime), 1, CAST(12000000 AS Decimal(18, 0)), CAST(7000000000 AS Decimal(18, 0)), 1, 0, N'Đủ màu sắc - kiểu dáng', 10, CAST(6000000 AS Decimal(18, 0)), N'/Source/Images/sp/11/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (12, 7, 1, N'Đầm dạ hội Xinh Xinh', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
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
', CAST(100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-09 10:00:48.000' AS DateTime), CAST(N'2017-06-16 01:00:48.000' AS DateTime), 1, CAST(260000000 AS Decimal(18, 0)), CAST(8000000000 AS Decimal(18, 0)), 1, 0, N'Đơn giản nhưng quý phái', 10, CAST(7000000 AS Decimal(18, 0)), N'/Source/Images/sp/12/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (13, 1, 2, N'Đầm dạ hội NEM', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
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
', CAST(100000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-10 12:00:48.000' AS DateTime), CAST(N'2017-06-17 12:00:48.000' AS DateTime), 1, CAST(120000000 AS Decimal(18, 0)), CAST(2000000000 AS Decimal(18, 0)), 1, 0, N'Táo bạo và quyến rũ', 10, CAST(8000000 AS Decimal(18, 0)), N'/Source/Images/sp/13/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (14, 2, 3, N'Dây chuyền đá quý', 1, N'<UL>
    <LI>Kiểu sản phẩm: Dây chuyền</LI>
    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(4000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-12 11:00:48.000' AS DateTime), CAST(N'2017-06-19 08:00:48.000' AS DateTime), 1, CAST(192500000 AS Decimal(18, 0)), CAST(3000000000 AS Decimal(18, 0)), 1, 1, N'Kết hợp vàng trắng và đá quý', 10, CAST(9000000 AS Decimal(18, 0)), N'/Source/Images/sp/14/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (15, 3, 1, N'Nokia N72', 1, N'<UL>
    <LI>Camera mega pixel : 2 mega pixel</LI>
    <LI>Bộ nhớ trong : 16 - 31 mb</LI>
    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>
    <LI>Hỗ trợ: Bluetooth, thẻ nhớ ngoài, nhạc MP3 &lt;br/&gt;</LI>
    <LI>Trọng lượng (g) : 124g</LI>
    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>
    <LI>Ngôn ngữ : Có tiếng việt</LI>
    <LI>Hệ điều hành: Symbian OS 8.1</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 03:00:48.000' AS DateTime), CAST(N'2017-06-11 03:00:48.000' AS DateTime), 1, CAST(320000000 AS Decimal(18, 0)), CAST(5000000000 AS Decimal(18, 0)), 1, 0, N'Sành điệu cùng N72', 25, CAST(1000000 AS Decimal(18, 0)), N'/Source/Images/sp/15/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (16, 4, 2, N'Nokia N72', 1, N'<UL>
    <LI>Camera mega pixel : 2 mega pixel</LI>
    <LI>Bộ nhớ trong : 16 - 31 mb</LI>
    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>
    <LI>Hỗ trợ: Bluetooth, thẻ nhớ ngoài, nhạc MP3 &lt;br/&gt;</LI>
    <LI>Trọng lượng (g) : 124g</LI>
    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>
    <LI>Ngôn ngữ : Có tiếng việt</LI>
    <LI>Hệ điều hành: Symbian OS 8.1</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-08 02:00:48.000' AS DateTime), CAST(N'2017-06-08 02:00:48.000' AS DateTime), 1, CAST(320000000 AS Decimal(18, 0)), CAST(2000000000 AS Decimal(18, 0)), 1, 1, N'Sành điệu cùng N72', 10, CAST(1000000 AS Decimal(18, 0)), N'/Source/Images/sp/16/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (17, 1, 2, N'Tran sức mới', 1, N'<p>12</p>
<p>12</p>
<p>12</p>
<p>1</p>
<p>3</p>
<p>1</p>', CAST(500000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-07 17:31:55.520' AS DateTime), CAST(N'2017-06-22 22:45:03.997' AS DateTime), 1, NULL, NULL, 1, NULL, N'trang sức cao cấp', NULL, NULL, N'/Source/Images/sp/17/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia]) VALUES (23, 1, 2, N'NHẪN NỮ 0109R7020PN', 1, N'<p>
	&nbsp;</p>
<div class="table-text" style="box-sizing: border-box; display: table; width: 475px; clear: both; color: rgb(51, 51, 51); font-family: MyriadRegular, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">
	<ul style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none; float: left; width: 237.5px;">
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			Loại sản phẩm: Nhẫn nữ</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			Đ&aacute; phụ: Kim cương trắng</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			M&agrave;u: V&agrave;ng trắng</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			Đ&aacute; ch&iacute;nh: Ruby</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			Trọng lượng đ&aacute; ch&iacute;nh: 13.35 cts</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			Trọng lượng đ&aacute; phụ(cts): 1.204 cts</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			Chất liệu: V&agrave;ng 18k</li>
	</ul>
	<ul style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px 0px 0px 10px; border: 0px; vertical-align: baseline; list-style: none; float: left; width: 237.5px;">
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			&nbsp;</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			&nbsp;</li>
		<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; display: block; line-height: 1.5em; font-size: 16px; color: rgb(129, 129, 129);">
			&nbsp;</li>
	</ul>
</div>
<p>
	&nbsp;</p>
', CAST(5500000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-07 22:45:03.997' AS DateTime), CAST(N'2017-06-22 22:45:03.997' AS DateTime), 1, NULL, NULL, 1, NULL, N'Đá phụ: Kim cương trắng', NULL, NULL, N'/Source/Images/sp/23/hinh1.png                                                                                                                                                                          ', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[sanpham] OFF
SET IDENTITY_INSERT [dbo].[thongbao] ON 

INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (1, 2, N'Sửa thành công sp 1', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (2, 2, N'Thêm sản phẩm đấu giá thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (3, 2, N'Cập nhật thông tin thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (4, 2, N'Đổi mật khẩu thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (5, 2, N'Sửa thành công sp 1', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (6, 2, N'Thêm sản phẩm đấu giá thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (7, 2, N'Cập nhật thông tin thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (8, 2, N'Cập nhật thông tin thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (9, 2, N'Cập nhật thông tin thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (10, 2, N'Thêm sản phẩm đấu giá thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (11, 2, N'Sửa thành công sp 1', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (12, 2, N'Đổi mật khẩu thành công', CAST(N'2017-06-07 22:45:03.997' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[thongbao] OFF
SET IDENTITY_INSERT [dbo].[yeucau] ON 

INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (1, 0, 1, CAST(N'2017-06-07 18:51:00.433' AS DateTime), CAST(N'2017-06-05 16:16:18.593' AS DateTime), CAST(N'2017-06-12 16:16:18.593' AS DateTime), 1, N'<p>
	I want to sell</p>
<p>
	&nbsp;</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (2, 3, 1, CAST(N'2017-06-07 18:17:57.507' AS DateTime), CAST(N'2017-06-05 16:16:29.557' AS DateTime), CAST(N'2017-06-12 16:16:29.557' AS DateTime), 1, N'i want to sell')
SET IDENTITY_INSERT [dbo].[yeucau] OFF
SET IDENTITY_INSERT [dbo].[yeuthich] ON 

INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (1, 0, 3)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (3, 0, 6)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (5, 3, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (6, 3, 13)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (8, 0, 8)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (9, 0, 10)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (10, 4, 9)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (11, 4, 16)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (12, 1, 15)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (14, 1, 13)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (22, 1, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (23, 1, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (24, 1, 6)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (27, 1, 11)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (36, 0, 15)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (53, 3, 10)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (60, 2, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (61, 2, 6)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (62, 2, 7)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (63, 2, 3)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (64, 2, 13)
SET IDENTITY_INSERT [dbo].[yeuthich] OFF
