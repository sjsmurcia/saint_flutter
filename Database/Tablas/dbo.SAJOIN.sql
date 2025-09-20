USE [admin]
GO

/****** Object:  Table [dbo].[SAJOIN]    Script Date: 24/08/2025 13:40:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAJOIN](
	[tablename1] [varchar](60) NOT NULL,
	[tablename2] [varchar](60) NOT NULL,
	[jointype] [varchar](60) NULL,
	[fieldnames1] [varchar](255) NULL,
	[operators] [varchar](60) NULL,
	[fieldnames2] [varchar](255) NULL
) ON [PRIMARY]
GO


