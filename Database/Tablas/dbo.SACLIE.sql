USE [admin]
GO

/****** Object:  Table [dbo].[SACLIE]    Script Date: 24/08/2025 9:51:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SACLIE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodClie] [varchar](15) NOT NULL,
	[Descrip] [varchar](60) NULL,
	[ID3] [varchar](25) NULL,
	[TipoID3] [smallint] NOT NULL,
	[TipoID] [smallint] NOT NULL,
	[Activo] [smallint] NOT NULL,
	[DescOrder] [varchar](10) NULL,
	[Clase] [varchar](10) NULL,
	[Represent] [varchar](40) NULL,
	[Direc1] [varchar](60) NULL,
	[Direc2] [varchar](60) NULL,
	[Pais] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Ciudad] [int] NOT NULL,
	[Municipio] [int] NOT NULL,
	[ZipCode] [varchar](20) NULL,
	[Telef] [varchar](30) NULL,
	[Movil] [varchar](15) NULL,
	[Email] [varchar](60) NULL,
	[Fax] [varchar](30) NULL,
	[FechaE] [datetime] NULL,
	[CodZona] [varchar](10) NULL,
	[CodVend] [varchar](10) NULL,
	[CodConv] [varchar](10) NULL,
	[CodAlte] [varchar](15) NULL,
	[TipoCli] [smallint] NOT NULL,
	[TipoReg] [smallint] NOT NULL,
	[TipoPVP] [smallint] NOT NULL,
	[Observa] [varchar](40) NULL,
	[EsMoneda] [smallint] NOT NULL,
	[EsCredito] [smallint] NOT NULL,
	[LimiteCred] [decimal](28, 4) NOT NULL,
	[DiasCred] [int] NOT NULL,
	[EsToleran] [smallint] NOT NULL,
	[DiasTole] [int] NOT NULL,
	[IntMora] [smallint] NOT NULL,
	[Descto] [decimal](28, 4) NOT NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[PagosA] [decimal](28, 4) NOT NULL,
	[FechaUV] [datetime] NULL,
	[MontoUV] [decimal](28, 4) NOT NULL,
	[NumeroUV] [varchar](20) NULL,
	[FechaUP] [datetime] NULL,
	[MontoUP] [decimal](28, 4) NOT NULL,
	[NumeroUP] [varchar](20) NULL,
	[MontoMax] [decimal](28, 4) NOT NULL,
	[MtoMaxCred] [decimal](28, 4) NOT NULL,
	[PromPago] [decimal](28, 4) NOT NULL,
	[RetenIVA] [decimal](28, 4) NOT NULL,
	[SaldoPtos] [decimal](28, 4) NOT NULL,
	[EsReten] [smallint] NOT NULL,
	[DescripExt] [varchar](250) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [TipoID3]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [TipoID]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Pais]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Ciudad]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Municipio]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [TipoCli]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [TipoReg]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [TipoPVP]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [EsMoneda]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [EsCredito]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [LimiteCred]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [DiasCred]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [EsToleran]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [DiasTole]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [IntMora]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Descto]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [PagosA]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [MontoUV]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [MontoUP]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [MontoMax]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [MtoMaxCred]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [PromPago]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [SaldoPtos]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SACLIE] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


