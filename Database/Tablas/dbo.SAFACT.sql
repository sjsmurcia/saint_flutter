USE [admin]
GO

/****** Object:  Table [dbo].[SAFACT]    Script Date: 24/08/2025 13:16:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAFACT](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[TipoFac] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[NroTurno] [int] NOT NULL,
	[NroCtrol] [varchar](20) NULL,
	[FromTran] [int] NOT NULL,
	[EstadoFE] [int] NOT NULL,
	[CodEsta] [varchar](10) NULL,
	[CodUsua] [varchar](10) NULL,
	[CodTran] [varchar](10) NULL,
	[CodTarj] [varchar](10) NULL,
	[EsCorrel] [smallint] NOT NULL,
	[CodConv] [varchar](10) NULL,
	[Signo] [smallint] NOT NULL,
	[FechaT] [datetime] NULL,
	[TipoDev] [smallint] NOT NULL,
	[OTipo] [varchar](1) NULL,
	[ONumero] [varchar](20) NULL,
	[NumeroC] [varchar](20) NULL,
	[NumeroT] [varchar](20) NULL,
	[NumeroR] [varchar](20) NULL,
	[TipoTraE] [smallint] NOT NULL,
	[AutSRI] [varchar](80) NULL,
	[NroEstable] [varchar](10) NULL,
	[PtoEmision] [varchar](10) NULL,
	[NumeroU] [varchar](20) NULL,
	[NumeroF] [varchar](40) NULL,
	[NumeroNCF] [varchar](20) NULL,
	[NumeroP] [varchar](15) NULL,
	[NumeroE] [varchar](20) NULL,
	[NumeroZ] [varchar](10) NULL,
	[Moneda] [varchar](5) NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[MontoMEx] [decimal](28, 4) NOT NULL,
	[CodClie] [varchar](15) NULL,
	[CodVend] [varchar](10) NULL,
	[CodUbic] [varchar](10) NULL,
	[Descrip] [varchar](60) NULL,
	[Direc1] [varchar](60) NULL,
	[Direc2] [varchar](60) NULL,
	[Direc3] [varchar](60) NULL,
	[ZipCode] [varchar](20) NULL,
	[Telef] [varchar](30) NULL,
	[ID3] [varchar](25) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[Fletes] [decimal](28, 4) NOT NULL,
	[TGravable] [decimal](28, 4) NOT NULL,
	[TGravable0] [decimal](28, 4) NOT NULL,
	[TExento] [decimal](28, 4) NOT NULL,
	[CostoPrd] [decimal](28, 4) NOT NULL,
	[CostoSrv] [decimal](28, 4) NOT NULL,
	[DesctoP] [decimal](28, 4) NOT NULL,
	[RetenIVA] [decimal](28, 4) NOT NULL,
	[FechaR] [datetime] NULL,
	[FechaI] [datetime] NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[MtoTotal] [decimal](28, 4) NOT NULL,
	[Contado] [decimal](28, 4) NOT NULL,
	[Credito] [decimal](28, 4) NOT NULL,
	[CancelI] [decimal](28, 4) NOT NULL,
	[CancelA] [decimal](28, 4) NOT NULL,
	[CancelE] [decimal](28, 4) NOT NULL,
	[CancelC] [decimal](28, 4) NOT NULL,
	[CancelT] [decimal](28, 4) NOT NULL,
	[CancelG] [decimal](28, 4) NOT NULL,
	[CancelP] [decimal](28, 4) NOT NULL,
	[Cambio] [decimal](28, 4) NOT NULL,
	[MtoExtra] [decimal](28, 4) NOT NULL,
	[ValorPtos] [decimal](28, 4) NOT NULL,
	[Descto1] [decimal](28, 4) NOT NULL,
	[PctAnual] [decimal](28, 4) NOT NULL,
	[MtoInt1] [decimal](28, 4) NOT NULL,
	[Descto2] [decimal](28, 4) NOT NULL,
	[PctManejo] [decimal](28, 4) NOT NULL,
	[MtoInt2] [decimal](28, 4) NOT NULL,
	[SaldoAct] [decimal](28, 4) NOT NULL,
	[MtoPagos] [decimal](28, 4) NOT NULL,
	[MtoNCredito] [decimal](28, 4) NOT NULL,
	[MtoNDebito] [decimal](28, 4) NOT NULL,
	[MtoFinanc] [decimal](28, 4) NOT NULL,
	[DetalChq] [varchar](40) NULL,
	[TotalPrd] [decimal](28, 4) NOT NULL,
	[TotalSrv] [decimal](28, 4) NOT NULL,
	[OrdenC] [varchar](30) NULL,
	[CodOper] [varchar](10) NULL,
	[NGiros] [int] NOT NULL,
	[NMeses] [int] NOT NULL,
	[MtoComiVta] [decimal](28, 4) NOT NULL,
	[MtoComiCob] [decimal](28, 4) NOT NULL,
	[MtoComiVtaD] [decimal](28, 4) NOT NULL,
	[MtoComiCobD] [decimal](28, 4) NOT NULL,
	[ImpuestoD] [decimal](28, 4) NOT NULL,
	[CancelTips] [decimal](28, 4) NOT NULL,
	[NroUnicoL] [int] NOT NULL,
	[CodAlte] [varchar](10) NULL,
	[Parcial] [smallint] NOT NULL,
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
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [NroTurno]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [FromTran]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [EstadoFE]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [EsCorrel]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Signo]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TipoDev]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TipoTraE]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MontoMEx]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Fletes]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TGravable]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TGravable0]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TExento]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CostoPrd]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CostoSrv]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [DesctoP]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoTotal]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Contado]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Credito]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelI]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelA]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelE]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelC]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelT]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelG]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelP]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Cambio]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoExtra]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [ValorPtos]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Descto1]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [PctAnual]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoInt1]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Descto2]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [PctManejo]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoInt2]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [SaldoAct]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoPagos]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoNCredito]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoNDebito]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoFinanc]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TotalPrd]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [TotalSrv]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [NGiros]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [NMeses]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoComiVta]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoComiCob]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoComiVtaD]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [MtoComiCobD]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [ImpuestoD]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [CancelTips]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [NroUnicoL]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT ((0)) FOR [Parcial]
GO

ALTER TABLE [dbo].[SAFACT] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


