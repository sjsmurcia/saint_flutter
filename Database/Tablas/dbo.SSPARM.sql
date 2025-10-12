USE [SAINTA]
GO

/****** Object:  Table [dbo].[SSPARM]    Script Date: 24/08/2025 20:51:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSPARM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodParm] [varchar](15) NOT NULL,
	[Modulo] [int] NOT NULL,
	[Parametro] [int] NOT NULL,
	[Activo] [int] NOT NULL,
	[Clave] [int] NOT NULL,
	[Habilitado] [int] NOT NULL,
	[SSFld] [varchar](35) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SSPARM] ADD  DEFAULT ((0)) FOR [Modulo]
GO

ALTER TABLE [dbo].[SSPARM] ADD  DEFAULT ((0)) FOR [Parametro]
GO

ALTER TABLE [dbo].[SSPARM] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SSPARM] ADD  DEFAULT ((0)) FOR [Clave]
GO

ALTER TABLE [dbo].[SSPARM] ADD  DEFAULT ((0)) FOR [Habilitado]
GO

ALTER TABLE [dbo].[SSPARM] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


