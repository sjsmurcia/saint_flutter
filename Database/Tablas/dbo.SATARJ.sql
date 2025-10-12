USE [SAINTA]
GO

/****** Object:  Table [dbo].[SATARJ]    Script Date: 24/08/2025 20:31:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SATARJ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodTarj] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[Clase] [varchar](40) NULL,
	[Activo] [smallint] NOT NULL,
	[CodAlte] [varchar](10) NULL,
	[Impuesto] [decimal](28, 4) NOT NULL,
	[DiasDif] [int] NOT NULL,
	[BaseReten] [decimal](28, 4) NOT NULL,
	[RetenIVA] [decimal](28, 4) NOT NULL,
	[TipoIns] [smallint] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[ImpuestoD] [decimal](28, 4) NOT NULL,
	[TipoTra] [smallint] NOT NULL,
	[TipoAtr] [smallint] NOT NULL,
	[TipoPag] [varchar](2) NULL,
	[TipoDef] [smallint] NOT NULL,
	[Minimo] [smallint] NOT NULL,
	[Moneda] [nvarchar](max) NULL,
	[TipoData] [smallint] NOT NULL,
	[Settings] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [Impuesto]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [DiasDif]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [BaseReten]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [RetenIVA]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [TipoIns]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [ImpuestoD]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [TipoTra]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [TipoAtr]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [TipoDef]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [Minimo]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT ((0)) FOR [TipoData]
GO

ALTER TABLE [dbo].[SATARJ] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


