USE [master]
GO
/****** Object:  Database [ZH_report]    Script Date: 2019/8/2 9:26:16 ******/
CREATE DATABASE [ZH_report]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ZH_report', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZH_report.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ZH_report_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ZH_report_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ZH_report] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZH_report].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZH_report] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZH_report] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZH_report] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZH_report] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZH_report] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZH_report] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZH_report] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ZH_report] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZH_report] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZH_report] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZH_report] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZH_report] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZH_report] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZH_report] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZH_report] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZH_report] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZH_report] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZH_report] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZH_report] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZH_report] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZH_report] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZH_report] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZH_report] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZH_report] SET RECOVERY FULL 
GO
ALTER DATABASE [ZH_report] SET  MULTI_USER 
GO
ALTER DATABASE [ZH_report] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZH_report] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZH_report] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZH_report] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ZH_report', N'ON'
GO
USE [ZH_report]
GO
/****** Object:  Table [dbo].[col_info]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[col_info](
	[col_ID] [int] IDENTITY(1,1) NOT NULL,
	[REPORT_ID] [int] NOT NULL,
	[col_name] [varchar](200) NOT NULL,
	[col_loc] [int] NOT NULL,
	[status] [int] NOT NULL,
	[del_flag] [int] NOT NULL,
 CONSTRAINT [PK_col_info] PRIMARY KEY CLUSTERED 
(
	[col_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMP_INFO]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMP_INFO](
	[EMP_ID] [varchar](50) NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[ORG_ID] [int] NOT NULL,
	[ROLE_ID] [int] NOT NULL,
	[PASSWORD] [varchar](50) NOT NULL,
	[SALT] [varchar](50) NOT NULL,
	[del_flag] [int] NOT NULL,
 CONSTRAINT [PK_EMP_INFO] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fill_info]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fill_info](
	[Fill_ID] [int] IDENTITY(1,1) NOT NULL,
	[col_ID] [int] NOT NULL,
	[EMP_ID] [varchar](50) NOT NULL,
	[context] [text] NULL,
	[fillDatetime] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[del_flag] [int] NOT NULL,
 CONSTRAINT [PK_fill_info] PRIMARY KEY CLUSTERED 
(
	[Fill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[final_report]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[final_report](
	[final_ID] [int] IDENTITY(1,1) NOT NULL,
	[del_flag] [int] NOT NULL,
	[REPORT_ID] [int] NOT NULL,
	[CREAT_USER] [varchar](50) NULL,
	[CREAT_TIME] [datetime] NULL,
	[UPDATE_USER] [varchar](50) NULL,
	[UPDATE_TIME] [datetime] NULL,
	[COL1] [varchar](200) NULL,
	[COL2] [varchar](200) NULL,
	[COL3] [varchar](200) NULL,
	[COL4] [varchar](200) NULL,
	[COL5] [varchar](200) NULL,
	[COL6] [varchar](200) NULL,
	[COL7] [varchar](200) NULL,
	[COL8] [varchar](200) NULL,
	[COL9] [varchar](200) NULL,
	[COL10] [varchar](200) NULL,
	[COL11] [varchar](200) NULL,
	[COL12] [varchar](200) NULL,
	[COL13] [varchar](200) NULL,
	[COL14] [varchar](200) NULL,
	[COL15] [varchar](200) NULL,
	[COL16] [varchar](200) NULL,
	[COL17] [varchar](200) NULL,
	[COL18] [varchar](200) NULL,
	[COL19] [varchar](200) NULL,
	[COL20] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login_ticket]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login_ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EMP_ID] [varchar](50) NOT NULL,
	[ticket] [varchar](100) NOT NULL,
	[expired] [datetime] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_login_ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[org_info]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[org_info](
	[ORG_ID] [int] IDENTITY(1,1) NOT NULL,
	[ORG_NAME] [varchar](200) NOT NULL,
	[PARENT_ID] [int] NOT NULL,
	[EMP_ID] [varchar](50) NOT NULL,
	[del_flag] [int] NOT NULL,
 CONSTRAINT [PK_org_info] PRIMARY KEY CLUSTERED 
(
	[ORG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[report_info]    Script Date: 2019/8/2 9:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report_info](
	[REPORT_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_ID] [varchar](50) NOT NULL,
	[REPORT_NAME] [varchar](200) NOT NULL,
	[CREAT_TIME] [datetime] NOT NULL,
	[BUSSKEY] [varchar](50) NOT NULL,
	[del_flag] [int] NOT NULL,
	[is_check] [int] NOT NULL,
 CONSTRAINT [PK_report_info] PRIMARY KEY CLUSTERED 
(
	[REPORT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[col_info] ADD  CONSTRAINT [DF_col_info_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[col_info] ADD  CONSTRAINT [DF_col_info_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[EMP_INFO] ADD  CONSTRAINT [DF_EMP_INFO_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[fill_info] ADD  CONSTRAINT [DF_fill_info_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[fill_info] ADD  CONSTRAINT [DF_fill_info_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[final_report] ADD  CONSTRAINT [DF_final_report_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[org_info] ADD  CONSTRAINT [DF_org_info_PARENT_ID]  DEFAULT ((1)) FOR [PARENT_ID]
GO
ALTER TABLE [dbo].[org_info] ADD  CONSTRAINT [DF_org_info_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[report_info] ADD  CONSTRAINT [DF_report_info_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[report_info] ADD  CONSTRAINT [DF_report_info_is_check]  DEFAULT ((0)) FOR [is_check]
GO
USE [master]
GO
ALTER DATABASE [ZH_report] SET  READ_WRITE 
GO
