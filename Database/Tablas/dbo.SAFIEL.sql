USE [admin]
GO

/****** Object:  Table [dbo].[SAFIEL]    Script Date: 24/08/2025 13:17:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAFIEL](
	[tablename] [varchar](60) NOT NULL,
	[fieldname] [varchar](60) NOT NULL,
	[fieldalias] [varchar](60) NULL,
	[datatype] [varchar](60) NULL,
	[selectable] [char](1) NULL,
	[searchable] [char](1) NULL,
	[sortable] [char](1) NULL,
	[autosearch] [char](1) NULL,
	[mandatory] [char](1) NULL
) ON [PRIMARY]
GO


