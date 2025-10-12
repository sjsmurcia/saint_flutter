USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAPAGCXP]    Script Date: 24/08/2025 20:09:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPAGCXP](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodProv] [varchar](15) NULL,
	[NroPpal] [int] NOT NULL,
	[NroRegi] [int] NOT NULL,
	[TipoCxP] [varchar](2) NULL,
	[MontoDocA] [decimal](28, 4) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[FechaE] [datetime] NULL,
	[FechaO] [datetime] NULL,
	[EsReten] [smallint] NOT NULL,
	[BaseReten] [decimal](28, 4) NOT NULL,
	[CodOper] [varchar](10) NULL,
	[CodRete] [varchar](10) NULL,
	[BaseImpo] [decimal](28, 4) NOT NULL,
	[TExento] [decimal](28, 4) NOT NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[RetenIVA] [decimal](28, 4) NOT NULL,
	[Sustraendo] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [NroPpal]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [NroRegi]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [MontoDocA]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [BaseReten]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [BaseImpo]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [TExento]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT ((0)) FOR [Sustraendo]
GO

ALTER TABLE [dbo].[SAPAGCXP] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


