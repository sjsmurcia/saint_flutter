USE [admin]
GO

/****** Object:  Table [dbo].[SBFDCREP]    Script Date: 24/08/2025 20:43:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBFDCREP](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[Grupo] [int] NOT NULL,
	[TitGrp] [varchar](70) NOT NULL,
	[TipoOpe] [int] NOT NULL,
	[Titulo] [varchar](70) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBFDCREP] ADD  DEFAULT ((0)) FOR [Grupo]
GO

ALTER TABLE [dbo].[SBFDCREP] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SBFDCREP] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBFDCREP] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[SBFDCREP] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[SBFDCREP] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


