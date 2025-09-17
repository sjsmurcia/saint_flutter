USE [admin]
GO

/****** Object:  Table [dbo].[SAINITI]    Script Date: 24/08/2025 13:31:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAINITI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodProd] [varchar](15) NOT NULL,
	[CodUbic] [varchar](10) NOT NULL,
	[Periodo] [varchar](6) NOT NULL,
	[Costo] [decimal](28, 4) NOT NULL,
	[ExInicial] [decimal](28, 4) NOT NULL,
	[ExUndIni] [decimal](28, 4) NOT NULL,
	[ExFinal] [decimal](28, 4) NOT NULL,
	[ExUndFinal] [decimal](28, 4) NOT NULL,
	[CostoFinal] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT ((0)) FOR [Costo]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT ((0)) FOR [ExInicial]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT ((0)) FOR [ExUndIni]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT ((0)) FOR [ExFinal]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT ((0)) FOR [ExUndFinal]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT ((0)) FOR [CostoFinal]
GO

ALTER TABLE [dbo].[SAINITI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


