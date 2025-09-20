USE [admin]
GO

/****** Object:  Table [dbo].[SADEPO]    Script Date: 24/08/2025 9:56:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SADEPO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodUbic] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[Clase] [varchar](10) NULL,
	[Activo] [smallint] NOT NULL,
	[Represent] [varchar](40) NULL,
	[Direc1] [varchar](60) NULL,
	[Direc2] [varchar](60) NULL,
	[ZipCode] [varchar](20) NULL,
	[Telef] [varchar](30) NULL,
	[Printer] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SADEPO] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SADEPO] ADD  DEFAULT ((0)) FOR [Printer]
GO

ALTER TABLE [dbo].[SADEPO] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


