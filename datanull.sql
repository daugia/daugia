USE [daugia]
GO
/****** Object:  Table [dbo].[binhluan]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[chinhsuachitietsp]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[danhgia]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[danhmuc]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[kichnguoidung]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[lichsudau]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[nguoidung]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[sanpham]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[thongbao]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[yeucau]    Script Date: 6/11/2017 16:01:18 ******/
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
/****** Object:  Table [dbo].[yeuthich]    Script Date: 6/11/2017 16:01:18 ******/
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
