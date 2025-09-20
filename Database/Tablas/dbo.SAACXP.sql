USE [admin]
GO

/****** Object:  Table [dbo].[SAACXP]    Script Date: 24/08/2025 9:46:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAACXP](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroRegi] [int] NOT NULL,
	[FechaI] [datetime] NOT NULL,
	[FechaE] [datetime] NOT NULL,
	[FechaT] [datetime] NULL,
	[FechaR] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[CodEsta] [varchar](10) NULL,
	[CodUsua] [varchar](10) NULL,
	[CodOper] [varchar](10) NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[NumeroN] [varchar](20) NULL,
	[NroCtrol] [varchar](20) NULL,
	[FromTran] [int] NOT NULL,
	[TipoCxP] [varchar](2) NULL,
	[TipoSus] [smallint] NOT NULL,
	[TipoTraE] [smallint] NOT NULL,
	[NroEstable] [varchar](10) NULL,
	[PtoEmision] [varchar](10) NULL,
	[AutSRI] [varchar](80) NULL,
	[CodTarj] [varchar](10) NULL,
	[Moneda] [varchar](5) NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[MontoMEx] [decimal](28, 4) NOT NULL,
	[SaldoMEx] [decimal](28, 4) NOT NULL,
	[Document] [varchar](40) NULL,
	[Notas1] [varchar](60) NULL,
	[Notas2] [varchar](60) NULL,
	[Notas3] [varchar](60) NULL,
	[Notas4] [varchar](60) NULL,
	[Notas5] [varchar](60) NULL,
	[Notas6] [varchar](60) NULL,
	[Notas7] [varchar](60) NULL,
	[Notas8] [varchar](60) NULL,
	[Notas9] [varchar](60) NULL,
	[Notas10] [varchar](60) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Debitos] [decimal](28, 4) NOT NULL,
	[Creditos] [decimal](28, 4) NOT NULL,
	[MontoNeto] [decimal](28, 4) NOT NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[RetenIVA] [decimal](28, 4) NOT NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[SaldoOrg] [decimal](28, 4) NOT NULL,
	[OrgTax] [decimal](28, 4) NOT NULL,
	[SaldoAct] [decimal](28, 4) NOT NULL,
	[EsLibroI] [smallint] NOT NULL,
	[BaseImpo] [decimal](28, 4) NOT NULL,
	[TExento] [decimal](28, 4) NOT NULL,
	[CancelI] [decimal](28, 4) NOT NULL,
	[CancelA] [decimal](28, 4) NOT NULL,
	[CancelE] [decimal](28, 4) NOT NULL,
	[CancelC] [decimal](28, 4) NOT NULL,
	[CancelT] [decimal](28, 4) NOT NULL,
	[CancelG] [decimal](28, 4) NOT NULL,
	[CancelD] [decimal](28, 4) NOT NULL,
	[EsUnPago] [smallint] NOT NULL,
	[EsReten] [smallint] NOT NULL,
	[DetalChq] [varchar](40) NULL,
	[AfectaCom] [smallint] NOT NULL,
	[Descrip] [varchar](60) NULL,
	[ID3] [varchar](25) NULL,
	[NroOPago] [varchar](15) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [NroRegi]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [FromTran]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [TipoSus]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [TipoTraE]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [MontoMEx]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [SaldoMEx]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [Debitos]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [Creditos]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [MontoNeto]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [SaldoOrg]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [OrgTax]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [SaldoAct]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [EsLibroI]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [BaseImpo]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [TExento]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelI]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelA]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelE]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelC]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelT]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelG]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [CancelD]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [EsUnPago]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT ((0)) FOR [AfectaCom]
GO

ALTER TABLE [dbo].[SAACXP] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


