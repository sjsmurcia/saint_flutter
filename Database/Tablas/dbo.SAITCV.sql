USE [admin]
GO

/****** Object:  Table [dbo].[SAITCV]    Script Date: 24/08/2025 13:36:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAITCV](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodConv] [varchar](10) NOT NULL,
	[CodItem] [varchar](15) NOT NULL,
	[TipoCnv] [smallint] NOT NULL,
	[TipoPVP] [smallint] NOT NULL,
	[Frecuencia] [int] NOT NULL,
	[FechaUV] [datetime] NULL,
	[EsUnid] [smallint] NOT NULL,
	[Medida] [smallint] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[PrecioI] [decimal](28, 4) NOT NULL,
	[MontoMax] [decimal](28, 4) NOT NULL,
	[Comision] [decimal](28, 4) NOT NULL,
	[Desde] [decimal](28, 4) NOT NULL,
	[Hasta] [decimal](28, 4) NOT NULL,
	[CodAlte] [varchar](15) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [TipoCnv]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [TipoPVP]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [Frecuencia]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [EsUnid]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [Medida]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [PrecioI]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [MontoMax]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [Comision]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [Desde]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT ((0)) FOR [Hasta]
GO

ALTER TABLE [dbo].[SAITCV] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


