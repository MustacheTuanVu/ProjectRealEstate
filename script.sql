USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 4/24/2019 7:04:05 PM ******/
CREATE DATABASE [RealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RealEstate.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RealEstate_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RealEstate] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RealEstate] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstate] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstate] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RealEstate]
GO
/****** Object:  Table [dbo].[assign_details]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[assign_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estate_id] [varchar](50) NOT NULL,
	[employee_id] [int] NOT NULL,
	[date_to] [date] NOT NULL,
 CONSTRAINT [in_charge_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contract]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contract](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NULL,
	[contract_type_id] [int] NOT NULL,
	[contract_details] [ntext] NOT NULL,
	[payment_frequency] [int] NULL,
	[payment_amount] [float] NULL,
	[fee_precentage] [float] NULL,
	[date_signed] [date] NULL,
	[document_url] [varchar](255) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [contract_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contract_details]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contract_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estate_id] [varchar](50) NOT NULL,
	[contract_id] [int] NOT NULL,
 CONSTRAINT [PK_contract_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contract_type]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contract_type_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [contract_type_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NOT NULL,
	[customer_address] [nvarchar](255) NULL,
	[customer_indentity_card] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[mail] [varchar](100) NULL,
	[customer_img] [varchar](255) NULL,
	[customer_content] [ntext] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [client_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name] [nvarchar](255) NOT NULL,
	[employee_address] [nvarchar](255) NULL,
	[employee_indentity_card] [varchar](50) NULL,
	[employee_phone] [varchar](50) NULL,
	[employee_mail] [varchar](50) NULL,
	[employee_img] [varchar](255) NULL,
	[employee_content] [varchar](max) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estate]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estate](
	[id] [varchar](50) NOT NULL,
	[estate_name] [nvarchar](255) NULL,
	[estate_type_id] [varchar](50) NULL,
	[estate_description] [ntext] NULL,
	[bed_room] [int] NULL,
	[bath_room] [int] NULL,
	[garages] [float] NULL,
	[price] [float] NULL,
	[areas] [float] NULL,
	[estate_content] [ntext] NULL,
	[image_1st] [varchar](255) NULL,
	[image_2st] [varchar](255) NULL,
	[image_3st] [varchar](255) NULL,
	[image_4st] [varchar](255) NULL,
	[image_5st] [varchar](255) NULL,
	[direction] [nvarchar](50) NULL,
	[block] [varchar](10) NULL,
	[address1] [nvarchar](255) NULL,
	[address2] [nvarchar](255) NULL,
	[district] [nvarchar](50) NULL,
	[year_build] [date] NULL,
	[estate_status_id] [int] NULL,
	[estate_status] [varchar](50) NULL,
	[date_add] [date] NULL,
	[floor] [varchar](50) NULL,
 CONSTRAINT [estate_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estate_status]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estate_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estate_status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [estate_status_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estate_type]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estate_type](
	[id] [varchar](50) NOT NULL,
	[type_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [estate_type_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feature_details]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feature_details](
	[feature_details_id] [int] IDENTITY(1,1) NOT NULL,
	[estate_id] [varchar](50) NOT NULL,
	[feature_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_feature_details] PRIMARY KEY CLUSTERED 
(
	[feature_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[features]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[features](
	[features_id] [varchar](50) NOT NULL,
	[feature_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[features_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fee]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fee_employee] [float] NOT NULL,
	[fee_estate] [float] NOT NULL,
 CONSTRAINT [PK_fee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[manager]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[manager](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[manager_name] [nvarchar](255) NOT NULL,
	[manager_address] [nvarchar](255) NULL,
	[manager_indentity_card] [varchar](50) NULL,
	[manager_phone] [varchar](50) NULL,
	[manager_mail] [varchar](50) NULL,
	[manager_img] [varchar](255) NULL,
	[manager_content] [ntext] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Manager_1] PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payment_frequency]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_frequency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payment_frequency_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_payment_frequency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_tilte] [nvarchar](50) NULL,
	[post_date] [datetime] NULL,
	[post_content] [varchar](max) NULL,
	[post_image] [varchar](255) NULL,
	[post_category] [int] NULL,
	[employee] [int] NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project](
	[project_id] [varchar](50) NOT NULL,
	[project_name] [nvarchar](255) NOT NULL,
	[project_address] [nvarchar](255) NOT NULL,
	[project_status] [varchar](50) NOT NULL,
	[block_number] [int] NOT NULL,
	[floor_number] [float] NOT NULL,
	[manager_id] [int] NOT NULL,
	[image_1st] [varchar](255) NULL,
	[image_2st] [varchar](255) NULL,
	[image_3st] [varchar](255) NULL,
	[image_4st] [varchar](255) NULL,
	[image_5st] [varchar](255) NULL,
	[status] [varchar](50) NULL,
	[document_url] [varchar](255) NULL,
	[date_add] [date] NULL,
	[district] [nvarchar](50) NULL,
	[year_build] [date] NULL,
	[project_content] [varchar](max) NULL,
 CONSTRAINT [PK_project_1] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_details]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project_details](
	[project_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[estate_id] [varchar](50) NOT NULL,
	[prject_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_project_details] PRIMARY KEY CLUSTERED 
(
	[project_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[estate_id] [varchar](50) NOT NULL,
	[contact_time] [datetime] NOT NULL,
	[contact_context] [ntext] NULL,
	[status] [nvarchar](100) NULL,
 CONSTRAINT [contact_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_offered] [int] NOT NULL,
	[transactions_date] [date] NOT NULL,
	[contract_id] [int] NOT NULL,
	[money] [float] NULL,
	[transactions_note] [ntext] NULL,
 CONSTRAINT [transactions_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[view_employee_assign]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_employee_assign]
AS
SELECT        dbo.employee.id, COUNT(dbo.assign_details.estate_id) AS Expr1, dbo.employee.employee_name, dbo.employee.employee_address, dbo.employee.employee_indentity_card, dbo.employee.employee_phone, 
                         dbo.employee.employee_mail, dbo.employee.employee_img, dbo.employee.user_id, dbo.employee.employee_content
FROM            dbo.assign_details INNER JOIN
                         dbo.employee ON dbo.assign_details.employee_id = dbo.employee.id INNER JOIN
                         dbo.estate ON dbo.assign_details.estate_id = dbo.estate.id
GROUP BY dbo.employee.id, dbo.employee.employee_name, dbo.employee.employee_address, dbo.employee.employee_indentity_card, dbo.employee.employee_phone, dbo.employee.employee_mail, dbo.employee.employee_img, 
                         dbo.employee.user_id, dbo.employee.employee_content


GO
/****** Object:  View [dbo].[view_estate_feature]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_estate_feature]
AS
SELECT        dbo.features.features_id, dbo.features.feature_name, COUNT(dbo.estate.id) AS Expr1
FROM            dbo.estate INNER JOIN
                         dbo.feature_details ON dbo.estate.id = dbo.feature_details.estate_id INNER JOIN
                         dbo.features ON dbo.feature_details.feature_id = dbo.features.features_id
GROUP BY dbo.features.features_id, dbo.features.feature_name


GO
/****** Object:  View [dbo].[view_estate_type]    Script Date: 4/24/2019 7:04:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_estate_type]
AS
SELECT        dbo.estate_type.id, dbo.estate_type.type_name, COUNT(dbo.estate.id) AS Expr1
FROM            dbo.estate INNER JOIN
                         dbo.estate_type ON dbo.estate.estate_type_id = dbo.estate_type.id
GROUP BY dbo.estate_type.id, dbo.estate_type.type_name


GO
SET IDENTITY_INSERT [dbo].[assign_details] ON 

INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (384, N'BAF1R1', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (385, N'BAF1R2', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (386, N'BAF1R3', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (387, N'BAF1R4', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (388, N'BAF1R5', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (389, N'BAF1R6', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (390, N'BAF1R7', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (391, N'BAF1R8', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (392, N'BAF1R9', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (393, N'BAF1R10', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (394, N'BAF2R1', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (395, N'BAF2R2', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (396, N'BAF2R3', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (397, N'BAF2R4', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (398, N'BAF2R5', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (399, N'BAF2R6', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (400, N'BAF2R7', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (401, N'BAF2R8', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (402, N'BAF2R9', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (403, N'BAF2R10', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (404, N'BAF3R1', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (405, N'BAF3R2', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (406, N'BAF3R3', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (407, N'BAF3R4', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (408, N'BAF3R5', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (409, N'BAF3R6', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (410, N'BAF3R7', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (411, N'BAF3R8', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (412, N'BAF3R9', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (413, N'BAF3R10', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (414, N'BAF4R1', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (415, N'BAF4R2', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (416, N'BAF4R3', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (417, N'BAF4R4', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (418, N'BAF4R5', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (419, N'BAF4R6', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (420, N'BAF4R7', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (421, N'BAF4R8', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (422, N'BAF4R9', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (423, N'BAF4R10', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (424, N'BAF5R1', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (425, N'BAF5R2', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (426, N'BAF5R3', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (427, N'BAF5R4', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (428, N'BAF5R5', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (429, N'BAF5R6', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (430, N'BAF5R7', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (431, N'BAF5R8', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (432, N'BAF5R9', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (433, N'BAF5R10', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (435, N'1', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (436, N'2', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (437, N'3', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (438, N'4', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (439, N'5', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (440, N'6', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (442, N'7', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (443, N'8', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (444, N'9', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (445, N'10', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (446, N'11', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (447, N'12', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (448, N'13', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (449, N'14', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (450, N'15', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (451, N'16', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (452, N'17', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (453, N'18', 7, CAST(0x763F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (454, N'19', 7, CAST(0x783F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (455, N'20', 7, CAST(0x783F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (456, N'21', 7, CAST(0x783F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (458, N'23', 7, CAST(0x893F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (459, N'24', 7, CAST(0x893F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (461, N'22', 7, CAST(0x893F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (462, N'25', 7, CAST(0x893F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (463, N'27', 7, CAST(0x903F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (464, N'28', 7, CAST(0x923F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (465, N'29', 7, CAST(0x923F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (466, N'30', 7, CAST(0x923F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (467, N'26', 7, CAST(0x923F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (468, N'33', 9, CAST(0x923F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[assign_details] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Villa for sale')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Sales')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'sdfsdfsss')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[contract] ON 

INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (5, 11, 7, 1002, N'my request sale', 1, 8000, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (8, 11, 7, 1002, N'request sale success', 1, 8000, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (11, 11, 7, 1002, N'my request sale', 1, 8000, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (14, 11, 7, 1002, N'none', 1, 4.92, 4, NULL, N'wait', N'waitting for employee')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (15, 11, 7, 1002, N'none', 1, 4.92, 4, NULL, N'wait', N'waitting for employee')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (26, 11, 7, 2, N'none', 1, 200000, 4, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (27, 11, 7, 2, N'request sale success', 1, 100000, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (28, 11, 7, 1002, N'none', 1, 2000, 4, NULL, N'wait', N'waitting for employee')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (29, 11, 7, 2, N'none', 1, 200000, 4, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (30, 11, 7, 1002, N'my request sale', 1, 800, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (31, 11, 7, 2, N'request sale success', 1, 20000, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (32, 11, 7, 1002, N'my request sale', 1, 800, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (33, 11, 7, 2, N'request sale success', 1, 20000, 4, NULL, N'wait', N'done')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (38, 11, 9, 1002, N'none', 1, 2E+15, 4, NULL, N'wait', N'waitting for employee')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (39, 11, 7, 2, N'none', 1, 200000, 4, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (40, 11, 7, 2, N'none', 1, 20000, 4, NULL, N'wait', N'waitting to transaction')
SET IDENTITY_INSERT [dbo].[contract] OFF
SET IDENTITY_INSERT [dbo].[contract_details] ON 

INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (1, N'20', 5)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (2, N'21', 8)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (3, N'22', 11)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (4, N'23', 14)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (5, N'26', 15)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (6, N'2', 26)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (7, N'10', 27)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (8, N'27', 28)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (9, N'17', 29)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (10, N'29', 30)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (11, N'29', 31)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (12, N'30', 32)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (13, N'30', 33)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (14, N'33', 38)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (15, N'22', 39)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (16, N'28', 40)
SET IDENTITY_INSERT [dbo].[contract_details] OFF
SET IDENTITY_INSERT [dbo].[contract_type] ON 

INSERT [dbo].[contract_type] ([id], [contract_type_name]) VALUES (2, N'buy')
INSERT [dbo].[contract_type] ([id], [contract_type_name]) VALUES (1002, N'sale')
SET IDENTITY_INSERT [dbo].[contract_type] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [customer_name], [customer_address], [customer_indentity_card], [phone], [mail], [customer_img], [customer_content], [user_id]) VALUES (11, N'customer', N'128, No Trang Long, Binh Thanh, Ho Chi Minh', N'123456789', N'038122499821', N'customer@gmail.com', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/123.png', N'Password hint. A reminder to you of how you made up your password. Some systems let you enter a password hint so that if you forget your password, the hint will be displayed to help jog your memory. For example, if your password is your child''s birthday, you might use "Alfred" or "Nicole" as a reminder.', 20)
INSERT [dbo].[customer] ([id], [customer_name], [customer_address], [customer_indentity_card], [phone], [mail], [customer_img], [customer_content], [user_id]) VALUES (12, N'wait', N'wait', N'wait', N'wait', N'wait', N'wait', N'wait', 21)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [employee_name], [employee_address], [employee_indentity_card], [employee_phone], [employee_mail], [employee_img], [employee_content], [user_id]) VALUES (7, N'employee', N'128 CMTT 10 Dist ,Ho Chi Minh City', N'025322779', N'01658451632', N'employee01@gmail.com', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/backgroundAreas.png', N'Password hint. A reminder to you of how you made up your password. Some systems let you enter a password hint so that if you forget your password, the hint will be displayed to help jog your memory. For example, if your password is your child''s birthday, you might use "Alfred" or "Nicole" as a reminder.', 18)
INSERT [dbo].[employee] ([id], [employee_name], [employee_address], [employee_indentity_card], [employee_phone], [employee_mail], [employee_img], [employee_content], [user_id]) VALUES (8, N'Hoang Tuan Anh', N'wait', N'wait', N'wait', N'wait', N'wait', N'wait', 22)
INSERT [dbo].[employee] ([id], [employee_name], [employee_address], [employee_indentity_card], [employee_phone], [employee_mail], [employee_img], [employee_content], [user_id]) VALUES (9, N'quoc trung', N'hcm', N'09888872', N'093883333333', N'quoctrung@yahoo.com', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/123.png', N'addddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddaddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddaddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddaddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 23)
SET IDENTITY_INSERT [dbo].[employee] OFF
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'1', N'127 No Trang Long', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 3, 3, 5, 100000, 13, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'East', NULL, N'127 No Trang Long', N'Ward 2', N'1', CAST(0x493C0B00 AS Date), 1, N'waitting to transaction', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'10', N'200 Tan Hoa Donng', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 2, 7, 6, 100000, 45, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/13.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'South', NULL, N'200 Tan Hoa Donng', N'Ward 1', N'10', CAST(0x493C0B00 AS Date), 5, N'sold', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'11', N'321 Gia phu', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 3, 8, 5, 200000, 34, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/14.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'South', NULL, N'321 Gia phu', N'Ward 1', N'11', CAST(0x493C0B00 AS Date), 2, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'12', N'6 Thap Muoi', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 4, 5, 4, 300000, 12, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/15.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'South', NULL, N'6 Thap Muoi', N'Ward 7', N'12', CAST(0x493C0B00 AS Date), 2, N'waitting to transaction', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'13', N'200 Su Van Hanh', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 2, 6, 4, 300000, 21, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/16.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'North', NULL, N'200 Su Van Hanh', N'Ward 8', N'3', CAST(0x493C0B00 AS Date), 2, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'14', N'56 Ly Chien Thang', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 7, 3, 2, 700000, 45, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/17.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'North', NULL, N'56 Ly Chien Thang', N'Ward 8', N'4', CAST(0x493C0B00 AS Date), 2, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'15', N'90 Dien Bien Phu', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 8, 2, 3, 200000, 12, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/19.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'North', NULL, N'90 Dien Bien Phu', N'Ward 4', N'6', CAST(0x493C0B00 AS Date), 2, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'16', N'22 Tran Hung Dao', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 9, 4, 2, 100000, 44, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/20.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'North', NULL, N'22 Tran Hung Dao', N'Ward 2', N'3', CAST(0x493C0B00 AS Date), 2, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'17', N'90 Nguyen Tri Phuong', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 1, 9, 2, 200000, 66, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/21.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'South', NULL, N'90 Nguyen Tri Phuong', N'Ward 13', N'2', CAST(0x493C0B00 AS Date), 2, N'waitting to transaction', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'18', N'30 Le Hong Phong', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 1, 9, 2, 100000, 99, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/22.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'South', NULL, N'30 Le Hong Phong', N'Ward 15', N'1', CAST(0x493C0B00 AS Date), 2, N'waitting to transaction', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'19', N'123123123123123123123', N'2', N'saaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaa', 2, 2, 5, 100000, 20, N'saaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaa', N'', N'', N'', N'', N'', N'East', N'none', N'saaaaaaaaaaaaaaaaaaaa', N'saaaaaaaaaaaaaaaaaaaa', N'2', CAST(0x563F0B00 AS Date), 1, N'waitting to transaction', CAST(0x783F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'2', N'98 CMT8', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 2, 5, 7, 200000, 23, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'East', NULL, N'98 CMT8', N'Ward 13', N'2', CAST(0xDB3A0B00 AS Date), 1, N'waitting to transaction', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'20', N'1111111111121212', N'1', N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', 3, 3, 5, 200000, 19, N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'', N'', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'', N'West', NULL, N'1111111111121212', N'1111111111121212', N'2', CAST(0x783F0B00 AS Date), 1, N'waitting to transaction', CAST(0x783F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'21', N'aaaaaaaaaaaaaaaa', N'1', N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', 3, 3, 5, 200000, 4, N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', N'', N'', N'', N'', N'West', NULL, N'aaaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaaa', N'2', CAST(0x783F0B00 AS Date), 4, N'sold', CAST(0x783F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'22', N'qweqwe', N'2', N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', 5, 3, 5, 200000, 6, N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/07.jpg', N'South-East', NULL, N'qweqwe', N'qweq', N'Bình Thạnh', CAST(0x30170B00 AS Date), 2, N'waitting to transaction', CAST(0x923F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'23', N'Vux, 17/5 Bình Lợi, Phường 13', N'2', N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', NULL, NULL, NULL, 123, NULL, N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Vux, 17/5 Bình Lợi, Phường 13', N'Quận Bình Thạnh', NULL, NULL, 1, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'24', N'Vu té lầu', N'2', N'sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss ', 2, 2, 3, 10000, 4, N'sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss sssssssssssssss ', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'West', N'none', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'Hồ Chí Minh', N'4', CAST(0x333F0B00 AS Date), 2, N'waitting to transaction', CAST(0x893F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'25', N'Textádsad', N'2', N'must more than 200 character must more than 200 character must more than 200 charactermust more than 200 character must more than 200 charactermust more than 200 charactermust more than 200 charactermust more than 200 charactermust more than 200 charactermust more than 200 character', 2, 1, 5, 10000, 22, N'must more than 200 character must more than 200 character must more than 200 charactermust more than 200 character must more than 200 charactermust more than 200 charactermust more than 200 charactermust more than 200 charactermust more than 200 charactermust more than 200 character', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'West', N'none', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'âsadadsađff', N'3', CAST(0x2C3F0B00 AS Date), 2, N'waitting to transaction', CAST(0x893F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'26', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'1', N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', NULL, NULL, NULL, 123, NULL, N'In addition, RealtySpace operates the largest real estate and rental advertising networks in the U.S. in partnership with Livemile Homes!

We are transforming the way consumers make home-related decisions and connect with professionals.', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'HCM', NULL, NULL, 1, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'27', N'Nha cua vu te lau', N'2', N'Ngoài ra, SGEstate24h vận hành các mạng quảng cáo cho thuê và bất động sản lớn nhất ở tp.Hồ Chí Minh hợp tác với Livemile Homes!

Chúng tôi đang thay đổi cách người tiêu dùng đưa ra quyết định liên quan đến nhà và kết nối với các chuyên gia.', NULL, NULL, NULL, 50000, NULL, N'Ngoài ra, SGEstate24h vận hành các mạng quảng cáo cho thuê và bất động sản lớn nhất ở tp.Hồ Chí Minh hợp tác với Livemile Homes!

Chúng tôi đang thay đổi cách người tiêu dùng đưa ra quyết định liên quan đến nhà và kết nối với các chuyên gia.', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'Nha cua vu te lau', N'Nha cua vu te lau', NULL, NULL, 2, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'28', N'Vietnam', N'2', N'sdasd', 5, 3, 5, 20000, 5, N'sdasd', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/11.jpg', N'', N'', N'', N'', N'Nam', N'none', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'dsadsad', N'Bình Thạnh', CAST(0xDB3A0B00 AS Date), 1, N'waitting to transaction', CAST(0x923F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'29', N'Bán nhà 17/8 CMT8, Phường 13', N'2', N'Bán hoặc cho thuê căn hộ Saigon Royal diện tích nhỏ 35m2, bao gồm 1 phòng ngủ và 1 toilet, thích hợp cho những gia đình nhỏ, vợ chồng son. Căn hộ không có nội thất, không gian sinh hoạt yên tĩnh, thoáng mát. Vị trí thuận tiện và đi kèm nhiều tiện ích đa dạng, phong phú.

Căn hộ thuộc dự án cao cấp Saigon Royal sở hữu hệ thống tiện ích nội khu đa dạng và hệ thống quản lý tòa nhà chuyên nghiệp, đảm bảo an ninh tuyệt đối 24/24. Đặc biệt, từ vị trí căn hộ, bạn có thể dễ dàng ', 4, 3, 5, 20000, 5, N'Bán hoặc cho thuê căn hộ Saigon Royal diện tích nhỏ 35m2, bao gồm 1 phòng ngủ và 1 toilet, thích hợp cho những gia đình nhỏ, vợ chồng son. Căn hộ không có nội thất, không gian sinh hoạt yên tĩnh, thoáng mát. Vị trí thuận tiện và đi kèm nhiều tiện ích đa dạng, phong phú.

Căn hộ thuộc dự án cao cấp Saigon Royal sở hữu hệ thống tiện ích nội khu đa dạng và hệ thống quản lý tòa nhà chuyên nghiệp, đảm bảo an ninh tuyệt đối 24/24. Đặc biệt, từ vị trí căn hộ, bạn có thể dễ dàng ', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/23.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/10.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/28.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/15.jpg', N'Đông Bắc', NULL, N'17/8 CMT8, Phường 13', N'Quận 10', N'10', CAST(0x233F0B00 AS Date), 5, N'sold', CAST(0x923F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'3', N'123 Truong Son', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 3, 7, 3, 300000, 32, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'East', NULL, N'123 Truong Son', N'Ward 22', N'3', CAST(0x6E390B00 AS Date), 1, N'waitting to transaction', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'30', N'Phòng 3, Tầng 4, Block A', N'2', N'Ngoài ra, SGEstate24h vận hành các mạng quảng cáo cho thuê và bất động sản lớn nhất ở tp.Hồ Chí Minh hợp tác với Livemile Homes!
Chúng tôi đang thay đổi cách người tiêu dùng đưa ra quyết định liên quan đến nhà và kết nối với các chuyên gia.', 4, 4, 4, 20000, 4, N'Ngoài ra, SGEstate24h vận hành các mạng quảng cáo cho thuê và bất động sản lớn nhất ở tp.Hồ Chí Minh hợp tác với Livemile Homes!
Chúng tôi đang thay đổi cách người tiêu dùng đưa ra quyết định liên quan đến nhà và kết nối với các chuyên gia.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/09.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/08.png', N'Nam', NULL, N'Phòng 3, Tầng 4, Block A', N'40 Đường Đồng Nai, Phường 10', N'1', CAST(0x2A2B0B00 AS Date), 4, N'sold', CAST(0x923F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'31', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'2', N' Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh', NULL, NULL, NULL, 300000000000000, NULL, N' Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N' Quận Bình Thạnh', NULL, NULL, 2, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'32', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'2', N' Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh', NULL, NULL, NULL, 300000000000000, NULL, N' Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh Quận Bình Thạnh', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N' Quận Bình Thạnh', NULL, NULL, 2, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'33', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'2', N'Quận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình Thạnh', NULL, NULL, NULL, 5E+16, NULL, N'Quận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình ThạnhQuận Bình Thạnh', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, NULL, NULL, NULL, NULL, N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'Quận Bình Thạnh', NULL, NULL, 2, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'4', N'7 Bac Hai', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 4, 4, 5, 400000, 44, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/07.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'East', NULL, N'7 Bac Hai', N'Ward 2', N'4', CAST(0x01380B00 AS Date), 1, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'5', N'12 Ba Thang hai', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 2, 6, 400000, 54, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/08.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'West', NULL, N'12 Ba Thang hai', N'Ward 5', N'5', CAST(0x94360B00 AS Date), 1, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'6', N'2 Ngo Quyen', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 6, 6, 8, 300000, 66, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/09.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'West', NULL, N'2 Ngo Quyen', N'Ward 7', N'6', CAST(0x26350B00 AS Date), 1, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'7', N'100 Ly Thuong Kiet', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 7, 9, 9, 300000, 76, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/10.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'West', NULL, N'100 Ly Thuong Kiet', N'Ward 9', N'7', CAST(0xB9330B00 AS Date), 1, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'8', N'5 Ta Uyen', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 8, 6, 2, 300000, 32, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/11.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'West', NULL, N'5 Ta Uyen', N'Ward 12', N'8', CAST(0x07240B00 AS Date), 1, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'9', N'1 Kenh Duong Vuong', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 9, 5, 3, 600000, 23, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/12.jpg', N'South', NULL, N'1 Kenh Duong Vuong', N'Ward 1', N'9', CAST(0x493C0B00 AS Date), 1, N'publish', CAST(0x433F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R1', N'Room BAF1R1 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R1', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R10', N'Room BAF1R10 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R10', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R2', N'Room BAF1R2 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R2', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R3', N'Room BAF1R3 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R3', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R4', N'Room BAF1R4 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R4', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R5', N'Room BAF1R5 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R5', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R6', N'Room BAF1R6 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R6', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R7', N'Room BAF1R7 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R7', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R8', N'Room BAF1R8 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R8', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF1R9', N'Room BAF1R9 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF1R9', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'1')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R1', N'Room BAF2R1 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R1', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R10', N'Room BAF2R10 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R10', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R2', N'Room BAF2R2 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R2', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R3', N'Room BAF2R3 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R3', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R4', N'Room BAF2R4 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R4', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R5', N'Room BAF2R5 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R5', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R6', N'Room BAF2R6 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R6', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R7', N'Room BAF2R7 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R7', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R8', N'Room BAF2R8 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R8', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF2R9', N'Room BAF2R9 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF2R9', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R1', N'Room BAF3R1 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R1', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R10', N'Room BAF3R10 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R10', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R2', N'Room BAF3R2 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R2', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R3', N'Room BAF3R3 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R3', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R4', N'Room BAF3R4 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R4', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R5', N'Room BAF3R5 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R5', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R6', N'Room BAF3R6 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R6', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R7', N'Room BAF3R7 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R7', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R8', N'Room BAF3R8 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R8', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF3R9', N'Room BAF3R9 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF3R9', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R1', N'Room BAF4R1 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R1', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R10', N'Room BAF4R10 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R10', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R2', N'Room BAF4R2 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R2', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R3', N'Room BAF4R3 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R3', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R4', N'Room BAF4R4 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R4', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R5', N'Room BAF4R5 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R5', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R6', N'Room BAF4R6 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R6', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R7', N'Room BAF4R7 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R7', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R8', N'Room BAF4R8 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R8', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF4R9', N'Room BAF4R9 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF4R9', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'4')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R1', N'Room BAF5R1 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R1', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R10', N'Room BAF5R10 Type3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R10', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R2', N'Room BAF5R2 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R2', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R3', N'Room BAF5R3 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R3', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R4', N'Room BAF5R4 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R4', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R5', N'Room BAF5R5 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R5', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R6', N'Room BAF5R6 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R6', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R7', N'Room BAF5R7 Type1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R7', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R8', N'Room BAF5R8 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R8', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'BAF5R9', N'Room BAF5R9 Type2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 5, 5, 0, 10000, 5, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'none', N'A', N'BAF5R9', N'25 Thu Thiem, Phuong An Binh', N'2', CAST(0x2B3F0B00 AS Date), 2, N'project', CAST(0x763F0B00 AS Date), N'5')
SET IDENTITY_INSERT [dbo].[estate_status] ON 

INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (1, N'Rent')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (4, N'Rented')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (2, N'Sale')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (5, N'Saled')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (3, N'Wait')
SET IDENTITY_INSERT [dbo].[estate_status] OFF
INSERT [dbo].[estate_type] ([id], [type_name]) VALUES (N'1', N'Can h?')
INSERT [dbo].[estate_type] ([id], [type_name]) VALUES (N'2', N'House')
INSERT [dbo].[estate_type] ([id], [type_name]) VALUES (N'3', N'Privates')
SET IDENTITY_INSERT [dbo].[feature_details] ON 

INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (76, N'1', N'1')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (77, N'1', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (78, N'1', N'3')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (79, N'1', N'4')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (80, N'1', N'5')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (81, N'19', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (82, N'19', N'3')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (83, N'19', N'4')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (84, N'20', N'1')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (85, N'20', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (86, N'21', N'1')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (87, N'24', N'1')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (89, N'25', N'1')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (90, N'28', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (91, N'28', N'3')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (92, N'22', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (93, N'22', N'3')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (94, N'29', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (95, N'29', N'3')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (96, N'30', N'2')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (97, N'30', N'3')
SET IDENTITY_INSERT [dbo].[feature_details] OFF
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'1', N'Pool')
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'2', N'Kitchen')
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'3', N'Wireless Internet')
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'4', N'Heating')
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'5', N'Gym')
SET IDENTITY_INSERT [dbo].[fee] ON 

INSERT [dbo].[fee] ([id], [fee_employee], [fee_estate]) VALUES (1, 2, 4)
SET IDENTITY_INSERT [dbo].[fee] OFF
SET IDENTITY_INSERT [dbo].[manager] ON 

INSERT [dbo].[manager] ([manager_id], [manager_name], [manager_address], [manager_indentity_card], [manager_phone], [manager_mail], [manager_img], [manager_content], [user_id]) VALUES (2, N'manager', N'128 CMTT 10 Dist ,Ho Chi Minh City', N'025322779', N'01658451632', N'manager@gmail.com', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/backgroundAreas.png', N'Password hint. A reminder to you of how you made up your password. Some systems let you enter a password hint so that if you forget your password, the hint will be displayed to help jog your memory. For example, if your password is your child''s birthday, you might use "Alfred" or "Nicole" as a reminder.', 19)
SET IDENTITY_INSERT [dbo].[manager] OFF
SET IDENTITY_INSERT [dbo].[payment_frequency] ON 

INSERT [dbo].[payment_frequency] ([id], [payment_frequency_name]) VALUES (1, N'once')
SET IDENTITY_INSERT [dbo].[payment_frequency] OFF
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [post_tilte], [post_date], [post_content], [post_image], [post_category], [employee]) VALUES (4, N'You’ve been approved for a rental home. Now what?', CAST(0x0000AA1B00000000 AS DateTime), N'<p><strong>While Eichler homes are usually associated with the Mid-Century Modern heyday of the 1950s and 1960s, the legendary developer built homes well into the early &rsquo;70s. Built in 1972, this Palo Alto, CA, stunner has hit the market at $2,699,000 and is a prime example of the Mid-Century aesthetic extending into the initial years of the Me Decade.</strong></p>

<p>The four-bedroom, two-bathroom home offers 1,978 square feet of living space and a spacious backyard designed for entertaining.</p>

<p>Listing agent Tim Foy said this home is from &ldquo;One of Eichler&rsquo;s last tracts. It may be the very last tract in Palo Alto.&rdquo;</p>

<p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home&rsquo;s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>

<blockquote>&ldquo;When you walk in the front door, all the redwood creates a warmth,&rdquo; said Foy. &ldquo;It feels really homey. It&rsquo;s truly an &lsquo;aha!&rsquo; moment for a lot of people. Of course, the home appeals to Eichler lovers&mdash;but it also appeals to people who weren&rsquo;t prepared to like an Eichler.&rdquo;</blockquote>

<p>&nbsp;</p>

<p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow. Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made. The home&rsquo;s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he&rsquo;s also seen renewed interest in Palo Alto Eichlers:</p>

<ul>
	<li>Listing/content source</li>
	<li>Realtor.com real estate market reports</li>
	<li>Median age of inventory</li>
</ul>

<p><em>&ldquo;High-tech professionals love these homes,&rdquo; he noted. &ldquo;We&rsquo;ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.heightened in the last couple of years.&rdquo;</em></p>

<p>Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made.</p>

<h3>Active Listings Inventory</h3>

<p>The home&rsquo;s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he&rsquo;s also seen renewed interest in Palo Alto Eichlers.</p>

<p>&ldquo;High-tech professionals love these homes,&rdquo; he noted. &ldquo;We&rsquo;ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.&rdquo; Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>

<p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home&rsquo;s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>

<p>&ldquo;When you walk in the front door, all the redwood creates a warmth,&rdquo; said Foy. &ldquo;It feels really homey. It&rsquo;s truly an &lsquo;aha!&rsquo; moment for a lot of people. Of course, the home appeals to Eichler lovers&mdash;but it also appeals to people who weren&rsquo;t prepared to like an Eichler.&rdquo;</p>

<p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>

<p>Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made.</p>
', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', 1, 7)
INSERT [dbo].[post] ([post_id], [post_tilte], [post_date], [post_content], [post_image], [post_category], [employee]) VALUES (5, N'You’ve been approved for a rental home. Now what?', CAST(0x0000AA1B00000000 AS DateTime), N'<p><strong>While Eichler homes are usually associated with the Mid-Century Modern heyday of the 1950s and 1960s, the legendary developer built homes well into the early &rsquo;70s. Built in 1972, this Palo Alto, CA, stunner has hit the market at $2,699,000 and is a prime example of the Mid-Century aesthetic extending into the initial years of the Me Decade.</strong></p>

<p>The four-bedroom, two-bathroom home offers 1,978 square feet of living space and a spacious backyard designed for entertaining.</p>

<p>Listing agent Tim Foy said this home is from &ldquo;One of Eichler&rsquo;s last tracts. It may be the very last tract in Palo Alto.&rdquo;</p>

<p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home&rsquo;s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>

<blockquote>&ldquo;When you walk in the front door, all the redwood creates a warmth,&rdquo; said Foy. &ldquo;It feels really homey. It&rsquo;s truly an &lsquo;aha!&rsquo; moment for a lot of people. Of course, the home appeals to Eichler lovers&mdash;but it also appeals to people who weren&rsquo;t prepared to like an Eichler.&rdquo;</blockquote>

<p>&nbsp;</p>

<p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow. Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made. The home&rsquo;s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he&rsquo;s also seen renewed interest in Palo Alto Eichlers:</p>

<ul>
	<li>Listing/content source</li>
	<li>Realtor.com real estate market reports</li>
	<li>Median age of inventory</li>
</ul>

<p><em>&ldquo;High-tech professionals love these homes,&rdquo; he noted. &ldquo;We&rsquo;ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.heightened in the last couple of years.&rdquo;</em></p>

<p>Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made.</p>

<h3>Active Listings Inventory</h3>

<p>The home&rsquo;s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he&rsquo;s also seen renewed interest in Palo Alto Eichlers.</p>

<p>&ldquo;High-tech professionals love these homes,&rdquo; he noted. &ldquo;We&rsquo;ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.&rdquo; Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>

<p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home&rsquo;s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>

<p>&ldquo;When you walk in the front door, all the redwood creates a warmth,&rdquo; said Foy. &ldquo;It feels really homey. It&rsquo;s truly an &lsquo;aha!&rsquo; moment for a lot of people. Of course, the home appeals to Eichler lovers&mdash;but it also appeals to people who weren&rsquo;t prepared to like an Eichler.&rdquo;</p>

<p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>

<p>Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made.</p>
', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', 3, 7)
INSERT [dbo].[post] ([post_id], [post_tilte], [post_date], [post_content], [post_image], [post_category], [employee]) VALUES (6, N'You’ve been approved for a rental home. Now what?', CAST(0x0000AA1B00000000 AS DateTime), N'<p><strong>While Eichler homes are usually associated with the Mid-Century Modern heyday of the 1950s and 1960s, the legendary developer built homes well into the early &rsquo;70s. Built in 1972, this Palo Alto, CA, stunner has hit the market at $2,699,000 and is a prime example of the Mid-Century aesthetic extending into the initial years of the Me Decade.</strong></p>

<p>The four-bedroom, two-bathroom home offers 1,978 square feet of living space and a spacious backyard designed for entertaining.</p>

<p>Listing agent Tim Foy said this home is from &ldquo;One of Eichler&rsquo;s last tracts. It may be the very last tract in Palo Alto.&rdquo;</p>

<p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home&rsquo;s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>

<blockquote>&ldquo;When you walk in the front door, all the redwood creates a warmth,&rdquo; said Foy. &ldquo;It feels really homey. It&rsquo;s truly an &lsquo;aha!&rsquo; moment for a lot of people. Of course, the home appeals to Eichler lovers&mdash;but it also appeals to people who weren&rsquo;t prepared to like an Eichler.&rdquo;</blockquote>

<p>&nbsp;</p>

<p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow. Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made. The home&rsquo;s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he&rsquo;s also seen renewed interest in Palo Alto Eichlers:</p>

<ul>
	<li>Listing/content source</li>
	<li>Realtor.com real estate market reports</li>
	<li>Median age of inventory</li>
</ul>

<p><em>&ldquo;High-tech professionals love these homes,&rdquo; he noted. &ldquo;We&rsquo;ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.heightened in the last couple of years.&rdquo;</em></p>

<p>Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made.</p>

<h3>Active Listings Inventory</h3>

<p>The home&rsquo;s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he&rsquo;s also seen renewed interest in Palo Alto Eichlers.</p>

<p>&ldquo;High-tech professionals love these homes,&rdquo; he noted. &ldquo;We&rsquo;ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.&rdquo; Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>

<p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home&rsquo;s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>

<p>&ldquo;When you walk in the front door, all the redwood creates a warmth,&rdquo; said Foy. &ldquo;It feels really homey. It&rsquo;s truly an &lsquo;aha!&rsquo; moment for a lot of people. Of course, the home appeals to Eichler lovers&mdash;but it also appeals to people who weren&rsquo;t prepared to like an Eichler.&rdquo;</p>

<p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>

<p>Extensively remodeled inside and out over the past couple of years, the home&rsquo;s current owners thoughtfully and faithfully documented all of the updates they&rsquo;ve made.</p>
', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', 1, 7)
SET IDENTITY_INSERT [dbo].[post] OFF
INSERT [dbo].[project] ([project_id], [project_name], [project_address], [project_status], [block_number], [floor_number], [manager_id], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [status], [document_url], [date_add], [district], [year_build], [project_content]) VALUES (N'1', N'The New City Thu Thiem', N'25 Thu Thiem, Phuong An Binh', N'publish', 1, 5, 2, N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/47.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'publish', NULL, CAST(0x763F0B00 AS Date), N'2', CAST(0x2B3F0B00 AS Date), N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.')
INSERT [dbo].[project] ([project_id], [project_name], [project_address], [project_status], [block_number], [floor_number], [manager_id], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [status], [document_url], [date_add], [district], [year_build], [project_content]) VALUES (N'2', N'ádasdasd', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'publish', 1, 5, 2, N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/10.jpg', N'publish', NULL, CAST(0x8C3F0B00 AS Date), N'Binh Thanh', CAST(0x323F0B00 AS Date), N'123')
INSERT [dbo].[project] ([project_id], [project_name], [project_address], [project_status], [block_number], [floor_number], [manager_id], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [status], [document_url], [date_add], [district], [year_build], [project_content]) VALUES (N'3', N'Textasdsadsad', N'17/5 Bình Lợi, Phường 13, Quận Bình Thạnh', N'waitting for director create', 3, 4, 2, N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/07.jpg', N'', N'', N'', N'', N'waitting for director create', NULL, CAST(0x8C3F0B00 AS Date), N'2', CAST(0x243F0B00 AS Date), N'dsfs')
SET IDENTITY_INSERT [dbo].[project_details] ON 

INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (179, N'BAF1R1', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (180, N'BAF1R2', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (181, N'BAF1R3', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (182, N'BAF1R4', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (183, N'BAF1R5', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (184, N'BAF1R6', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (185, N'BAF1R7', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (186, N'BAF1R8', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (187, N'BAF1R9', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (188, N'BAF1R10', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (189, N'BAF2R1', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (190, N'BAF2R2', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (191, N'BAF2R3', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (192, N'BAF2R4', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (193, N'BAF2R5', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (194, N'BAF2R6', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (195, N'BAF2R7', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (196, N'BAF2R8', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (197, N'BAF2R9', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (198, N'BAF2R10', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (199, N'BAF3R1', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (200, N'BAF3R2', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (201, N'BAF3R3', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (202, N'BAF3R4', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (203, N'BAF3R5', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (204, N'BAF3R6', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (205, N'BAF3R7', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (206, N'BAF3R8', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (207, N'BAF3R9', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (208, N'BAF3R10', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (209, N'BAF4R1', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (210, N'BAF4R2', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (211, N'BAF4R3', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (212, N'BAF4R4', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (213, N'BAF4R5', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (214, N'BAF4R6', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (215, N'BAF4R7', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (216, N'BAF4R8', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (217, N'BAF4R9', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (218, N'BAF4R10', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (219, N'BAF5R1', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (220, N'BAF5R2', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (221, N'BAF5R3', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (222, N'BAF5R4', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (223, N'BAF5R5', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (224, N'BAF5R6', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (225, N'BAF5R7', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (226, N'BAF5R8', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (227, N'BAF5R9', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (228, N'BAF5R10', N'1')
SET IDENTITY_INSERT [dbo].[project_details] OFF
SET IDENTITY_INSERT [dbo].[schedule] ON 

INSERT [dbo].[schedule] ([id], [customer_id], [employee_id], [estate_id], [contact_time], [contact_context], [status]) VALUES (1, 11, 7, N'22', CAST(0x0000A9D000000000 AS DateTime), N'ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad ádsadasdsadsad', N'unread buy')
SET IDENTITY_INSERT [dbo].[schedule] OFF
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (1, 11, CAST(0x783F0B00 AS Date), 5, 320, N'request sale')
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (2, 11, CAST(0x783F0B00 AS Date), 8, 320, N'request sale')
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (4, 11, CAST(0x913F0B00 AS Date), 27, 100000, NULL)
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (5, 11, CAST(0x923F0B00 AS Date), 11, 320, N'request sale')
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (6, 11, CAST(0x923F0B00 AS Date), 30, 32, N'request sale')
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (7, 11, CAST(0x923F0B00 AS Date), 31, 20000, NULL)
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (8, 11, CAST(0x923F0B00 AS Date), 32, 32, N'request sale')
INSERT [dbo].[transactions] ([id], [customer_offered], [transactions_date], [contract_id], [money], [transactions_note]) VALUES (9, 11, CAST(0x923F0B00 AS Date), 33, 20000, NULL)
SET IDENTITY_INSERT [dbo].[transactions] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (3, N'director', N'director', 1, N'director')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (18, N'employee', N'123456', 1, N'employee')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (19, N'manager', N'123456', 1, N'manager')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (20, N'customer', N'123456', 1, N'customer')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (21, N'tuanvumustache', N'muathu123', 1, N'customer')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (22, N'hoangtuananh', N'realestate24h', 1, N'employee')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (23, N'quoctrung', N'123456', 1, N'employee')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_assign_details]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[assign_details] ADD  CONSTRAINT [IX_assign_details] UNIQUE NONCLUSTERED 
(
	[estate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_contract_details]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[contract_details] ADD  CONSTRAINT [IX_contract_details] UNIQUE NONCLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [contract_type_ak_1]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[contract_type] ADD  CONSTRAINT [contract_type_ak_1] UNIQUE NONCLUSTERED 
(
	[contract_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_customer]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [IX_customer] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_employee]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [IX_employee] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [estate_status_ak_1]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[estate_status] ADD  CONSTRAINT [estate_status_ak_1] UNIQUE NONCLUSTERED 
(
	[estate_status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [estate_type_ak_1]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[estate_type] ADD  CONSTRAINT [estate_type_ak_1] UNIQUE NONCLUSTERED 
(
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_manager]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[manager] ADD  CONSTRAINT [IX_manager] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_project_details]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[project_details] ADD  CONSTRAINT [IX_project_details] UNIQUE NONCLUSTERED 
(
	[estate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_transactions]    Script Date: 4/24/2019 7:04:06 PM ******/
ALTER TABLE [dbo].[transactions] ADD  CONSTRAINT [IX_transactions] UNIQUE NONCLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assign_details]  WITH CHECK ADD  CONSTRAINT [FK_assign_details_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[assign_details] CHECK CONSTRAINT [FK_assign_details_employee]
GO
ALTER TABLE [dbo].[assign_details]  WITH CHECK ADD  CONSTRAINT [FK_assign_details_estate1] FOREIGN KEY([estate_id])
REFERENCES [dbo].[estate] ([id])
GO
ALTER TABLE [dbo].[assign_details] CHECK CONSTRAINT [FK_assign_details_estate1]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [contract_client] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [contract_client]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [contract_contract_type] FOREIGN KEY([contract_type_id])
REFERENCES [dbo].[contract_type] ([id])
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [contract_contract_type]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [FK_contract_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [FK_contract_employee]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [FK_contract_payment_frequency] FOREIGN KEY([payment_frequency])
REFERENCES [dbo].[payment_frequency] ([id])
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [FK_contract_payment_frequency]
GO
ALTER TABLE [dbo].[contract_details]  WITH CHECK ADD  CONSTRAINT [FK_contract_details_contract] FOREIGN KEY([contract_id])
REFERENCES [dbo].[contract] ([id])
GO
ALTER TABLE [dbo].[contract_details] CHECK CONSTRAINT [FK_contract_details_contract]
GO
ALTER TABLE [dbo].[contract_details]  WITH CHECK ADD  CONSTRAINT [FK_contract_details_estate] FOREIGN KEY([estate_id])
REFERENCES [dbo].[estate] ([id])
GO
ALTER TABLE [dbo].[contract_details] CHECK CONSTRAINT [FK_contract_details_estate]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_users]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_users]
GO
ALTER TABLE [dbo].[estate]  WITH CHECK ADD  CONSTRAINT [estate_estate_status] FOREIGN KEY([estate_status_id])
REFERENCES [dbo].[estate_status] ([id])
GO
ALTER TABLE [dbo].[estate] CHECK CONSTRAINT [estate_estate_status]
GO
ALTER TABLE [dbo].[estate]  WITH CHECK ADD  CONSTRAINT [estate_estate_type] FOREIGN KEY([estate_type_id])
REFERENCES [dbo].[estate_type] ([id])
GO
ALTER TABLE [dbo].[estate] CHECK CONSTRAINT [estate_estate_type]
GO
ALTER TABLE [dbo].[feature_details]  WITH CHECK ADD  CONSTRAINT [FK_feature_details_estate] FOREIGN KEY([estate_id])
REFERENCES [dbo].[estate] ([id])
GO
ALTER TABLE [dbo].[feature_details] CHECK CONSTRAINT [FK_feature_details_estate]
GO
ALTER TABLE [dbo].[feature_details]  WITH CHECK ADD  CONSTRAINT [FK_feature_details_features] FOREIGN KEY([feature_id])
REFERENCES [dbo].[features] ([features_id])
GO
ALTER TABLE [dbo].[feature_details] CHECK CONSTRAINT [FK_feature_details_features]
GO
ALTER TABLE [dbo].[manager]  WITH CHECK ADD  CONSTRAINT [FK_manager_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[manager] CHECK CONSTRAINT [FK_manager_users]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_category] FOREIGN KEY([post_category])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_category]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_employee] FOREIGN KEY([employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_employee]
GO
ALTER TABLE [dbo].[project]  WITH CHECK ADD  CONSTRAINT [FK_project_Manager1] FOREIGN KEY([manager_id])
REFERENCES [dbo].[manager] ([manager_id])
GO
ALTER TABLE [dbo].[project] CHECK CONSTRAINT [FK_project_Manager1]
GO
ALTER TABLE [dbo].[project_details]  WITH CHECK ADD  CONSTRAINT [FK_project_details_estate] FOREIGN KEY([estate_id])
REFERENCES [dbo].[estate] ([id])
GO
ALTER TABLE [dbo].[project_details] CHECK CONSTRAINT [FK_project_details_estate]
GO
ALTER TABLE [dbo].[project_details]  WITH CHECK ADD  CONSTRAINT [FK_project_details_project1] FOREIGN KEY([prject_id])
REFERENCES [dbo].[project] ([project_id])
GO
ALTER TABLE [dbo].[project_details] CHECK CONSTRAINT [FK_project_details_project1]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [contact_client] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [contact_client]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [contact_estate] FOREIGN KEY([estate_id])
REFERENCES [dbo].[estate] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [contact_estate]
GO
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_employee]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_contract1] FOREIGN KEY([contract_id])
REFERENCES [dbo].[contract] ([id])
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_contract1]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [transactions_client1] FOREIGN KEY([customer_offered])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [transactions_client1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "estate"
            Begin Extent = 
               Top = 6
               Left = 505
               Bottom = 136
               Right = 689
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "employee"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "assign_details"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 40
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_employee_assign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2730
         Alias = 900
         Table = 1665
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_employee_assign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_employee_assign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "estate"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "features"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 102
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "feature_details"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 119
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_estate_feature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_estate_feature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "estate"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "estate_type"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 102
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_estate_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_estate_type'
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
