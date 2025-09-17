USE [admin]
GO

/****** Object:  Table [dbo].[SAITRE]    Script Date: 24/08/2025 13:39:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAITRE](
	[itemid] [int] IDENTITY(1,1) NOT NULL,
	[folderid] [int] NOT NULL,
	[itemname] [varchar](60) NOT NULL,
	[itemsize] [int] NOT NULL,
	[itemtype] [int] NOT NULL,
	[modified] [datetime] NULL,
	[deleted] [datetime] NULL,
	[template] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[itemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


