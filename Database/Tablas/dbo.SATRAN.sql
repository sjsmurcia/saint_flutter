USE [admin]
GO

/****** Object:  Table [dbo].[SATRAN]    Script Date: 24/08/2025 20:35:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SATRAN](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodTran] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[Identidad] [varchar](10) NULL,
	[Clase] [varchar](10) NULL,
	[CodMeca] [varchar](10) NULL,
	[CodZona] [varchar](10) NULL,
	[Represent] [varchar](40) NULL,
	[Direc1] [varchar](60) NULL,
	[Direc2] [varchar](60) NULL,
	[Telefonos] [varchar](30) NULL,
	[Activo] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SATRAN] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SATRAN] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


