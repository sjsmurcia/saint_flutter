USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAOPER]    Script Date: 24/08/2025 20:08:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAOPER](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodOper] [varchar](10) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[Clase] [varchar](10) NULL,
	[TipoOpe] [int] NOT NULL,
	[Rango] [varchar](80) NULL,
	[Activo] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAOPER] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SAOPER] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SAOPER] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


