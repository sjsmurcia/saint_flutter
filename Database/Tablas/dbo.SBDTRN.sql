USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBDTRN]    Script Date: 24/08/2025 20:42:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBDTRN](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[NOpe] [int] NOT NULL,
	[NLinea] [int] NOT NULL,
	[CodCta] [varchar](30) NULL,
	[EsTransf] [int] NOT NULL,
	[EsCuenta] [int] NOT NULL,
	[CodUsua] [varchar](30) NULL,
	[CodSucu] [varchar](5) NULL,
	[CodOper] [varchar](10) NULL,
	[CodEsta] [varchar](30) NULL,
	[CDCD] [int] NOT NULL,
	[EncOpe] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Descripcion] [varchar](60) NULL,
	[Origen] [varchar](35) NULL,
	[Estado] [int] NOT NULL,
	[DH] [int] NOT NULL,
	[NMo] [int] NOT NULL,
	[BaseTr] [decimal](28, 4) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[Consolidado] [int] NOT NULL,
	[FConsolidado] [datetime] NULL,
	[SiCentro] [int] NOT NULL,
	[SiTercero] [int] NOT NULL,
	[CodCenCto] [varchar](30) NULL,
	[CodTercero] [varchar](30) NULL,
	[Tercero] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [NOpe]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [NLinea]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [EsTransf]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [EsCuenta]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [CDCD]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [EncOpe]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [DH]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [NMo]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [BaseTr]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [Consolidado]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [SiCentro]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT ((0)) FOR [SiTercero]
GO

ALTER TABLE [dbo].[SBDTRN] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


