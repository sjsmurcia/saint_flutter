USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAVEND]    Script Date: 24/08/2025 20:36:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAVEND](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodVend] [varchar](10) NOT NULL,
	[Descrip] [varchar](60) NULL,
	[TipoID3] [smallint] NOT NULL,
	[TipoID] [smallint] NOT NULL,
	[ID3] [varchar](25) NULL,
	[DescOrder] [varchar](10) NULL,
	[Clase] [varchar](10) NULL,
	[Direc1] [varchar](60) NULL,
	[Direc2] [varchar](60) NULL,
	[Telef] [varchar](30) NULL,
	[Movil] [varchar](15) NULL,
	[Email] [varchar](60) NULL,
	[FechaUV] [datetime] NULL,
	[FechaUC] [datetime] NULL,
	[EsComiPV] [smallint] NOT NULL,
	[EsComiTV] [smallint] NOT NULL,
	[EsComiTC] [smallint] NOT NULL,
	[EsComiTU] [smallint] NOT NULL,
	[EsComiDT] [smallint] NOT NULL,
	[EsComiUT] [smallint] NOT NULL,
	[EsComiTM] [smallint] NOT NULL,
	[Activo] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [TipoID3]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [TipoID]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiPV]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiTV]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiTC]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiTU]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiDT]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiUT]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [EsComiTM]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SAVEND] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


