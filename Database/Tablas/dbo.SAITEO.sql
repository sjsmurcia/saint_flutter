USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAITEO]    Script Date: 24/08/2025 13:38:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAITEO](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[NumeroD] [varchar](10) NOT NULL,
	[CodItem] [varchar](15) NOT NULL,
	[TipoOfe] [smallint] NOT NULL,
	[Medida] [smallint] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[PrecioI] [decimal](28, 4) NOT NULL,
	[Comision] [decimal](28, 4) NOT NULL,
	[Desde] [decimal](28, 4) NOT NULL,
	[Hasta] [decimal](28, 4) NOT NULL,
	[EsUnid] [smallint] NOT NULL,
	[TipoAtr] [smallint] NOT NULL,
	[CodAlte] [varchar](15) NULL,
	[CantidadO] [decimal](28, 4) NOT NULL,
	[TipoTra] [smallint] NOT NULL,
	[TipoData] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [TipoOfe]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [Medida]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [PrecioI]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [Comision]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [Desde]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [Hasta]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [EsUnid]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [TipoAtr]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [CantidadO]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [TipoTra]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT ((0)) FOR [TipoData]
GO

ALTER TABLE [dbo].[SAITEO] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


