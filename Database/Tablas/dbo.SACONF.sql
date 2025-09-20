USE [admin]
GO

/****** Object:  Table [dbo].[SACONF]    Script Date: 24/08/2025 9:53:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SACONF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[Descrip] [varchar](80) NOT NULL,
	[Direc1] [varchar](80) NULL,
	[Direc2] [varchar](80) NULL,
	[Email] [varchar](60) NULL,
	[Telef] [varchar](40) NULL,
	[RIF] [varchar](25) NULL,
	[NroSerial] [varchar](25) NULL,
	[KeySerial] [varchar](10) NULL,
	[FechaUV] [date] NULL,
	[ZipCode] [varchar](20) NULL,
	[Municipio] [int] NOT NULL,
	[Ciudad] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Pais] [int] NOT NULL,
	[SPais] [varchar](30) NULL,
	[SEstado] [varchar](30) NULL,
	[SCiudad] [varchar](30) NULL,
	[SMunicipio] [varchar](30) NULL,
	[CodTaxs] [varchar](10) NULL,
	[CostoMes] [decimal](28, 4) NOT NULL,
	[CorrelPrd] [smallint] NOT NULL,
	[IdAppNot] [int] NOT NULL,
	[IdVersion] [int] NOT NULL,
	[IdVerXtra] [int] NOT NULL,
	[Adicional] [binary](400) NULL,
	[MesCurso] [varchar](6) NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[FactorM] [decimal](28, 4) NOT NULL,
	[UsaFactorM] [smallint] NOT NULL,
	[FechaUP] [datetime] NULL,
	[MesTran] [int] NOT NULL,
	[MesOC] [int] NOT NULL,
	[MesPrf] [int] NOT NULL,
	[MesesPtos] [int] NOT NULL,
	[ValorPtos] [decimal](28, 4) NOT NULL,
	[ValorPtosV] [decimal](28, 4) NOT NULL,
	[FechaUC] [datetime] NULL,
	[MtoExtraG] [decimal](28, 4) NOT NULL,
	[ImpFleteV] [smallint] NOT NULL,
	[ImpFleteC] [smallint] NOT NULL,
	[RetenIVA] [smallint] NOT NULL,
	[AutoReten] [smallint] NOT NULL,
	[PorctReten] [decimal](28, 4) NOT NULL,
	[PedirNCtrl] [smallint] NOT NULL,
	[Redond] [smallint] NOT NULL,
	[RedTotal] [smallint] NOT NULL,
	[ObliOper] [smallint] NOT NULL,
	[PaswLim] [int] NOT NULL,
	[Settings] [nvarchar](max) NULL,
	[MontoMin] [decimal](28, 4) NOT NULL,
	[SimbFac] [varchar](3) NULL,
	[EsMoneda] [smallint] NOT NULL,
	[CorrelUNC] [smallint] NOT NULL,
	[FillCorrel] [smallint] NOT NULL,
	[Imagen] [image] NULL,
	[TipoFac] [smallint] NOT NULL,
	[TipoDef] [smallint] NOT NULL,
	[NroEstable] [varchar](10) NULL,
	[RUCUser] [varchar](60) NULL,
	[RUCPwd] [varchar](20) NULL,
	[SerieFacE] [varchar](10) NULL,
	[CorrelEstac] [smallint] NOT NULL,
	[ImpuestoD] [decimal](28, 4) NOT NULL,
	[IMailHost] [varchar](70) NULL,
	[IMailPort] [int] NOT NULL,
	[IMailUser] [varchar](60) NULL,
	[IMailPwd] [varchar](30) NULL,
	[IMailSender] [varchar](70) NULL,
	[IMailSSL] [smallint] NOT NULL,
	[TokenEmpresa] [varchar](50) NULL,
	[TokenSecuencial] [varchar](50) NULL,
	[FacWSrvURL] [varchar](100) NULL,
	[TipoPrv] [smallint] NOT NULL,
	[TipoAtr] [smallint] NOT NULL,
	[CodTaxD1] [varchar](5) NULL,
	[CodTaxD2] [varchar](5) NULL,
	[MtoTaxD1] [decimal](28, 4) NOT NULL,
	[MtoTaxD2] [decimal](28, 4) NOT NULL,
	[DctoAplica] [int] NOT NULL,
	[ImpT] [int] NOT NULL,
	[PrecioI] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [Municipio]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [Ciudad]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [Pais]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [CostoMes]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [CorrelPrd]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [IdAppNot]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [IdVersion]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [IdVerXtra]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [FactorM]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [UsaFactorM]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MesTran]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MesOC]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MesPrf]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MesesPtos]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ValorPtos]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ValorPtosV]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MtoExtraG]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ImpFleteV]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ImpFleteC]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [AutoReten]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [PorctReten]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [PedirNCtrl]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [Redond]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [RedTotal]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ObliOper]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [PaswLim]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MontoMin]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [EsMoneda]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [CorrelUNC]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [FillCorrel]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [TipoFac]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [TipoDef]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [CorrelEstac]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ImpuestoD]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [IMailPort]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [IMailSSL]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [TipoPrv]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [TipoAtr]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MtoTaxD1]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [MtoTaxD2]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [DctoAplica]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [ImpT]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT ((0)) FOR [PrecioI]
GO

ALTER TABLE [dbo].[SACONF] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


