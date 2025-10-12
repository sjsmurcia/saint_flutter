USE [SAINTA]
GO

/****** Object:  Table [dbo].[SATAXES]    Script Date: 24/08/2025 20:33:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SATAXES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodTaxs] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[Activo] [smallint] NOT NULL,
	[EsFijo] [smallint] NOT NULL,
	[EsReten] [smallint] NOT NULL,
	[CodOper] [varchar](10) NULL,
	[CodFacE] [varchar](10) NULL,
	[EsPorct] [smallint] NOT NULL,
	[EsCosto] [smallint] NOT NULL,
	[TipoIVA] [smallint] NOT NULL,
	[EsLibroI] [smallint] NOT NULL,
	[EsPartic] [smallint] NOT NULL,
	[EsTaxVenta] [smallint] NOT NULL,
	[EsTaxCompra] [smallint] NOT NULL,
	[MontoMin] [decimal](28, 4) NOT NULL,
	[MontoMax] [decimal](28, 4) NOT NULL,
	[Sustraendo] [decimal](28, 4) NOT NULL,
	[EsCorrel] [smallint] NOT NULL,
	[Formato] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsFijo]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsPorct]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsCosto]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [TipoIVA]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsLibroI]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsPartic]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsTaxVenta]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsTaxCompra]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [MontoMin]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [MontoMax]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [Sustraendo]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT ((0)) FOR [EsCorrel]
GO

ALTER TABLE [dbo].[SATAXES] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


