USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAOFER]    Script Date: 24/08/2025 13:42:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAOFER](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[NumeroD] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NOT NULL,
	[CodEsta] [varchar](10) NULL,
	[CodUsua] [varchar](10) NULL,
	[TipoOfe] [smallint] NOT NULL,
	[Activo] [smallint] NOT NULL,
	[Autori] [varchar](40) NULL,
	[Respon] [varchar](40) NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[Frecuencia] [varchar](7) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAOFER] ADD  DEFAULT ((0)) FOR [TipoOfe]
GO

ALTER TABLE [dbo].[SAOFER] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SAOFER] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


