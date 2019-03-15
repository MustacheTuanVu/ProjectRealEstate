USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 3/15/2019 5:37:22 PM ******/
CREATE DATABASE [RealEstate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RealEstate.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RealEstate_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [RealEstate] SET AUTO_CLOSE OFF 
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
/****** Object:  Table [dbo].[assign_details]    Script Date: 3/15/2019 5:37:22 PM ******/
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
/****** Object:  Table [dbo].[category]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[contract]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[contract_details]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[contract_type]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 3/15/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name] [nvarchar](255) NOT NULL,
	[employee_address] [nvarchar](255) NOT NULL,
	[employee_indentity_card] [varchar](50) NOT NULL,
	[employee_phone] [varchar](50) NOT NULL,
	[employee_mail] [varchar](50) NOT NULL,
	[employee_img] [varchar](255) NOT NULL,
	[employee_content] [varchar](max) NOT NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estate]    Script Date: 3/15/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estate](
	[id] [varchar](50) NOT NULL,
	[estate_name] [nvarchar](255) NOT NULL,
	[estate_type_id] [varchar](50) NOT NULL,
	[estate_description] [ntext] NOT NULL,
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
	[estate_status_id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[estate_status]    Script Date: 3/15/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estate_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estate_status_name] [varchar](50) NOT NULL,
 CONSTRAINT [estate_status_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estate_type]    Script Date: 3/15/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estate_type](
	[id] [varchar](50) NOT NULL,
	[type_name] [varchar](100) NOT NULL,
 CONSTRAINT [estate_type_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feature_details]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[features]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[fee]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[manager]    Script Date: 3/15/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[manager](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[manager_name] [nvarchar](255) NOT NULL,
	[manager_address] [nvarchar](255) NOT NULL,
	[manager_indentity_card] [varchar](50) NOT NULL,
	[manager_phone] [varchar](50) NOT NULL,
	[manager_mail] [varchar](50) NOT NULL,
	[manager_img] [varchar](255) NOT NULL,
	[manager_content] [ntext] NOT NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Manager_1] PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payment_frequency]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 3/15/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_tilte] [nvarchar](50) NOT NULL,
	[post_date] [datetime] NOT NULL,
	[post_content] [varchar](max) NOT NULL,
	[post_image] [varchar](255) NOT NULL,
	[post_category] [int] NOT NULL,
	[employee] [int] NOT NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project]    Script Date: 3/15/2019 5:37:23 PM ******/
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
 CONSTRAINT [PK_project_1] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_details]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[schedule]    Script Date: 3/15/2019 5:37:23 PM ******/
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
 CONSTRAINT [contact_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 3/15/2019 5:37:23 PM ******/
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
/****** Object:  View [dbo].[view_employee_assign]    Script Date: 3/15/2019 5:37:23 PM ******/
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
SET IDENTITY_INSERT [dbo].[assign_details] ON 

INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (5, N'2', 3, CAST(0x233F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (7, N'1', 3, CAST(0x433F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (9, N'5', 3, CAST(0x7C400B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (10, N'6', 3, CAST(0x7C400B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (11, N'9', 3, CAST(0x433F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (12, N'10', 3, CAST(0x433F0B00 AS Date))
INSERT [dbo].[assign_details] ([id], [estate_id], [employee_id], [date_to]) VALUES (13, N'11', 3, CAST(0x433F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[assign_details] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Villa for sale')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[contract] ON 

INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (6, 2, 3, 2, N'none', 1, 100000, 10, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (8, 2, 3, 2, N'none', 1, 100000, 10, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (9, 2, 3, 2, N'none', 1, 100000, 10, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (10, 2, 3, 2, N'none', 1, 100000, 10, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (11, 2, NULL, 1002, N'none', 1, 20000, 10, NULL, N'wait', N'waitting for employee')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (12, 2, 3, 2, N'none', 1, 50000, 10, NULL, N'wait', N'waitting to transaction')
INSERT [dbo].[contract] ([id], [customer_id], [employee_id], [contract_type_id], [contract_details], [payment_frequency], [payment_amount], [fee_precentage], [date_signed], [document_url], [status]) VALUES (13, 2, 3, 2, N'none', 1, 20000, 10, NULL, N'wait', N'waitting to transaction')
SET IDENTITY_INSERT [dbo].[contract] OFF
SET IDENTITY_INSERT [dbo].[contract_details] ON 

INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (5, N'6', 6)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (6, N'6', 8)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (7, N'6', 9)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (8, N'6', 10)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (9, N'8', 11)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (10, N'9', 12)
INSERT [dbo].[contract_details] ([id], [estate_id], [contract_id]) VALUES (11, N'10', 13)
SET IDENTITY_INSERT [dbo].[contract_details] OFF
SET IDENTITY_INSERT [dbo].[contract_type] ON 

INSERT [dbo].[contract_type] ([id], [contract_type_name]) VALUES (2, N'buy')
INSERT [dbo].[contract_type] ([id], [contract_type_name]) VALUES (1002, N'sale')
SET IDENTITY_INSERT [dbo].[contract_type] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [customer_name], [customer_address], [customer_indentity_card], [phone], [mail], [customer_img], [customer_content], [user_id]) VALUES (2, N'Kha Banh', N'Ho Chi Minh', N'12345676768', N'12345676768', N'khabanh@gmail.com', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/workers/worker-1.jpg', N'Kha Banh Rat Dep Gai', 2)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [employee_name], [employee_address], [employee_indentity_card], [employee_phone], [employee_mail], [employee_img], [employee_content], [user_id]) VALUES (3, N'Le Tuan Vu', N'Ho Chi Minh', N'12345353464', N'12345353464', N'vu@gmail.com', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/workers/worker-2.jpg', N'Vu rat dep trao', 1)
SET IDENTITY_INSERT [dbo].[employee] OFF
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'1', N'401 South Sycamore Street', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', 3, 2, 6, 100000, 25, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'West', N'none', N'401 South Sycamore Street', N'Santa Ana, CA 92701, USA', N'1', CAST(0x243F0B00 AS Date), 2, N'publish', CAST(0x243F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'10', N'Can 2', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 3, 3, 0, 20000, 9, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'none', N'2', N'1600 Pennsylvania1 Ave NW', N'Washington DC20500, Collingswood, USA 21050', N'1', CAST(0x233F0B00 AS Date), 2, N'waitting to transaction', CAST(0x433F0B00 AS Date), N'3')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'11', N'Can 3', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 2, 2, 0, 50000, 10, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'none', N'1', N'qwe', N'Washington DC20500, Collingswood, USA 21050', N'1', CAST(0x233F0B00 AS Date), 5, N'project', CAST(0x433F0B00 AS Date), N'2')
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'12', N'Text', N'2', N'123', 12, 21, 21, 123, 123, N'123', N'', N'', N'', N'', N'', N'West', N'none', N'123', N'123', NULL, CAST(0x2C3F0B00 AS Date), 5, N'waitting for director', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'13', N'Text234', N'2', N'32454', 234, 234, 234, 234, 234, N'32454', N'', N'', N'', N'', N'', N'West', N'none', N'234', N'234', NULL, CAST(0x243F0B00 AS Date), 4, N'waitting for director', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'14', N'Textsdfsdfdsf', N'2', N'23456', 342, 23, 23, 23, 23, N'23456', N'', N'', N'', N'', N'', N'West', N'none', N'23434556', N'324554657', NULL, CAST(0x333F0B00 AS Date), 4, N'waitting for director', CAST(0x6B3F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'15', N'Textđwedd', N'2', N'234', 123, 3124, 2345435, 345, 345, N'234', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'West', N'none', N'43344', N'234', NULL, CAST(0x313F0B00 AS Date), 2, N'waitting for director', CAST(0x6B3F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'16', N'Text69696969', N'2', N'123123213', 12, 12, 21, 12, 12, N'123123213', N'', N'', N'', N'', N'', N'West', N'none', N'123123213', N'1231321', NULL, CAST(0x233F0B00 AS Date), 4, N'waitting for director', CAST(0x6B3F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'17', N'TextÁD', N'2', N'123', 213, 123, 123, 123, 123, N'123', N'', N'', N'', N'', N'', N'West', N'none', N'12121232124', N'123123123454', NULL, CAST(0x253F0B00 AS Date), 5, N'waitting for director', CAST(0x6B3F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'18', N'edit test', N'1', N'1', 1, 1, 1, 1, 1, N'1', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'East', N'none', N'567', N'567', N'12', CAST(0x233F0B00 AS Date), 1, N'waitting for director', CAST(0x6B3F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'2', N'649 West Adams Boulevard', N'3', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 1, 2, 12, 200000, 56, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'East', N'none', N'649 West Adams B1oulevard', N'Los Angeles, CA 90007, USA', N'2', CAST(0x233F0B00 AS Date), 1, N'publish', CAST(0x253F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'3', N'958 Dewey Avenue', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 1, 1, 3, 100000, 45, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'West', N'none', N'958 Dewey Avenue', N'Los Angeles, CA 90006, USA', N'3', CAST(0x233F0B00 AS Date), 5, N'waitting for director', CAST(0x263F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'4', N'1026 Ohio Avenue', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 3, 1, 23, 500000, 56, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'South', N'none', N'1026 Ohio Avenue', N'Long Beach, CA 90804, USA', N'4', CAST(0x233F0B00 AS Date), 4, N'waitting for director', CAST(0x273F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'5', N'1230 Martin Luther King', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 3, 2, 23, 400000, 100, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/5.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/5.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/5.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/5.jpg', N'South', N'none', N'1230 Martin Luther King', N'Long Beach, CA 90804, USA', N'5', CAST(0x263F0B00 AS Date), 1, N'publish', CAST(0x283F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'6', N'514 East Myrtle Street', N'3', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 1, 1, 3, 100000, 10, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'West', N'none', N'514 East Myrtle Street', N'Santa Ana, CA 92701, USA', N'6', CAST(0x233F0B00 AS Date), 2, N'waitting to transaction', CAST(0x293F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'7', N'Nha Test', N'2', N'3e32rfregtrhrgrtdg', 12, 12, 12, 50000, 12, N'3e32rfregtrhrgrtdg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/02.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/03.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/04.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/05.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/06.jpg', N'West', N'none', N'address21', N'addredsf12', N'7', CAST(0x2B3F0B00 AS Date), 4, N'waitting for director', CAST(0x2A3F0B00 AS Date), NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'8', N'1600 Pennsylvania Ave NW', N'2', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping

This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life

The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.

The bedroom has a queen-sized bed that sleeps 2 and a large desk, a 32 inch flatscreen cable/tv, with 3 large windows overlooking the posh area we call the meatpacking district.

The bathroom has a shower/tub (perfect for soaking) with sliding glass doors. (towels and bedding provided) Living room has a new huge leather sectional couch that comfortably holds 5 for movies/meals or just hanging.There is a brand new 42" flat screen TV mounted on the wall. with playstation 3, dvd, and free cable TV w DVR. this apartment also has a dj booth for anyone that is experienced. or an iPod dock for ppl that just want to play music that way The kitchen is very large with black marble counter tops,and bar to eat and hang out. It has all the appliances you''ll need including trash compactor, dishwasher, stove/over, toaster, blender and enough space for a chef and several helpers. Air conditioning. And yes, the apartment does have free wireless Internet access.', NULL, NULL, NULL, 20000, NULL, NULL, N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/830x540/01.jpg', NULL, NULL, N'assda', N'Washington DC20500, Collingswood, USA 21050', NULL, NULL, 1, N'waitting for employee', NULL, NULL)
INSERT [dbo].[estate] ([id], [estate_name], [estate_type_id], [estate_description], [bed_room], [bath_room], [garages], [price], [areas], [estate_content], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [direction], [block], [address1], [address2], [district], [year_build], [estate_status_id], [estate_status], [date_add], [floor]) VALUES (N'9', N'Can 1', N'1', N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', 2, 2, 0, 50000, 10, N'Center of the Meatpacking district. Spacious room with queen Sized bed, Large desk and lots of windows and light. In a large apt with huge private outdoor patio! (Very rare in the city) washer dryer/ Gourmet kitchen. Close to the city''s best night clubs, restaurants and shopping This is a spacious private room for rent in my Large 2 bedroom apt with large outdoor patio suitable for eating in the heart of the Meat-Packing District. right across the street from the chelsea market and just steps away from the cites best shopping, restaurants, and night-life The apartment is newly renovated with brand new furniture and appliances. It''s a clean and cozy oasis in the coolest neighborhood in nyc. The private outdoor patio is huge and has a covered eating area, a gas Webber BBQ , 2 lounge chairs for sunbathing and plenty of space to just hang out.', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'http://localhost:8080/ProjectRealEstate/CKFinderJava/userfiles/files/home.jpg', N'none', N'1', N'asdsadeqwe', N'Washington DC20500, Collingswood, USA 21050', N'1', CAST(0x233F0B00 AS Date), 2, N'waitting to transaction', CAST(0x433F0B00 AS Date), N'2')
SET IDENTITY_INSERT [dbo].[estate_status] ON 

INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (1, N'Rent')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (4, N'Rented')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (2, N'Sale')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (5, N'Saled')
INSERT [dbo].[estate_status] ([id], [estate_status_name]) VALUES (3, N'Wait')
SET IDENTITY_INSERT [dbo].[estate_status] OFF
INSERT [dbo].[estate_type] ([id], [type_name]) VALUES (N'1', N'Apartment')
INSERT [dbo].[estate_type] ([id], [type_name]) VALUES (N'2', N'House')
INSERT [dbo].[estate_type] ([id], [type_name]) VALUES (N'3', N'Privates')
SET IDENTITY_INSERT [dbo].[feature_details] ON 

INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (7, N'18', N'1')
INSERT [dbo].[feature_details] ([feature_details_id], [estate_id], [feature_id]) VALUES (8, N'18', N'BB')
SET IDENTITY_INSERT [dbo].[feature_details] OFF
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'1', N'sdfsdf')
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'BB', N'Be Boi')
INSERT [dbo].[features] ([features_id], [feature_name]) VALUES (N'ML', N'May lanh')
SET IDENTITY_INSERT [dbo].[fee] ON 

INSERT [dbo].[fee] ([id], [fee_employee], [fee_estate]) VALUES (1, 5, 10)
SET IDENTITY_INSERT [dbo].[fee] OFF
SET IDENTITY_INSERT [dbo].[manager] ON 

INSERT [dbo].[manager] ([manager_id], [manager_name], [manager_address], [manager_indentity_card], [manager_phone], [manager_mail], [manager_img], [manager_content], [user_id]) VALUES (1, N'Lord Bender', N'Dan Mach', N'14354667577', N'23436546574', N'Lord@gmail.com', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/workers/worker-4.jpg', N'a no', 4)
SET IDENTITY_INSERT [dbo].[manager] OFF
SET IDENTITY_INSERT [dbo].[payment_frequency] ON 

INSERT [dbo].[payment_frequency] ([id], [payment_frequency_name]) VALUES (1, N'once')
SET IDENTITY_INSERT [dbo].[payment_frequency] OFF
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [post_tilte], [post_date], [post_content], [post_image], [post_category], [employee]) VALUES (1, N'You’ve been approved for a rental home. Now what?', CAST(0x0000A9E800000000 AS DateTime), N'<p><strong>While Eichler homes are usually associated with the Mid-Century Modern heyday of the 1950s and 1960s, the legendary developer built homes well into the early ’70s. Built in 1972, this Palo Alto, CA, stunner has hit the market at $2,699,000 and is a prime example of the Mid-Century aesthetic extending into the initial years of the Me Decade.</strong></p>
                          <p>The four-bedroom, two-bathroom home offers 1,978 square feet of living space and a spacious backyard designed for entertaining.</p>
                          <p>Listing agent Tim Foy said this home is from “One of Eichler’s last tracts. It may be the very last tract in Palo Alto.”</p>
                          <p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home’s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>
                          <blockquote>“When you walk in the front door, all the redwood creates a warmth,” said Foy. “It feels really homey. It’s truly an ‘aha!’ moment for a lot of people. Of course, the home appeals to Eichler lovers—but it also appeals to people who weren’t prepared to like an Eichler.”</blockquote>
                          
                          <p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow. Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made. The home’s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he’s also seen renewed interest in Palo Alto Eichlers:</p>
                          <ul>
                            <li>Listing/content source</li>
                            <li>Realtor.com real estate market reports</li>
                            <li>Median age of inventory</li>
                          </ul>
                          <p><i>“High-tech professionals love these homes,” he noted. “We’ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.heightened in the last couple of years.”</i></p>
                          <p>Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made.</p>
                          <h3>Active Listings Inventory</h3>
                          
                          <p>“High-tech professionals love these homes,” he noted. “We’ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.” Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>
                          <p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home’s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>
                          <p>“When you walk in the front door, all the redwood creates a warmth,” said Foy. “It feels really homey. It’s truly an ‘aha!’ moment for a lot of people. Of course, the home appeals to Eichler lovers—but it also appeals to people who weren’t prepared to like an Eichler.”</p>
                          <p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>
                          <p>Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made.</p>', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/1740x960/06.jpg', 1, 3)
INSERT [dbo].[post] ([post_id], [post_tilte], [post_date], [post_content], [post_image], [post_category], [employee]) VALUES (2, N'You’ve been approved for a rental home. Now what?', CAST(0x0000A9E800000000 AS DateTime), N'<p><strong>While Eichler homes are usually associated with the Mid-Century Modern heyday of the 1950s and 1960s, the legendary developer built homes well into the early ’70s. Built in 1972, this Palo Alto, CA, stunner has hit the market at $2,699,000 and is a prime example of the Mid-Century aesthetic extending into the initial years of the Me Decade.</strong></p>
                          <p>The four-bedroom, two-bathroom home offers 1,978 square feet of living space and a spacious backyard designed for entertaining.</p>
                          <p>Listing agent Tim Foy said this home is from “One of Eichler’s last tracts. It may be the very last tract in Palo Alto.”</p>
                          <p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home’s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>
                          <blockquote>“When you walk in the front door, all the redwood creates a warmth,” said Foy. “It feels really homey. It’s truly an ‘aha!’ moment for a lot of people. Of course, the home appeals to Eichler lovers—but it also appeals to people who weren’t prepared to like an Eichler.”</blockquote>
                          
                          <p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow. Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made. The home’s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he’s also seen renewed interest in Palo Alto Eichlers:</p>
                          <ul>
                            <li>Listing/content source</li>
                            <li>Realtor.com real estate market reports</li>
                            <li>Median age of inventory</li>
                          </ul>
                          <p><i>“High-tech professionals love these homes,” he noted. “We’ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.heightened in the last couple of years.”</i></p>
                          <p>Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made.</p>
                          <h3>Active Listings Inventory</h3>
                          
                          <p>“High-tech professionals love these homes,” he noted. “We’ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.” Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>
                          <p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home’s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>
                          <p>“When you walk in the front door, all the redwood creates a warmth,” said Foy. “It feels really homey. It’s truly an ‘aha!’ moment for a lot of people. Of course, the home appeals to Eichler lovers—but it also appeals to people who weren’t prepared to like an Eichler.”</p>
                          <p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>
                          <p>Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made.</p>', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/1740x960/06.jpg', 1, 3)
INSERT [dbo].[post] ([post_id], [post_tilte], [post_date], [post_content], [post_image], [post_category], [employee]) VALUES (3, N'You’ve been approved for a rental home. Now what?', CAST(0x0000A9E800000000 AS DateTime), N'<p><strong>While Eichler homes are usually associated with the Mid-Century Modern heyday of the 1950s and 1960s, the legendary developer built homes well into the early ’70s. Built in 1972, this Palo Alto, CA, stunner has hit the market at $2,699,000 and is a prime example of the Mid-Century aesthetic extending into the initial years of the Me Decade.</strong></p>
                          <p>The four-bedroom, two-bathroom home offers 1,978 square feet of living space and a spacious backyard designed for entertaining.</p>
                          <p>Listing agent Tim Foy said this home is from “One of Eichler’s last tracts. It may be the very last tract in Palo Alto.”</p>
                          <p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home’s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>
                          <blockquote>“When you walk in the front door, all the redwood creates a warmth,” said Foy. “It feels really homey. It’s truly an ‘aha!’ moment for a lot of people. Of course, the home appeals to Eichler lovers—but it also appeals to people who weren’t prepared to like an Eichler.”</blockquote>
                          
                          <p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow. Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made. The home’s price tag reflects its Palo Alto address, and Foy told us the market at the epicenter of the Bay Area shows no signs of slowing. While the college city continues its red-hot pace, the agent told us he’s also seen renewed interest in Palo Alto Eichlers:</p>
                          <ul>
                            <li>Listing/content source</li>
                            <li>Realtor.com real estate market reports</li>
                            <li>Median age of inventory</li>
                          </ul>
                          <p><i>“High-tech professionals love these homes,” he noted. “We’ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.heightened in the last couple of years.”</i></p>
                          <p>Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made.</p>
                          <h3>Active Listings Inventory</h3>
                          
                          <p>“High-tech professionals love these homes,” he noted. “We’ve seen a resurgence in Eichler interest over the past five years, and the market for these homes has really heightened in the last couple of years.” Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>
                          <p>Foy told us the home was purchased over 40 years ago before hammer even hit nail, and the original buyers were able to specify customizations and upgrades not seen in many other Eichlers. One of their requests was to have the knot-free redwood paneled walls extend into the open-air atrium at the center of the home. The home’s stunning cathedral ceilings are beautiful redwood and give the home a warmth not usually associated with Eichlers.</p>
                          <p>“When you walk in the front door, all the redwood creates a warmth,” said Foy. “It feels really homey. It’s truly an ‘aha!’ moment for a lot of people. Of course, the home appeals to Eichler lovers—but it also appeals to people who weren’t prepared to like an Eichler.”</p>
                          <p>As with all Eichler homes, the integration of indoor space and outdoors is key. Floor-to-ceiling windows along the back of the house let in plenty of natural light and create a seamless flow.</p>
                          <p>Extensively remodeled inside and out over the past couple of years, the home’s current owners thoughtfully and faithfully documented all of the updates they’ve made.</p>', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/1740x960/06.jpg', 1, 3)
SET IDENTITY_INSERT [dbo].[post] OFF
INSERT [dbo].[project] ([project_id], [project_name], [project_address], [project_status], [block_number], [floor_number], [manager_id], [image_1st], [image_2st], [image_3st], [image_4st], [image_5st], [status], [document_url], [date_add], [district], [year_build]) VALUES (N'1', N'1600 Pennsylvania Ave NW', N'Washington DC20500, Collingswood, USA 21050', N'publish', 3, 10, 1, N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/277x180/04.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/277x180/04.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/277x180/04.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/277x180/04.jpg', N'http://localhost:8080/ProjectRealEstate/assets/media-demo/properties/277x180/04.jpg', N'publish', N'none', CAST(0x433F0B00 AS Date), N'1', CAST(0x433F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[project_details] ON 

INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (1, N'9', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (2, N'10', N'1')
INSERT [dbo].[project_details] ([project_detail_id], [estate_id], [prject_id]) VALUES (3, N'11', N'1')
SET IDENTITY_INSERT [dbo].[project_details] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (1, N'employee', N'employee', 1, N'employee')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (2, N'customer', N'customer', 1, N'customer')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (3, N'director', N'director', 1, N'director')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (4, N'manager', N'manager', 1, N'manager')
INSERT [dbo].[users] ([id], [username], [password], [status], [role]) VALUES (5, N'employee1', N'employee1', 1, N'employee')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_assign_details]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[assign_details] ADD  CONSTRAINT [IX_assign_details] UNIQUE NONCLUSTERED 
(
	[estate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_contract_details]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[contract_details] ADD  CONSTRAINT [IX_contract_details] UNIQUE NONCLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [contract_type_ak_1]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[contract_type] ADD  CONSTRAINT [contract_type_ak_1] UNIQUE NONCLUSTERED 
(
	[contract_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_customer]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [IX_customer] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_employee]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [IX_employee] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [estate_status_ak_1]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[estate_status] ADD  CONSTRAINT [estate_status_ak_1] UNIQUE NONCLUSTERED 
(
	[estate_status_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [estate_type_ak_1]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[estate_type] ADD  CONSTRAINT [estate_type_ak_1] UNIQUE NONCLUSTERED 
(
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_manager]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[manager] ADD  CONSTRAINT [IX_manager] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_project_details]    Script Date: 3/15/2019 5:37:24 PM ******/
ALTER TABLE [dbo].[project_details] ADD  CONSTRAINT [IX_project_details] UNIQUE NONCLUSTERED 
(
	[estate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_transactions]    Script Date: 3/15/2019 5:37:24 PM ******/
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
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
