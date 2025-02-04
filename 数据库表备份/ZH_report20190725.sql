USE [ZH_report]
GO
/****** Object:  Table [dbo].[col_info]    Script Date: 2019/7/25 15:52:16 ******/
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
/****** Object:  Table [dbo].[EMP_INFO]    Script Date: 2019/7/25 15:52:16 ******/
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
/****** Object:  Table [dbo].[fill_info]    Script Date: 2019/7/25 15:52:16 ******/
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
/****** Object:  Table [dbo].[final_report]    Script Date: 2019/7/25 15:52:16 ******/
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
/****** Object:  Table [dbo].[login_ticket]    Script Date: 2019/7/25 15:52:16 ******/
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
/****** Object:  Table [dbo].[org_info]    Script Date: 2019/7/25 15:52:16 ******/
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
/****** Object:  Table [dbo].[report_info]    Script Date: 2019/7/25 15:52:16 ******/
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
 CONSTRAINT [PK_report_info] PRIMARY KEY CLUSTERED 
(
	[REPORT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[EMP_INFO] ([EMP_ID], [NAME], [ORG_ID], [ROLE_ID], [PASSWORD], [SALT], [del_flag]) VALUES (N'李四', N'lisi', 1, 1, N'22CF80ADF52BD550A8D534E6960703FF', N'86b7d', 0)
SET IDENTITY_INSERT [dbo].[login_ticket] ON 

INSERT [dbo].[login_ticket] ([id], [EMP_ID], [ticket], [expired], [status]) VALUES (1, N'李四', N'12c4fb5a42ab4e8cb47d8e0619a15d4e', CAST(0x0000AA9601021175 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[login_ticket] OFF
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
ALTER TABLE [dbo].[org_info] ADD  CONSTRAINT [DF_org_info_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
ALTER TABLE [dbo].[report_info] ADD  CONSTRAINT [DF_report_info_del_flag]  DEFAULT ((0)) FOR [del_flag]
GO
