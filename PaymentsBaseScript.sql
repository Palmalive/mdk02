USE [master]
GO
/****** Object:  Database [PaymentsBase]    Script Date: 22.05.2023 16:58:13 ******/
CREATE DATABASE [PaymentsBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaymentsBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PaymentsBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaymentsBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PaymentsBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PaymentsBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaymentsBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaymentsBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaymentsBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaymentsBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaymentsBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaymentsBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaymentsBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaymentsBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaymentsBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaymentsBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaymentsBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaymentsBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaymentsBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PaymentsBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaymentsBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaymentsBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaymentsBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaymentsBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaymentsBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaymentsBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaymentsBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PaymentsBase] SET  MULTI_USER 
GO
ALTER DATABASE [PaymentsBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaymentsBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaymentsBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaymentsBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaymentsBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaymentsBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PaymentsBase] SET QUERY_STORE = OFF
GO
USE [PaymentsBase]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22.05.2023 16:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Icon] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 22.05.2023 16:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Num] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22.05.2023 16:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PIN] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Category]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO
USE [master]
GO
ALTER DATABASE [PaymentsBase] SET  READ_WRITE 
GO
