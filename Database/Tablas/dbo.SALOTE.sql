USE [admin]
GO

/****** Object:  Table [dbo].[SALOTE]    Script Date: 24/08/2025 13:40:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALOTE](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodProd] [varchar](15) NOT NULL,
	[CodUbic] [varchar](10) NULL,
	[NroLote] [varchar](20) NULL,
	[PuestoI] [varchar](10) NULL,
	[Costo] [decimal](28, 4) NOT NULL,
	[Precio1] [decimal](28, 4) NOT NULL,
	[PrecioI1] [decimal](28, 4) NOT NULL,
	[PrecioU1] [decimal](28, 4) NOT NULL,
	[PrecioUI1] [decimal](28, 4) NOT NULL,
	[Precio2] [decimal](28, 4) NOT NULL,
	[PrecioI2] [decimal](28, 4) NOT NULL,
	[PrecioU2] [decimal](28, 4) NOT NULL,
	[PrecioUI2] [decimal](28, 4) NOT NULL,
	[Precio3] [decimal](28, 4) NOT NULL,
	[PrecioI3] [decimal](28, 4) NOT NULL,
	[PrecioU3] [decimal](28, 4) NOT NULL,
	[PrecioUI3] [decimal](28, 4) NOT NULL,
	[Cantidad] [decimal](28, 4) NOT NULL,
	[CantidadU] [decimal](28, 4) NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [Costo]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [Precio1]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioI1]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioU1]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioUI1]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [Precio2]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioI2]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioU2]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioUI2]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [Precio3]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioI3]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioU3]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [PrecioUI3]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [Cantidad]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT ((0)) FOR [CantidadU]
GO

ALTER TABLE [dbo].[SALOTE] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


