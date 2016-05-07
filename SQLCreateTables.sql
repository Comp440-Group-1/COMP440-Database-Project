USE [master]
GO

/****** Object:  Database [s16guest17]    Script Date: 5/2/2016 2:35:10 AM ******/

CREATE DATABASE [s16guest17]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's16guest17', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest17.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N's16guest17_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest17_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [s16guest17] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s16guest17].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [s16guest17] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [s16guest17] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [s16guest17] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [s16guest17] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [s16guest17] SET ARITHABORT OFF 
GO

ALTER DATABASE [s16guest17] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [s16guest17] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [s16guest17] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [s16guest17] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [s16guest17] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [s16guest17] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [s16guest17] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [s16guest17] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [s16guest17] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [s16guest17] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [s16guest17] SET  ENABLE_BROKER 
GO

ALTER DATABASE [s16guest17] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [s16guest17] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [s16guest17] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [s16guest17] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [s16guest17] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [s16guest17] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [s16guest17] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [s16guest17] SET RECOVERY FULL 
GO

ALTER DATABASE [s16guest17] SET  MULTI_USER 
GO

ALTER DATABASE [s16guest17] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [s16guest17] SET DB_CHAINING OFF 
GO

ALTER DATABASE [s16guest17] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [s16guest17] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [s16guest17] SET  READ_WRITE 
GO


 USE [s16guest17]
GO

/****** Object:  Table [dbo].[Branch]    Script Date: 5/6/2016 5:47:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Branch](
	[Branch_ID] [int] NOT NULL,
	[Branch_Name] [varchar](50) NOT NULL,
	[Cust_Release_ID] [int] NULL,
	[Dev_Release_ID] [int] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Cust_Release] FOREIGN KEY([Cust_Release_ID])
REFERENCES [dbo].[Cust_Release] ([Cust_Release_ID])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Cust_Release]
GO

ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Dev_Release] FOREIGN KEY([Dev_Release_ID])
REFERENCES [dbo].[Dev_Release] ([Dev_Release_ID])
GO

ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Dev_Release]
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 5/6/2016 5:47:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Company](
	[Company_ID] [int] NOT NULL,
	[Company_Name] [varchar](50) NOT NULL,
	[Company_Address] [varchar](50) NULL,
	[Product_ID] [int] NULL,
	[Company_Phone] [varchar](10) NULL,
	[Company_Employee_ID] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Company_Employee] FOREIGN KEY([Company_Employee_ID])
REFERENCES [dbo].[Company_Employee] ([Company_Employee_ID])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Company_Employee]
GO

ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Products] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Products] ([Product_ID])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Products]
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Company_Employee]    Script Date: 5/6/2016 5:47:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Company_Employee](
	[Company_Employee_ID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[Department_ID] [int] NULL,
 CONSTRAINT [PK_Company_Employee] PRIMARY KEY CLUSTERED 
(
	[Company_Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


USE [s16guest17]
GO

/****** Object:  Table [dbo].[Cust_Release]    Script Date: 5/6/2016 5:48:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cust_Release](
	[Cust_Release_ID] [int] NOT NULL,
	[Product_Version] [float] NOT NULL,
	[Product_Release_Date] [date] NOT NULL,
	[Download_ID] [int] NULL,
 CONSTRAINT [PK_Cust_Realease] PRIMARY KEY CLUSTERED 
(
	[Cust_Release_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Cust_Release]  WITH CHECK ADD  CONSTRAINT [FK_Cust_Release_Download_Log] FOREIGN KEY([Download_ID])
REFERENCES [dbo].[Download_Log] ([Download_ID])
GO

ALTER TABLE [dbo].[Cust_Release] CHECK CONSTRAINT [FK_Cust_Release_Download_Log]
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 5/6/2016 5:48:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NOT NULL,
	[Customer_Name] [varchar](50) NOT NULL,
	[Customer_Email] [varchar](50) NULL,
	[Customer_Address] [varchar](50) NULL,
	[Customer_City] [varchar](20) NULL,
	[Customer_State] [varchar](2) NULL,
	[Customer_Zip] [int] NULL,
	[Employee_ID] [int] NULL,
	[Phone_ID] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Employee]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Phone] FOREIGN KEY([Phone_ID])
REFERENCES [dbo].[Phone] ([Phone_Id])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Phone]
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Dev_Release]    Script Date: 5/6/2016 5:48:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dev_Release](
	[Dev_Release_ID] [int] NOT NULL,
	[Product_Version] [float] NOT NULL,
	[Product_Release_Date] [date] NOT NULL,
 CONSTRAINT [PK_Dev_Release] PRIMARY KEY CLUSTERED 
(
	[Dev_Release_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Download_Log]    Script Date: 5/6/2016 5:48:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Download_Log](
	[Download_ID] [int] NOT NULL,
	[Download_Name] [varchar](50) NULL,
	[Download_Company] [varchar](50) NULL,
	[Download_Customer] [varchar](50) NULL,
	[Download_DateTime] [datetime] NULL,
 CONSTRAINT [PK_Download] PRIMARY KEY CLUSTERED 
(
	[Download_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 5/6/2016 5:48:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Zip] [nvarchar](5) NULL,
	[State] [nchar](2) NULL,
	[Salary] [bigint] NULL,
	[Age] [int] NULL,
	[Department_ID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Salary]  DEFAULT ((0)) FOR [Salary]
GO

ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Age]  DEFAULT ((18)) FOR [Age]
GO

ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Department]  DEFAULT ((1)) FOR [Department_ID]
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Login_]    Script Date: 5/6/2016 5:49:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Login_](
	[Login_ID] [int] NOT NULL,
	[Employee_Login] [varchar](20) NOT NULL,
	[Employee_ID] [int] NULL,
	[Employee_Password] [varchar](20) NOT NULL,
	[Cust_Release_ID] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Login_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Login_] ADD  CONSTRAINT [DF_Login_Customer_Employee_ID]  DEFAULT ((1)) FOR [Login_ID]
GO

ALTER TABLE [dbo].[Login_]  WITH CHECK ADD  CONSTRAINT [FK_Login__Cust_Release] FOREIGN KEY([Cust_Release_ID])
REFERENCES [dbo].[Cust_Release] ([Cust_Release_ID])
GO

ALTER TABLE [dbo].[Login_] CHECK CONSTRAINT [FK_Login__Cust_Release]
GO

ALTER TABLE [dbo].[Login_]  WITH CHECK ADD  CONSTRAINT [FK_Login__Employee] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO

ALTER TABLE [dbo].[Login_] CHECK CONSTRAINT [FK_Login__Employee]
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Phone]    Script Date: 5/6/2016 5:49:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Phone](
	[Phone_Id] [int] NOT NULL,
	[Phone] [varchar](11) NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[Phone_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [s16guest17]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 5/6/2016 5:49:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Products](
	[Product_ID] [int] NOT NULL,
	[Product_Name] [varchar](50) NOT NULL,
	[Branch_ID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Branch]
GO

