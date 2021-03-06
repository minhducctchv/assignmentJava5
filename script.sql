USE [master]
GO
/****** Object:  Database [Java5]    Script Date: 29/12/2020 9:44:06 CH ******/
CREATE DATABASE [Java5]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Java5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Java5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Java5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Java5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Java5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Java5] SET ARITHABORT OFF 
GO
ALTER DATABASE [Java5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Java5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Java5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Java5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Java5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Java5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Java5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Java5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Java5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Java5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Java5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Java5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Java5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Java5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Java5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Java5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Java5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Java5] SET RECOVERY FULL 
GO
ALTER DATABASE [Java5] SET  MULTI_USER 
GO
ALTER DATABASE [Java5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Java5] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Java5', N'ON'
GO
USE [Java5]
GO
/****** Object:  Table [dbo].[ABC]    Script Date: 29/12/2020 9:44:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ABC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[COT1] [int] NULL,
	[COT2] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[gioct]    Script Date: 29/12/2020 9:44:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gioct](
	[idtk] [int] NOT NULL,
	[idsp] [int] NOT NULL,
	[sl] [int] NOT NULL,
 CONSTRAINT [pk_gioct] PRIMARY KEY CLUSTERED 
(
	[idtk] ASC,
	[idsp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 29/12/2020 9:44:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[idsp] [int] IDENTITY(1,1) NOT NULL,
	[tensp] [nvarchar](50) NOT NULL,
	[sl] [int] NOT NULL,
	[gia] [money] NOT NULL,
	[hinh] [nvarchar](200) NOT NULL,
 CONSTRAINT [pk_sanpham] PRIMARY KEY CLUSTERED 
(
	[idsp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taikhoan]    Script Date: 29/12/2020 9:44:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taikhoan](
	[idtk] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
	[vaitro] [bit] NOT NULL,
 CONSTRAINT [pk_taikhoan] PRIMARY KEY CLUSTERED 
(
	[idtk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ABC] ON 

INSERT [dbo].[ABC] ([ID], [COT1], [COT2]) VALUES (3, 1, 2)
INSERT [dbo].[ABC] ([ID], [COT1], [COT2]) VALUES (4, 1, 2)
SET IDENTITY_INSERT [dbo].[ABC] OFF
INSERT [dbo].[gioct] ([idtk], [idsp], [sl]) VALUES (1, 10, 2)
INSERT [dbo].[gioct] ([idtk], [idsp], [sl]) VALUES (1, 14, 3)
INSERT [dbo].[gioct] ([idtk], [idsp], [sl]) VALUES (2, 8, 1)
INSERT [dbo].[gioct] ([idtk], [idsp], [sl]) VALUES (2, 12, 2)
INSERT [dbo].[gioct] ([idtk], [idsp], [sl]) VALUES (4, 7, 1)
INSERT [dbo].[gioct] ([idtk], [idsp], [sl]) VALUES (4, 8, 2)
SET IDENTITY_INSERT [dbo].[sanpham] ON 

INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (6, N'Toán lớp 6', 1200, 15000.0000, N'd2c12a14c2180d9547bcb2424799c14e.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (7, N'Văn lớp 7', 1500, 13000.0000, N'nhac 6.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (8, N'Nhạc lớp 8', 135, 20000.0000, N'sinh 6.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (9, N'Địa lý 9', 300, 50000.0000, N'sinh 6.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (10, N'Công nghệ 12', 1500, 30000.0000, N'sys 6.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (11, N'Vật lí 3', 600, 5000.0000, N'ta 6.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (12, N'GDCD 12', 600, 10000.0000, N'toan 6.jpg')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (13, N'Truyện Conan', 50, 5000.0000, N'noimage.png')
INSERT [dbo].[sanpham] ([idsp], [tensp], [sl], [gia], [hinh]) VALUES (14, N'Truyện Doremon', 150, 5500.0000, N'noimage.png')
SET IDENTITY_INSERT [dbo].[sanpham] OFF
SET IDENTITY_INSERT [dbo].[taikhoan] ON 

INSERT [dbo].[taikhoan] ([idtk], [name], [email], [pass], [vaitro]) VALUES (1, N'ducpro', N'ducpro@gmail.com', N'123456', 1)
INSERT [dbo].[taikhoan] ([idtk], [name], [email], [pass], [vaitro]) VALUES (2, N'ducvip', N'ducvip@gmail.com', N'123456', 1)
INSERT [dbo].[taikhoan] ([idtk], [name], [email], [pass], [vaitro]) VALUES (3, N'Nguyễn Văn A', N'khachhang@gmail.com', N'123456', 0)
INSERT [dbo].[taikhoan] ([idtk], [name], [email], [pass], [vaitro]) VALUES (4, N'Trần Thị Dung', N'dungtt@gmail.com', N'123456', 0)
SET IDENTITY_INSERT [dbo].[taikhoan] OFF
ALTER TABLE [dbo].[gioct]  WITH CHECK ADD  CONSTRAINT [fk_sanpham_gioct] FOREIGN KEY([idsp])
REFERENCES [dbo].[sanpham] ([idsp])
GO
ALTER TABLE [dbo].[gioct] CHECK CONSTRAINT [fk_sanpham_gioct]
GO
ALTER TABLE [dbo].[gioct]  WITH CHECK ADD  CONSTRAINT [fk_taikhoan_gioct] FOREIGN KEY([idtk])
REFERENCES [dbo].[taikhoan] ([idtk])
GO
ALTER TABLE [dbo].[gioct] CHECK CONSTRAINT [fk_taikhoan_gioct]
GO
USE [master]
GO
ALTER DATABASE [Java5] SET  READ_WRITE 
GO
