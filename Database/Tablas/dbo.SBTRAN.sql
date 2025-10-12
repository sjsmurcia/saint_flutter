USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBTRAN]    Script Date: 24/08/2025 20:47:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBTRAN](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[AOD] [varchar](1) NOT NULL,
	[NOpe] [int] NOT NULL,
	[NroComp] [int] NOT NULL,
	[OpeRel] [int] NOT NULL,
	[CRefer] [varchar](35) NULL,
	[CodEsta] [varchar](30) NULL,
	[CodUsua] [varchar](30) NULL,
	[CodSucu] [varchar](5) NULL,
	[CodOper] [varchar](10) NULL,
	[FechaLib] [datetime] NULL,
	[TipBen] [int] NOT NULL,
	[CodBene] [varchar](30) NULL,
	[TDC] [int] NOT NULL,
	[CDCD] [int] NOT NULL,
	[Descripcion] [varchar](60) NULL,
	[Documento] [varchar](25) NULL,
	[Comentario1] [varchar](50) NULL,
	[Comentario2] [varchar](50) NULL,
	[Comentario3] [varchar](50) NULL,
	[Memo] [text] NULL,
	[OBCP] [varchar](1) NULL,
	[NroPpal] [int] NOT NULL,
	[Origen] [varchar](35) NULL,
	[Estado] [int] NOT NULL,
	[FecConc] [datetime] NULL,
	[NoConc] [int] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[Endosable] [int] NOT NULL,
	[TipoOpe] [int] NOT NULL,
	[CtaIDB] [varchar](30) NULL,
	[DCtaIDB] [varchar](60) NULL,
	[MtoIDB] [decimal](28, 4) NOT NULL,
	[Consolidado] [int] NOT NULL,
	[FConsolidado] [datetime] NULL,
	[NroEgreso] [decimal](28, 4) NOT NULL,
	[MtoDebito] [decimal](28, 4) NOT NULL,
	[DctoOrigen] [varchar](25) NULL,
	[MtoOrigen] [decimal](28, 4) NOT NULL,
	[BeneOrigen] [varchar](40) NULL,
	[Monto1] [decimal](28, 4) NOT NULL,
	[Monto2] [decimal](28, 4) NOT NULL,
	[MtoDeb] [decimal](28, 4) NOT NULL,
	[DctoOri] [varchar](20) NULL,
	[BeneOri] [varchar](50) NULL,
	[MtoOri] [decimal](28, 4) NOT NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [NOpe]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [NroComp]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [OpeRel]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [TipBen]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [TDC]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [CDCD]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [NroPpal]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [NoConc]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Endosable]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoIDB]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Consolidado]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [NroEgreso]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoDebito]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoOrigen]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Monto1]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Monto2]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoDeb]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [MtoOri]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SBTRAN] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


