USE [admin]
GO

/****** Object:  Table [dbo].[SAPROV]    Script Date: 24/08/2025 20:14:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPROV](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[Descrip] [varchar](60) NULL,
	[TipoPrv] [smallint] NOT NULL,
	[TipoID3] [smallint] NOT NULL,
	[TipoID] [smallint] NOT NULL,
	[ID3] [varchar](25) NULL,
	[DescOrder] [varchar](10) NULL,
	[Clase] [varchar](10) NULL,
	[Activo] [smallint] NOT NULL,
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
	[Fax] [varchar](30) NULL,
	[Email] [varchar](60) NULL,
	[FechaE] [datetime] NULL,
	[EsReten] [smallint] NOT NULL,
	[RetenISLR] [int] NOT NULL,
	[DiasCred] [int] NOT NULL,
	[Observa] [varchar](40) NULL,
	[EsMoneda] [smallint] NOT NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[MontoMax] [decimal](28, 4) NOT NULL,
	[PagosA] [decimal](28, 4) NOT NULL,
	[PromPago] [decimal](28, 4) NOT NULL,
	[RetenIVA] [decimal](28, 4) NOT NULL,
	[FechaUC] [datetime] NULL,
	[MontoUC] [decimal](28, 4) NOT NULL,
	[NumeroUC] [varchar](20) NULL,
	[FechaUP] [datetime] NULL,
	[MontoUP] [decimal](28, 4) NOT NULL,
	[NumeroUP] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [TipoPrv]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [TipoID3]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [TipoID]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [Pais]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [Ciudad]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [Municipio]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [RetenISLR]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [DiasCred]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [EsMoneda]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [MontoMax]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [PagosA]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [PromPago]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [MontoUC]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT ((0)) FOR [MontoUP]
GO

ALTER TABLE [dbo].[SAPROV] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


