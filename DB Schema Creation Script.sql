USE [master]
GO

/****** Object:  Database [GFT]    Script Date: 4/4/2018 8:55:11 AM ******/
CREATE DATABASE [GFT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GFT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GFT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GFT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GFT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [GFT] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GFT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [GFT] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [GFT] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [GFT] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [GFT] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [GFT] SET ARITHABORT OFF 
GO

ALTER DATABASE [GFT] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [GFT] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [GFT] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [GFT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [GFT] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [GFT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [GFT] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [GFT] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [GFT] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [GFT] SET  DISABLE_BROKER 
GO

ALTER DATABASE [GFT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [GFT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [GFT] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [GFT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [GFT] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [GFT] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [GFT] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [GFT] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [GFT] SET  MULTI_USER 
GO

ALTER DATABASE [GFT] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [GFT] SET DB_CHAINING OFF 
GO

ALTER DATABASE [GFT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [GFT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [GFT] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [GFT] SET QUERY_STORE = OFF
GO

USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [gft_sa]    Script Date: 4/4/2018 11:13:02 PM ******/
CREATE LOGIN [gft_sa] WITH PASSWORD=N'gft.1234', DEFAULT_DATABASE=[GFT], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [gft_sa] ENABLE
GO

USE [GFT]
GO

/****** Object:  User [gft_sa]    Script Date: 4/4/2018 11:12:27 PM ******/
CREATE USER [gft_sa] FOR LOGIN [gft_sa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [gft_sa]
GO


USE [GFT]
GO

ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [GFT] SET  READ_WRITE 
GO


USE [GFT]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 4/4/2018 8:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Client_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Date_Of_Birth] [date] NULL,
	[Client_Type_Id] [int] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Type]    Script Date: 4/4/2018 8:53:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Type](
	[Client_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client_Type] PRIMARY KEY CLUSTERED 
(
	[Client_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client]  WITH NOCHECK ADD  CONSTRAINT [FK_Client_Client_Type] FOREIGN KEY([Client_Type_Id])
REFERENCES [dbo].[Client_Type] ([Client_Type_Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Client_Type]
GO