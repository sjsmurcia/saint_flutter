USE [admin]
GO

/****** Object:  Table [dbo].[SAMECA]    Script Date: 24/08/2025 13:41:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAMECA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodMeca] [varchar](10) NOT NULL,
	[Descrip] [varchar](60) NULL,
	[TipoID3] [smallint] NOT NULL,
	[TipoID] [smallint] NOT NULL,
	[ID3] [varchar](25) NULL,
	[DescOrder] [varchar](10) NULL,
	[Clase] [varchar](10) NULL,
	[Activo] [smallint] NOT NULL,
	[Direc1] [varchar](60) NULL,
	[Direc2] [varchar](60) NULL,
	[Telef] [varchar](30) NULL,
	[Movil] [varchar](15) NULL,
	[Email] [varchar](60) NULL,
	[DEsComi] [smallint] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[PorctUtil] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT ((0)) FOR [TipoID3]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT ((0)) FOR [TipoID]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT ((0)) FOR [DEsComi]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT ((0)) FOR [PorctUtil]
GO

ALTER TABLE [dbo].[SAMECA] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


