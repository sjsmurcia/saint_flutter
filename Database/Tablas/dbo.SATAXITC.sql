USE [SAINTA]
GO

/****** Object:  Table [dbo].[SATAXITC]    Script Date: 24/08/2025 20:33:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SATAXITC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[TipoCom] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[NroLineaC] [int] NOT NULL,
	[CodTaxs] [varchar](10) NOT NULL,
	[CodItem] [varchar](15) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[TGravable] [decimal](28, 4) NOT NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SATAXITC] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SATAXITC] ADD  DEFAULT ((0)) FOR [NroLineaC]
GO

ALTER TABLE [dbo].[SATAXITC] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SATAXITC] ADD  DEFAULT ((0)) FOR [TGravable]
GO

ALTER TABLE [dbo].[SATAXITC] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SATAXITC] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


