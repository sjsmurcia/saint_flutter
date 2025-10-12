USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBOPFR]    Script Date: 24/08/2025 20:46:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBOPFR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodOpFr] [varchar](30) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[CodBene] [varchar](30) NULL,
	[TipoOpe] [int] NOT NULL,
	[FechaPP] [datetime] NULL,
	[Avisar] [int] NOT NULL,
	[Siempre] [int] NOT NULL,
	[NPagos] [int] NOT NULL,
	[Frecuencia] [int] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT ((0)) FOR [Avisar]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT ((0)) FOR [Siempre]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT ((0)) FOR [NPagos]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT ((0)) FOR [Frecuencia]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBOPFR] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


