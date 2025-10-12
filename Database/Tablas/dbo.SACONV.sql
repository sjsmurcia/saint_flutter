USE [SAINTA]
GO

/****** Object:  Table [dbo].[SACONV]    Script Date: 24/08/2025 9:54:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SACONV](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodConv] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[Autori] [varchar](40) NULL,
	[Respon] [varchar](40) NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[Frecuencia] [int] NOT NULL,
	[FechaUC] [datetime] NULL,
	[EsFijo] [smallint] NOT NULL,
	[TipoCnv] [smallint] NOT NULL,
	[EsBase] [smallint] NOT NULL,
	[Maximo] [decimal](28, 4) NOT NULL,
	[Activo] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT ((0)) FOR [Frecuencia]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT ((0)) FOR [EsFijo]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT ((0)) FOR [TipoCnv]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT ((0)) FOR [EsBase]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT ((0)) FOR [Maximo]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SACONV] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


