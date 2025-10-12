USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAITEMOPI]    Script Date: 24/08/2025 13:38:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAITEMOPI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[TipoOpI] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[NroLineaC] [int] NOT NULL,
	[CodItem] [varchar](15) NULL,
	[CodUbic] [varchar](10) NULL,
	[CodUbic2] [varchar](10) NULL,
	[Descrip1] [varchar](40) NULL,
	[Descrip2] [varchar](40) NULL,
	[Descrip3] [varchar](40) NULL,
	[Descrip4] [varchar](40) NULL,
	[Descrip5] [varchar](40) NULL,
	[Descrip6] [varchar](40) NULL,
	[Descrip7] [varchar](40) NULL,
	[Descrip8] [varchar](40) NULL,
	[Descrip9] [varchar](40) NULL,
	[Descrip10] [varchar](40) NULL,
	[Refere] [varchar](15) NULL,
	[Signo] [smallint] NOT NULL,
	[Tara] [decimal](28, 4) NOT NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[CantidadD] [decimal](28, 4) NOT NULL,
	[CantidadT] [decimal](28, 4) NOT NULL,
	[Cantidad] [decimal](28, 4) NOT NULL,
	[CantidadO] [decimal](28, 4) NOT NULL,
	[ExistAntU] [decimal](28, 4) NOT NULL,
	[ExistAnt] [decimal](28, 4) NOT NULL,
	[ExistAntU2] [decimal](28, 4) NOT NULL,
	[ExistAnt2] [decimal](28, 4) NOT NULL,
	[CantidadC] [decimal](28, 4) NOT NULL,
	[CantidadU] [decimal](28, 4) NOT NULL,
	[CantidadA] [decimal](28, 4) NOT NULL,
	[CantidadUA] [decimal](28, 4) NOT NULL,
	[Costo] [decimal](28, 4) NOT NULL,
	[Descto] [decimal](28, 4) NOT NULL,
	[CodMeca] [varchar](10) NULL,
	[TotalItem] [decimal](28, 4) NOT NULL,
	[NroUnicoL] [int] NOT NULL,
	[NroLote] [varchar](20) NULL,
	[Precio] [decimal](28, 4) NOT NULL,
	[PrecioU] [decimal](28, 4) NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaL] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[EsServ] [smallint] NOT NULL,
	[EsUnid] [smallint] NOT NULL,
	[EsFreeP] [smallint] NOT NULL,
	[EsPesa] [smallint] NOT NULL,
	[EsExento] [smallint] NOT NULL,
	[UsaServ] [smallint] NOT NULL,
	[DEsLote] [smallint] NOT NULL,
	[DEsSeri] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [NroLineaC]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Signo]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Tara]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadD]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadT]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Cantidad]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadO]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [ExistAntU]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [ExistAnt]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [ExistAntU2]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [ExistAnt2]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadC]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadU]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadA]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [CantidadUA]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Costo]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Descto]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [TotalItem]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [NroUnicoL]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [Precio]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [PrecioU]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [EsServ]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [EsUnid]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [EsFreeP]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [EsPesa]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [EsExento]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [UsaServ]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [DEsLote]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT ((0)) FOR [DEsSeri]
GO

ALTER TABLE [dbo].[SAITEMOPI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


