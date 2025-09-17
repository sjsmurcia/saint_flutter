USE [admin]
GO

/****** Object:  Table [dbo].[SASERV]    Script Date: 24/08/2025 20:29:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SASERV](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodServ] [varchar](10) NOT NULL,
	[CodInst] [int] NOT NULL,
	[Descrip] [varchar](40) NULL,
	[Descrip2] [varchar](40) NULL,
	[Descrip3] [varchar](40) NULL,
	[Clase] [varchar](10) NULL,
	[Activo] [smallint] NOT NULL,
	[Unidad] [varchar](6) NULL,
	[Precio1] [decimal](28, 4) NOT NULL,
	[PrecioI1] [decimal](28, 4) NOT NULL,
	[Precio2] [decimal](28, 4) NOT NULL,
	[PrecioI2] [decimal](28, 4) NOT NULL,
	[Precio3] [decimal](28, 4) NOT NULL,
	[PrecioI3] [decimal](28, 4) NOT NULL,
	[Costo] [decimal](28, 4) NOT NULL,
	[EsExento] [smallint] NOT NULL,
	[EsReten] [smallint] NOT NULL,
	[EsPorCost] [smallint] NOT NULL,
	[UsaServ] [smallint] NOT NULL,
	[Comision] [decimal](28, 4) NOT NULL,
	[EsPorComi] [smallint] NOT NULL,
	[FechaUV] [datetime] NULL,
	[FechaUC] [datetime] NULL,
	[EsImport] [smallint] NOT NULL,
	[EsVenta] [smallint] NOT NULL,
	[EsCompra] [smallint] NOT NULL,
	[PriceEx] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [CodInst]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [Precio1]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [PrecioI1]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [Precio2]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [PrecioI2]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [Precio3]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [PrecioI3]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [Costo]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsExento]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsPorCost]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [UsaServ]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [Comision]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsPorComi]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsImport]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsVenta]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [EsCompra]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT ((0)) FOR [PriceEx]
GO

ALTER TABLE [dbo].[SASERV] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


