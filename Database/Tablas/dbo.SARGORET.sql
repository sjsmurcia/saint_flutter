USE [admin]
GO

/****** Object:  Table [dbo].[SARGORET]    Script Date: 24/08/2025 20:26:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SARGORET](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodTaxs] [varchar](10) NOT NULL,
	[TipoRgo] [int] NOT NULL,
	[NroUnico] [int] NOT NULL,
	[Desde] [decimal](28, 4) NOT NULL,
	[Hasta] [decimal](28, 4) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SARGORET] ADD  DEFAULT ((0)) FOR [TipoRgo]
GO

ALTER TABLE [dbo].[SARGORET] ADD  DEFAULT ((0)) FOR [NroUnico]
GO

ALTER TABLE [dbo].[SARGORET] ADD  DEFAULT ((0)) FOR [Desde]
GO

ALTER TABLE [dbo].[SARGORET] ADD  DEFAULT ((0)) FOR [Hasta]
GO

ALTER TABLE [dbo].[SARGORET] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SARGORET] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


