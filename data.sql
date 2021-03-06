USE [daugia]
GO
/****** Object:  Table [dbo].[binhluan]    Script Date: 6/11/2017 16:19:52 ******/
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
/****** Object:  Table [dbo].[chinhsuachitietsp]    Script Date: 6/11/2017 16:19:53 ******/
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
/****** Object:  Table [dbo].[danhgia]    Script Date: 6/11/2017 16:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhgia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mat] [int] NULL,
	[id_nguoidanhgia] [int] NULL,
	[id_nguoidung] [int] NULL,
	[noidung] [nvarchar](255) NULL,
	[ngaytao] [datetime] NULL,
 CONSTRAINT [PK_danhgia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danhmuc]    Script Date: 6/11/2017 16:19:53 ******/
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
/****** Object:  Table [dbo].[kichnguoidung]    Script Date: 6/11/2017 16:19:53 ******/
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
/****** Object:  Table [dbo].[lichsudau]    Script Date: 6/11/2017 16:19:53 ******/
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
	[tinhtrang] [int] NULL,
 CONSTRAINT [PK_lichsudau] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 6/11/2017 16:19:53 ******/
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
	[diem] [float] NULL,
	[quyen] [int] NULL,
	[tinhtrang] [int] NULL,
	[capphep] [int] NULL,
 CONSTRAINT [PK_nguoidung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 6/11/2017 16:19:53 ******/
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
	[nguoibandanhgia ] [int] NULL,
	[nguoimuadanhgia ] [int] NULL,
	[guimail ] [int] NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[thongbao]    Script Date: 6/11/2017 16:19:53 ******/
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
/****** Object:  Table [dbo].[yeucau]    Script Date: 6/11/2017 16:19:53 ******/
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
/****** Object:  Table [dbo].[yeuthich]    Script Date: 6/11/2017 16:19:53 ******/
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

INSERT [dbo].[danhmuc] ([id], [ten], [trinhtrang], [ngaytao], [ngaycapnhat]) VALUES (1, N'Trang Sức', 1, NULL, CAST(N'2017-06-10 13:26:38.167' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[kichnguoidung] ON 

INSERT [dbo].[kichnguoidung] ([id], [id_nguoidung], [id_sanpham], [id_nguoidungquanlysp]) VALUES (1, 2, 33, 3)
INSERT [dbo].[kichnguoidung] ([id], [id_nguoidung], [id_sanpham], [id_nguoidungquanlysp]) VALUES (2, 1, 33, 3)
INSERT [dbo].[kichnguoidung] ([id], [id_nguoidung], [id_sanpham], [id_nguoidungquanlysp]) VALUES (3, 2, 34, 8)
INSERT [dbo].[kichnguoidung] ([id], [id_nguoidung], [id_sanpham], [id_nguoidungquanlysp]) VALUES (4, 4, 34, 8)
SET IDENTITY_INSERT [dbo].[kichnguoidung] OFF
SET IDENTITY_INSERT [dbo].[lichsudau] ON 

INSERT [dbo].[lichsudau] ([id], [id_nguoidung], [id_sanpham], [tiendadau], [ngaydaugia], [tinhtrang]) VALUES (1, 2, 33, CAST(200000 AS Decimal(18, 0)), CAST(N'2017-06-10 15:12:30.913' AS DateTime), 1)
INSERT [dbo].[lichsudau] ([id], [id_nguoidung], [id_sanpham], [tiendadau], [ngaydaugia], [tinhtrang]) VALUES (2, 1, 33, CAST(300000 AS Decimal(18, 0)), CAST(N'2017-06-10 15:13:05.843' AS DateTime), 1)
INSERT [dbo].[lichsudau] ([id], [id_nguoidung], [id_sanpham], [tiendadau], [ngaydaugia], [tinhtrang]) VALUES (3, 2, 34, CAST(200000 AS Decimal(18, 0)), CAST(N'2017-06-10 15:34:19.303' AS DateTime), 1)
INSERT [dbo].[lichsudau] ([id], [id_nguoidung], [id_sanpham], [tiendadau], [ngaydaugia], [tinhtrang]) VALUES (4, 4, 34, CAST(300000 AS Decimal(18, 0)), CAST(N'2017-06-10 15:34:47.910' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[lichsudau] OFF
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (0, N'Phùng Quân Lạc', N'lac@gmail.com', N'lac', N'C9K7bP2hNeDk4bmIlJBm5g==', N'Hùng Vương,TPHCM', N'01212321312 ', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg                                                            ', CAST(N'2017-05-14 01:20:17.447' AS DateTime), NULL, CAST(10000000 AS Decimal(18, 0)), 80, 0, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (1, N'Thái Hùng Đoàn', N'doan@gmail.com', N'doan', N'C9K7bP2hNeDdab3Z3M2WBQ==', N'Thủ Đức', N'01232132322', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-05-14 01:34:57.487' AS DateTime), NULL, CAST(9700000 AS Decimal(18, 0)), 80, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (2, N'Lê Quốc Minh', N'minh@gmail.com', N'minh', N'C9K7bP2hNeB9h8vnZU37ng==', N'Cần thơ', N'1231232132', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/2/default.jpg', CAST(N'2017-05-14 01:37:37.977' AS DateTime), CAST(N'2017-06-09 15:53:17.547' AS DateTime), CAST(10000000 AS Decimal(18, 0)), 80, 0, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (3, N'Nguyễn Văn Công Tuấn', N'tuan@gmail.com', N'tuan', N'M5h0JIqWuOM=', N'Thủ Đức', N'0123123123', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/3/default.jpg', CAST(N'2017-05-14 01:40:46.377' AS DateTime), CAST(N'2017-06-10 16:31:25.593' AS DateTime), CAST(10000000 AS Decimal(18, 0)), 80, 0, 1, 1)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (4, N'Hứa Hoàng Nhất', N'nhat@gmail.com', N'nhat', N'C9K7bP2hNeDYbTM399MV8Q==', N'Đồng Tháp', N'0523641897', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/4/default.jpg', CAST(N'2017-05-14 03:53:43.577' AS DateTime), CAST(N'2017-06-09 20:59:13.783' AS DateTime), CAST(9700000 AS Decimal(18, 0)), 80, 0, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (5, N'quanlac', N'asd@gmail.com', N'quanlac', N'C9K7bP2hNeB2ZoxhWquytQ==', N'123456789', N'1235467811', CAST(N'1997-02-06 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-05-14 20:59:29.797' AS DateTime), NULL, CAST(10000000 AS Decimal(18, 0)), 80, 0, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (6, N'Lu', N'lu@gmail.com', N'bnh', N'C9K7bP2hNeCD7v8IoiybyA==', N'cmt8', N'0949646171', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-06-04 21:21:05.897' AS DateTime), NULL, CAST(0 AS Decimal(18, 0)), 80, 1, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (7, N'ha', N'ha@gmail.com', N'ha', N'C9K7bP2hNeDJ1iatIWwCuA==', N'asda', N'311414', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'1', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-06-10 14:43:10.067' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), 80, 0, 1, 0)
INSERT [dbo].[nguoidung] ([id], [ten], [email], [username], [pass], [diachi], [sodienthoai], [ngaysinh], [gioitinh], [anhdaidien], [ngaytao], [ngaycapnhat], [taikhoan], [diem], [quyen], [tinhtrang], [capphep]) VALUES (8, N'quoc', N'quoc@gmail.com', N'quoc', N'C9K7bP2hNeDFLxvTU9wO8w==', N'CMT8,Q3,TP HCM', N'0973945756', CAST(N'1996-09-28 00:00:00.000' AS DateTime), N'0', N'/Source/Images/Users/default/default.jpg', CAST(N'2017-06-10 14:55:46.150' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), 5, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (3, 1, 1, N'Torrini KC241', 1, N'<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>
<UL>
    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>
    <LI>Loại đá: To paz</LI>
    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>
    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 02:00:48.000' AS DateTime), CAST(N'2017-06-11 01:00:48.000' AS DateTime), 1, CAST(1600000000 AS Decimal(18, 0)), CAST(4000000000 AS Decimal(18, 0)), 1, 1, N'Nhẫn kim cương - vẻ đẹp kiêu sa', 14, CAST(2000000 AS Decimal(18, 0)), N'/Source/Images/sp/3/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (4, 1, 2, N'Nokia 7610', 1, N'<UL>
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
', CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-05 02:00:48.000' AS DateTime), CAST(N'2017-06-12 02:00:48.000' AS DateTime), 1, CAST(290000000 AS Decimal(18, 0)), CAST(5000000000 AS Decimal(18, 0)), 1, 0, N'Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.', 19, CAST(3000000 AS Decimal(18, 0)), N'/Source/Images/sp/4/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (5, 2, 3, N'Áo thun nữ', 1, N'<UL>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(4000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-05 05:00:48.000' AS DateTime), CAST(N'2017-06-12 03:00:48.000' AS DateTime), 1, CAST(18000000 AS Decimal(18, 0)), CAST(6000000000 AS Decimal(18, 0)), 1, 0, N'Màu sắc tươi tắn, kiểu dáng trẻ trung', 12, CAST(5000000 AS Decimal(18, 0)), N'/Source/Images/sp/5/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (6, 1, 4, N'Simen AP75', 1, N'<UL>
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
', CAST(100000 AS Decimal(18, 0)), CAST(9000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-06 06:00:48.000' AS DateTime), CAST(N'2017-06-13 05:00:48.000' AS DateTime), 1, CAST(280000000 AS Decimal(18, 0)), CAST(7000000000 AS Decimal(18, 0)), 1, 1, N'Thiết kế tinh xảo, hiện đại', 21, CAST(6000000 AS Decimal(18, 0)), N'/Source/Images/sp/6/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (7, 1, 1, N'Áo bé trai', 1, N'<UL>
    <LI>Quần áo bé trai</LI>
    <LI>Loại hàng: Hàng trong nước</LI>
    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 07:00:48.000' AS DateTime), CAST(N'2017-06-11 07:00:48.000' AS DateTime), 1, CAST(27000000 AS Decimal(18, 0)), CAST(8000000000 AS Decimal(18, 0)), 0, NULL, N'Hóm hỉnh dễ thương', 24, CAST(7000000 AS Decimal(18, 0)), N'/Source/Images/sp/7/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (8, 2, 1, N'Bông tai nạm hạt rubby', 1, N'<UL>
    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>
    <LI>Đóng nhãn hiệu: Torrini</LI>
    <LI>Nguồn gốc, xuất xứ: Italy</LI>
    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>
    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>
    <LI>Chất lượng/chứng chỉ: good</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(6000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-05 08:00:48.000' AS DateTime), CAST(N'2017-06-12 08:00:48.000' AS DateTime), 1, CAST(240000000 AS Decimal(18, 0)), CAST(4000000000 AS Decimal(18, 0)), 0, NULL, N'Trẻ trung và quý phái', 12, CAST(1000000 AS Decimal(18, 0)), N'/Source/Images/sp/8/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (9, 4, 2, N'Đầm dạ hội ánh kim', 1, N'<UL>
    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>
    <LI>Đóng nhãn hiệu: Torrini</LI>
    <LI>Nguồn gốc, xuất xứ: Italy</LI>
    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>
    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>
    <LI>Chất lượng/chứng chỉ: good</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(7000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-07 06:00:48.000' AS DateTime), CAST(N'2017-06-13 09:00:48.000' AS DateTime), 1, CAST(28000000 AS Decimal(18, 0)), CAST(5000000000 AS Decimal(18, 0)), 0, NULL, N'Đủ màu sắc - kiểu dáng', 12, CAST(2000000 AS Decimal(18, 0)), N'/Source/Images/sp/9/hinh1.jpg                                                                                                                                                                           ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (10, 5, 3, N'Dây chuyền ánh bạc', 1, N'<UL>
    <LI>Chất liệu chính: Bạc</LI>
    <LI>Màu sắc: Bạc</LI>
    <LI>Chất lượng: Mới</LI>
    <LI>Phí vận chuyển: Liên hệ</LI>
    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(8000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-08 02:00:48.000' AS DateTime), CAST(N'2017-06-15 02:00:48.000' AS DateTime), 1, CAST(25000000 AS Decimal(18, 0)), CAST(6000000000 AS Decimal(18, 0)), 1, 1, N'Kiểu dáng mới lạ', 13, CAST(5000000 AS Decimal(18, 0)), N'/Source/Images/sp/10/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (11, 6, 0, N'Đồ bộ bé gái', 1, NULL, CAST(100000 AS Decimal(18, 0)), CAST(9000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 08:00:48.000' AS DateTime), CAST(N'2017-06-11 01:00:48.000' AS DateTime), 1, CAST(12000000 AS Decimal(18, 0)), CAST(7000000000 AS Decimal(18, 0)), 1, 0, N'', 11, CAST(6000000 AS Decimal(18, 0)), N'/Source/Images/sp/11/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (12, 7, 1, N'Đầm dạ hội Xinh Xinh', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
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
', CAST(100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-09 10:00:48.000' AS DateTime), CAST(N'2017-06-16 01:00:48.000' AS DateTime), 1, CAST(260000000 AS Decimal(18, 0)), CAST(8000000000 AS Decimal(18, 0)), 1, 0, N'Đơn giản nhưng quý phái', 10, CAST(7000000 AS Decimal(18, 0)), N'/Source/Images/sp/12/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 6, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (13, 1, 2, N'Đầm dạ hội NEM', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
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
', CAST(100000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-10 12:00:48.000' AS DateTime), CAST(N'2017-06-17 12:00:48.000' AS DateTime), 1, CAST(120000000 AS Decimal(18, 0)), CAST(2000000000 AS Decimal(18, 0)), 1, 0, N'Táo bạo và quyến rũ', 10, CAST(8000000 AS Decimal(18, 0)), N'/Source/Images/sp/13/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (14, 2, 3, N'Dây chuyền đá quý', 1, N'<UL>
    <LI>Kiểu sản phẩm: Dây chuyền</LI>
    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>
    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(4000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-12 11:00:48.000' AS DateTime), CAST(N'2017-06-19 08:00:48.000' AS DateTime), 1, CAST(192500000 AS Decimal(18, 0)), CAST(3000000000 AS Decimal(18, 0)), 1, 1, N'Kết hợp vàng trắng và đá quý', 13, CAST(9000000 AS Decimal(18, 0)), N'/Source/Images/sp/14/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 8, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (15, 3, 1, N'Nokia N72', 1, N'<UL>
    <LI>Camera mega pixel : 2 mega pixel</LI>
    <LI>Bộ nhớ trong : 16 - 31 mb</LI>
    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>
    <LI>Hỗ trợ: Bluetooth, thẻ nhớ ngoài, nhạc MP3 &lt;br/&gt;</LI>
    <LI>Trọng lượng (g) : 124g</LI>
    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>
    <LI>Ngôn ngữ : Có tiếng việt</LI>
    <LI>Hệ điều hành: Symbian OS 8.1</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-04 03:00:48.000' AS DateTime), CAST(N'2017-06-11 03:00:48.000' AS DateTime), 1, CAST(320000000 AS Decimal(18, 0)), CAST(5000000000 AS Decimal(18, 0)), 1, 0, N'Sành điệu cùng N72', 27, CAST(1000000 AS Decimal(18, 0)), N'/Source/Images/sp/15/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 9, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (16, 4, 2, N'Nokia N72', 1, N'<UL>
    <LI>Camera mega pixel : 2 mega pixel</LI>
    <LI>Bộ nhớ trong : 16 - 31 mb</LI>
    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>
    <LI>Hỗ trợ: Bluetooth, thẻ nhớ ngoài, nhạc MP3 &lt;br/&gt;</LI>
    <LI>Trọng lượng (g) : 124g</LI>
    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>
    <LI>Ngôn ngữ : Có tiếng việt</LI>
    <LI>Hệ điều hành: Symbian OS 8.1</LI>
</UL>
', CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), 80, NULL, CAST(N'2017-06-08 02:00:48.000' AS DateTime), CAST(N'2017-06-08 02:00:48.000' AS DateTime), 1, CAST(320000000 AS Decimal(18, 0)), CAST(2000000000 AS Decimal(18, 0)), 1, 1, N'Sành điệu cùng N72', 10, CAST(1000000 AS Decimal(18, 0)), N'/Source/Images/sp/16/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (17, 1, 2, N'Tran sức mới', 1, N'<p>12</p>
<p>12</p>
<p>12</p>
<p>1</p>
<p>3</p>
<p>1</p>', CAST(500000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-07 17:31:55.520' AS DateTime), CAST(N'2017-06-22 22:45:03.997' AS DateTime), 1, NULL, NULL, 1, NULL, N'trang sức cao cấp', NULL, NULL, N'/Source/Images/sp/17/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (23, 1, 2, N'NHẪN NỮ 0109R7020PN', 1, N'<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>
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
', CAST(5500000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-07 22:45:03.997' AS DateTime), CAST(N'2017-06-22 22:45:03.997' AS DateTime), 1, NULL, NULL, 1, NULL, N'Đá phụ: Kim cương trắng', NULL, NULL, N'/Source/Images/sp/23/hinh1.png                                                                                                                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (24, 1, 3, N'Tuan Nưe', 1, N'<p>
	http://localhost:63997/Product/New</p>
<p>
	http://localhost:63997/Product/New</p>
<p>
	http://localhost:63997/Product/New</p>
<p>
	v</p>
', CAST(1000000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-09 19:41:34.113' AS DateTime), CAST(N'2017-06-24 19:41:34.113' AS DateTime), 1, NULL, NULL, 1, NULL, N'Tuan bita', NULL, NULL, N'/Source/Images/sp/24/hinh3.jpg                                                                                                                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (31, 1, 4, N'nhat ngu', 1, N'<p>
	1231231</p>
<p>
	2312</p>
<p>
	1</p>
<p>
	3121</p>
<p>
	23</p>
<p>
	312</p>
', CAST(200000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-10 14:28:59.547' AS DateTime), CAST(N'2017-06-25 14:28:59.547' AS DateTime), 1, NULL, NULL, 1, NULL, N'12312321112312', NULL, NULL, N'/Source/Images/sp/31/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (32, 1, 8, N'quoc 1', 1, N'<p>
	123123123</p>
', CAST(100000 AS Decimal(18, 0)), NULL, NULL, NULL, CAST(N'2017-06-10 14:57:44.647' AS DateTime), CAST(N'2017-06-25 14:57:44.647' AS DateTime), 1, NULL, NULL, 1, NULL, N'tuoc li', NULL, NULL, N'/Source/Images/sp/32/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (33, 1, 3, N'tuan1', 1, N'<p>
	11111111111</p>
<p>
	111112121212</p>
', CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), NULL, NULL, CAST(N'2017-06-10 15:11:54.640' AS DateTime), CAST(N'2017-06-25 15:11:54.640' AS DateTime), 1, CAST(100000 AS Decimal(18, 0)), NULL, 1, NULL, N'1111111111111', NULL, NULL, N'/Source/Images/sp/33/hinh1.jpg                                                                                                                                                                          ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (34, 1, 8, N'quoc ty', 1, N'<p>
	111111111111111111</p>
<p>
	111111111111111</p>
', CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), NULL, NULL, CAST(N'2017-06-10 15:33:51.673' AS DateTime), CAST(N'2017-06-25 15:33:51.673' AS DateTime), 1, CAST(100000 AS Decimal(18, 0)), NULL, 1, NULL, N'quoc ty be due', NULL, CAST(100000 AS Decimal(18, 0)), N'/Source/Images/sp/34/hinh1.png                                                                                                                                                                          ', NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[sanpham] ([id], [id_danhmuc], [id_nguoidung], [ten], [soluong], [chitiet], [giakhoidiem], [giahientai], [diemduocdau], [id_nguoidunghientai], [ngaybatdau], [ngayketthuc], [tinhtrang], [giacaonhat], [giamuangay], [tang10phut], [solantang10phut], [mieutangan], [luotview], [giabanmongmuon], [hinh1], [hinh2], [hinh3], [luotragia], [nguoibandanhgia ], [nguoimuadanhgia ], [guimail ]) VALUES (35, 1, 3, N'tuan new', 1, N'<p>
	1312313</p>
<p>
	13</p>
<p>
	2131</p>
<p>
	231</p>
', CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), NULL, NULL, CAST(N'2017-06-11 15:23:24.117' AS DateTime), CAST(N'2017-06-26 15:23:24.117' AS DateTime), 1, CAST(100000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, NULL, N'111111111111', NULL, CAST(100000 AS Decimal(18, 0)), N'/Source/Images/sp/35/hinh3.ico                                                                                                                                                                          ', NULL, NULL, 0, NULL, NULL, NULL)
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
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (13, 2, N'Bạn đã thêm yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-09 15:22:53.857' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (14, 2, N'Bạn đã xóa yêu thích san phẩm :Nokia 7610', CAST(N'2017-06-09 15:22:56.317' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (15, 2, N'Bạn đã thêm yêu thích san phẩm :Đầm dạ hội ánh kim', CAST(N'2017-06-09 15:25:44.313' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (16, 2, N'Bạn đã xóa yêu thích san phẩm :Đầm dạ hội ánh kim', CAST(N'2017-06-09 15:25:44.667' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (17, 2, N'Bạn đã thêm yêu thích san phẩm :Dây chuyền ánh bạc', CAST(N'2017-06-09 15:31:13.140' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (18, 2, N'Bạn đã xóa yêu thích san phẩm :Dây chuyền ánh bạc', CAST(N'2017-06-09 15:31:14.493' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (19, 2, N'Bạn đã xóa yêu thích san phẩm :Bông tai nạm hạt rubby', CAST(N'2017-06-09 15:33:41.250' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (20, 2, N'Bạn đã thêm yêu thích san phẩm :Bông tai nạm hạt rubby', CAST(N'2017-06-09 15:33:42.097' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (21, 2, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-09 15:52:37.560' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (22, 2, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-09 15:53:17.767' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (23, 3, N'Bạn đã thêm yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-09 15:55:20.640' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (24, 3, N'Bạn đã thêm yêu thích san phẩm :Simen AP75', CAST(N'2017-06-09 15:55:21.670' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (25, 3, N'Bạn đã thêm yêu thích san phẩm :Áo bé trai', CAST(N'2017-06-09 15:55:23.027' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (26, 3, N'Bạn đã xóa yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-09 15:56:02.823' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (27, 3, N'Bạn đã xóa yêu thích san phẩm :Nokia 7610', CAST(N'2017-06-09 16:01:28.360' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (28, 3, N'Bạn đã thêm yêu thích san phẩm :Đầm dạ hội ánh kim', CAST(N'2017-06-09 16:02:57.477' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (29, 2, N'Bạn đã thêm yêu thích san phẩm :Nokia 7610', CAST(N'2017-06-09 17:09:17.277' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (30, 2, N'Bạn đã xóa yêu thích san phẩm :Nokia 7610', CAST(N'2017-06-09 17:09:18.547' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (31, 2, N'Bạn đã xóa yêu thích san phẩm :Simen AP75', CAST(N'2017-06-09 17:09:31.007' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (32, 1, N'Bạn đã xóa yêu thích san phẩm :Simen AP75', CAST(N'2017-06-09 17:11:25.270' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (33, 1, N'Bạn đã thêm yêu thích san phẩm :Áo thun nữ', CAST(N'2017-06-09 17:11:29.473' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (34, 1, N'Bạn đã thêm yêu thích san phẩm :Bông tai nạm hạt rubby', CAST(N'2017-06-09 17:11:31.113' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (35, 1, N'Bạn đã thêm yêu thích san phẩm :Dây chuyền đá quý', CAST(N'2017-06-09 17:11:31.910' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (36, 6, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-09 17:20:17.657' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (37, 6, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-09 17:20:33.683' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (38, 4, N'Bạn đã xóa yêu thích san phẩm :Đầm dạ hội ánh kim', CAST(N'2017-06-09 18:44:33.973' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (39, 4, N'Bạn đã xóa yêu thích san phẩm :Nokia N72', CAST(N'2017-06-09 18:44:34.303' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (40, 4, N'Bạn đã thêm yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-09 18:44:39.470' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (41, 4, N'Bạn đã thêm yêu thích san phẩm :Nokia 7610', CAST(N'2017-06-09 18:44:40.530' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (42, 4, N'Bạn đã thêm yêu thích san phẩm :Simen AP75', CAST(N'2017-06-09 18:44:41.300' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (43, 4, N'Bạn đã thêm yêu thích san phẩm :Áo bé trai', CAST(N'2017-06-09 18:44:42.337' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (44, 4, N'Bạn đã thêm yêu thích san phẩm :Đầm dạ hội ánh kim', CAST(N'2017-06-09 18:44:44.920' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (45, 4, N'Bạn đã xóa yêu thích san phẩm :Đầm dạ hội ánh kim', CAST(N'2017-06-09 18:44:45.670' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (46, 4, N'Bạn đã thêm yêu thích san phẩm :Áo thun nữ', CAST(N'2017-06-09 19:22:55.463' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (47, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:26:29.067' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (48, 0, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 19:36:52.390' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (49, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:53:48.377' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (50, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:53:51.807' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (51, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:53:55.647' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (52, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:55:00.910' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (53, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:56:40.477' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (54, 6, N'Bạn đã reset mật khẩu cho người dùng:Thái Hùng Đoàn', CAST(N'2017-06-09 19:57:18.607' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (55, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 19:59:13.453' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (56, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 20:01:34.977' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (57, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 20:01:56.847' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (58, 6, N'Bạn đã reset mật khẩu cho người dùng:Phùng Quân Lạc', CAST(N'2017-06-09 20:02:08.973' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (59, 6, N'Bạn đã reset mật khẩu cho người dùng:Thái Hùng Đoàn', CAST(N'2017-06-09 20:02:16.773' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (60, 6, N'Bạn đã reset mật khẩu cho người dùng:Lê Quốc Minh', CAST(N'2017-06-09 20:02:22.607' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (61, 6, N'Bạn đã reset mật khẩu cho người dùng:Hứa Hoàng Nhất', CAST(N'2017-06-09 20:02:27.530' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (62, 6, N'Bạn đã reset mật khẩu cho người dùng:quanlac', CAST(N'2017-06-09 20:02:32.230' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (63, 1, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:03:58.343' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (64, 0, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:06:12.303' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (65, 0, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:37:49.597' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (66, 6, N'Bạn đã cho phép Lu bán hang trong 7 ngày!', CAST(N'2017-06-09 20:38:55.637' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (67, 6, N'Bạn đã cập nhật danh mục :Trang Sức thành:', CAST(N'2017-06-09 20:39:27.793' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (68, 6, N'Bạn đã cập nhật danh mục : thành:Trang Sức', CAST(N'2017-06-09 20:39:37.457' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (69, 2, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:41:45.907' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (70, 6, N'Bạn đã cho phép Lu bán hang trong 7 ngày!', CAST(N'2017-06-09 20:42:29.177' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (71, 3, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:48:33.397' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (72, 4, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:49:37.610' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (73, 6, N'Bạn đã cho phép Hứa Hoàng Nhất bán hang trong 7 ngày!', CAST(N'2017-06-09 20:49:52.017' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (74, 4, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:53:35.960' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (75, 4, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 20:56:36.080' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (76, 6, N'Bạn đã cho phép Hứa Hoàng Nhất bán hang trong 7 ngày!', CAST(N'2017-06-09 20:56:50.980' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (77, 4, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-09 20:58:55.173' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (78, 4, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-09 20:59:13.940' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (79, 6, N'Bạn đã cập nhật danh mục :Trang Sức thành:Trang Sức', CAST(N'2017-06-09 21:21:45.273' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (80, 4, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 22:15:28.083' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (81, 2, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-09 22:16:04.727' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (82, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:25:34.850' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (83, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:25:46.390' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (84, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:33:59.723' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (85, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:34:45.580' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (86, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:34:47.153' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (87, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:40:53.747' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (88, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:40:55.757' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (89, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:41:59.057' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (90, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:42:02.433' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (91, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:43:52.973' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (92, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:43:55.220' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (93, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:45:01.577' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (94, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:45:04.953' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (95, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:45:54.810' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (96, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:46:22.063' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (97, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:46:45.333' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (98, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:47:48.497' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (99, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:47:50.900' AS DateTime), 1)
GO
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (100, 6, N'Bạn đã cho phép :Hứa Hoàng Nhất bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:48:55.537' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (101, 6, N'Bạn đã cho phép :Lê Quốc Minh bán hàng trong 7 ngày!', CAST(N'2017-06-10 03:48:59.267' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (102, 6, N'Bạn đã cập nhật mật khẩu thành công!', CAST(N'2017-06-10 03:49:27.617' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (103, 6, N'Bạn đã cập nhật mật khẩu thành công!', CAST(N'2017-06-10 03:49:44.343' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (104, 6, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 03:50:08.647' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (105, 6, N'Bạn đã cập nhật mật khẩu thất bại!', CAST(N'2017-06-10 04:14:37.057' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (106, 6, N'Bạn đã cập nhật mật khẩu thất bại!', CAST(N'2017-06-10 04:18:58.743' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (107, 6, N'Bạn đã cập nhật mật khẩu thất bại!', CAST(N'2017-06-10 04:44:21.417' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (108, 6, N'Bạn đã cập nhật mật khẩu thất bại!', CAST(N'2017-06-10 13:25:21.707' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (109, 6, N'Bạn đã cập nhật danh mục :Trang Sức thành:Trang Sức', CAST(N'2017-06-10 13:25:35.770' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (110, 6, N'Bạn đã cập nhật danh mục :Trang Sức thành:Trang Sức', CAST(N'2017-06-10 13:26:38.180' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (111, 4, N'Bạn đã cập nhật mật khẩu thất bại!', CAST(N'2017-06-10 13:54:43.753' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (112, 4, N'Bạn đã cập nhật mật khẩu thất bại!', CAST(N'2017-06-10 13:54:47.240' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (113, 4, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 13:55:04.570' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (114, 4, N'Bạn đã cập nhật mật khẩu thành công!', CAST(N'2017-06-10 13:57:39.397' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (115, 4, N'Bạn đã xóa yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-10 13:58:53.663' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (116, 4, N'Bạn đã thêm yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-10 13:58:54.727' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (117, 7, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:43:50.723' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (118, 6, N'Bạn đã cho phép :ha bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:44:09.223' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (119, 7, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:45:14.720' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (120, 7, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:46:43.033' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (121, 6, N'Bạn đã cho phép :ha bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:46:54.543' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (122, 7, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:50:01.747' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (123, 6, N'Bạn đã cho phép ha bán hang trong 7 ngày!', CAST(N'2017-06-10 14:50:20.350' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (124, 7, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:51:01.550' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (125, 6, N'Bạn đã cho phép :ha bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:51:12.010' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (126, 8, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:56:48.837' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (127, 6, N'Bạn đã cho phép :quoc bán hàng trong 7 ngày!', CAST(N'2017-06-10 14:56:57.617' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (128, 8, N'Bạn đã cập nhật mật khẩu thành công!', CAST(N'2017-06-10 14:57:20.430' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (129, 3, N'Bạn đã thêm yêu thích san phẩm :Torrini KC241', CAST(N'2017-06-10 15:00:06.777' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (130, 3, N'Bạn đã thêm yêu thích san phẩm :Nokia 7610', CAST(N'2017-06-10 15:00:07.653' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (131, 3, N'Bạn đã thêm yêu thích san phẩm :quoc 1', CAST(N'2017-06-10 15:00:10.217' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (132, 3, N'Bạn đã xóa yêu thích san phẩm :quoc 1', CAST(N'2017-06-10 15:00:10.423' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (133, 3, N'Bạn đã thêm yêu thích san phẩm :nhat ngu', CAST(N'2017-06-10 15:00:11.237' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (134, 3, N'Bạn đã thêm sản phẩm :tuan 1 thất bại!', CAST(N'2017-06-10 15:10:08.783' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (135, 3, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 15:10:24.440' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (136, 6, N'Bạn đã cho phép :Nguyễn Văn Công Tuấn bán hàng trong 7 ngày!', CAST(N'2017-06-10 15:11:11.347' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (137, 3, N'Bạn đã thêm sản phẩm :tuan1thành công!', CAST(N'2017-06-10 15:11:54.697' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (138, 8, N'Bạn đã thêm sản phẩm :quoc tythành công!', CAST(N'2017-06-10 15:33:51.800' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (139, 4, N'Bạn đã thêm sản phẩm :nhat thất bại!', CAST(N'2017-06-10 15:50:09.207' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (140, 4, N'Bạn đã thêm sản phẩm :nhat thất bại!', CAST(N'2017-06-10 15:58:32.220' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (141, 4, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 15:59:26.553' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (142, 1, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 15:59:56.637' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (143, 1, N'Bạn đã yêu cầu bán hàng trong 7 ngày!', CAST(N'2017-06-10 16:00:26.963' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (144, 6, N'Bạn đã hủy đơn yêu cầu của :Hứa Hoàng Nhất xin bán hàng trong 7 ngày!', CAST(N'2017-06-10 16:01:02.527' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (145, 4, N'Yêu cầu của bạn không được duyệt!', CAST(N'2017-06-10 16:01:02.630' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (146, 6, N'Bạn đã cho phép :Thái Hùng Đoàn bán hàng trong 7 ngày!', CAST(N'2017-06-10 16:01:04.193' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (147, 1, N'Admin cho đã duyệt yêu cầu bán hàng của bạn', CAST(N'2017-06-10 16:01:04.197' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (148, 4, N'Bạn đã cập nhật mật khẩu thành công!', CAST(N'2017-06-10 16:01:58.957' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (149, 4, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:02:06.253' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (150, 4, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:02:16.403' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (151, 4, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:02:19.503' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (152, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:04:21.710' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (153, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:04:33.337' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (154, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:04:40.560' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (155, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:06:50.707' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (156, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:06:56.343' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (157, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:07:02.720' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (158, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:07:11.317' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (159, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:13:40.047' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (160, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:14:01.037' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (161, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:14:07.833' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (162, 3, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:14:15.170' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (163, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:14:31.213' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (164, 3, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:16:18.070' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (165, 3, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:16:22.707' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (166, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:16:29.160' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (167, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:31:02.870' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (168, 3, N'Bạn đã cập nhật thông tin thất bại!', CAST(N'2017-06-10 16:31:07.850' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (169, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:31:20.747' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (170, 3, N'Bạn đã cập nhật thông tin thành công!', CAST(N'2017-06-10 16:31:26.107' AS DateTime), 1)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (171, 3, N'Bạn đã xóa yêu thích san phẩm :nhat ngu', CAST(N'2017-06-11 13:18:49.687' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (172, 3, N'Bạn đã thêm yêu thích san phẩm :Bông tai nạm hạt rubby', CAST(N'2017-06-11 13:18:56.470' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (173, 3, N'Bạn đã xóa yêu thích san phẩm :Simen AP75', CAST(N'2017-06-11 15:22:27.577' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (174, 3, N'Bạn đã thêm yêu thích san phẩm :Simen AP75', CAST(N'2017-06-11 15:22:28.417' AS DateTime), 0)
INSERT [dbo].[thongbao] ([id], [id_nguoidung], [noidung], [ngaytao], [daxem]) VALUES (175, 3, N'Bạn đã thêm sản phẩm :tuan newthành công!', CAST(N'2017-06-11 15:23:24.680' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[thongbao] OFF
SET IDENTITY_INSERT [dbo].[yeucau] ON 

INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (1, 0, 1, CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-12 16:16:18.593' AS DateTime), 0, N'')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (2, 3, 1, CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-12 16:16:29.557' AS DateTime), 0, N'<p>
	asdassdsd</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (3, 1, 1, CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-17 03:25:46.380' AS DateTime), 0, N'<p>
	12312</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (4, 2, 1, CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), 0, N'<p>
	adasd</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (5, 4, 1, CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), CAST(N'2017-06-06 20:37:49.000' AS DateTime), 0, N'<p>
	13123123</p>
<p>
	13</p>
<p>
	123</p>
<p>
	12</p>
<p>
	312</p>
<p>
	&nbsp;</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (6, 4, 1, CAST(N'2017-06-09 20:56:36.067' AS DateTime), CAST(N'2017-06-09 20:56:50.827' AS DateTime), CAST(N'2017-06-16 20:56:50.827' AS DateTime), 0, N'<p>
	1231232131312</p>
<p>
	312312</p>
<p>
	312</p>
<p>
	31</p>
<p>
	2</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (7, 4, 1, CAST(N'2017-06-09 22:15:27.657' AS DateTime), CAST(N'2017-06-10 03:48:55.523' AS DateTime), CAST(N'2017-06-17 03:48:55.523' AS DateTime), 0, N'')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (8, 2, 1, CAST(N'2017-06-09 22:16:04.707' AS DateTime), CAST(N'2017-06-10 03:48:59.257' AS DateTime), CAST(N'2017-06-17 03:48:59.257' AS DateTime), 0, N'<p>
	asdada</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (9, 7, 1, CAST(N'2017-06-10 14:45:14.717' AS DateTime), CAST(N'2017-06-10 14:44:09.197' AS DateTime), CAST(N'2017-06-17 14:44:09.197' AS DateTime), 0, N'')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (10, 7, 1, CAST(N'2017-06-10 14:46:43.027' AS DateTime), CAST(N'2017-06-10 14:46:54.537' AS DateTime), CAST(N'2017-06-17 14:46:54.537' AS DateTime), 0, N'<p>
	123123</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (11, 7, 1, CAST(N'2017-06-10 14:50:01.660' AS DateTime), CAST(N'2017-06-10 14:50:20.320' AS DateTime), CAST(N'2017-06-17 14:50:20.320' AS DateTime), 0, N'<p>
	sadasd</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (12, 7, 1, CAST(N'2017-06-10 14:51:01.547' AS DateTime), CAST(N'2017-06-10 14:51:12.000' AS DateTime), CAST(N'2017-06-17 14:51:12.000' AS DateTime), 1, N'<p>
	adasd</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (13, 8, 1, CAST(N'2017-06-10 14:56:48.827' AS DateTime), CAST(N'2017-06-10 14:56:57.587' AS DateTime), CAST(N'2017-06-17 14:56:57.587' AS DateTime), 1, N'<p>
	i want to sell</p>
<p>
	&nbsp;</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (14, 3, 1, CAST(N'2017-06-10 15:10:24.430' AS DateTime), CAST(N'2017-06-10 15:11:11.327' AS DateTime), CAST(N'2017-06-17 15:11:11.327' AS DateTime), 1, N'<p>
	i want to ban hang</p>
<p>
	&nbsp;</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (15, 4, 0, CAST(N'2017-06-10 15:59:26.527' AS DateTime), NULL, NULL, 0, N'<p>
	tao muon ban hang nhe</p>
<p>
	&nbsp;</p>
')
INSERT [dbo].[yeucau] ([id], [id_nguoidung], [capphep], [ngaytao], [ngayduocban], [ngayketthuc], [tinhtrang], [noidung]) VALUES (16, 1, 1, CAST(N'2017-06-10 16:00:26.907' AS DateTime), CAST(N'2017-06-10 16:01:04.063' AS DateTime), CAST(N'2017-06-17 16:01:04.063' AS DateTime), 1, N'<p>
	toi xin dc ban hang trong 7 ngay</p>
')
SET IDENTITY_INSERT [dbo].[yeucau] OFF
SET IDENTITY_INSERT [dbo].[yeuthich] ON 

INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (1, 0, 3)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (3, 0, 6)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (8, 0, 8)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (9, 0, 10)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (12, 1, 15)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (14, 1, 13)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (22, 1, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (23, 1, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (27, 1, 11)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (36, 0, 15)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (53, 3, 10)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (62, 2, 7)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (64, 2, 13)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (66, 2, 5)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (67, 2, 14)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (68, 2, 3)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (71, 2, 8)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (74, 3, 7)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (75, 3, 9)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (80, 1, 5)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (81, 1, 8)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (82, 1, 14)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (84, 4, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (85, 4, 6)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (86, 4, 7)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (88, 4, 5)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (89, 4, 3)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (90, 3, 3)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (91, 3, 4)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (94, 3, 8)
INSERT [dbo].[yeuthich] ([id], [id_nguoidung], [id_sanpham]) VALUES (95, 3, 6)
SET IDENTITY_INSERT [dbo].[yeuthich] OFF
