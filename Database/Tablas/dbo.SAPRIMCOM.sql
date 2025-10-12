USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAPRIMCOM]    Script Date: 24/08/2025 20:12:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPRIMCOM](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[TipoCom] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[NroLineaC] [int] NOT NULL,
	[DocImpo] [varchar](20) NULL,
	[CodItem] [varchar](15) NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[Moneda] [varchar](10) NULL,
	[FechaI] [datetime] NULL,
	[PrecioU] [decimal](28, 4) NOT NULL,
	[Precio1] [decimal](28, 4) NOT NULL,
	[PrecioI1] [decimal](28, 4) NOT NULL,
	[Precio2] [decimal](28, 4) NOT NULL,
	[PrecioI2] [decimal](28, 4) NOT NULL,
	[PrecioU2] [decimal](28, 4) NOT NULL,
	[Precio3] [decimal](28, 4) NOT NULL,
	[PrecioI3] [decimal](28, 4) NOT NULL,
	[PrecioU3] [decimal](28, 4) NOT NULL,
	[Costo1] [decimal](28, 4) NOT NULL,
	[Costo2] [decimal](28, 4) NOT NULL,
	[Costo3] [decimal](28, 4) NOT NULL,
	[Costo4] [decimal](28, 4) NOT NULL,
	[Costo5] [decimal](28, 4) NOT NULL,
	[Costo6] [decimal](28, 4) NOT NULL,
	[Costo7] [decimal](28, 4) NOT NULL,
	[Costo8] [decimal](28, 4) NOT NULL,
	[Costo9] [decimal](28, 4) NOT NULL,
	[Costo10] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [NroLineaC]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [PrecioU]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Precio1]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [PrecioI1]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Precio2]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [PrecioI2]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [PrecioU2]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Precio3]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [PrecioI3]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [PrecioU3]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo1]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo2]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo3]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo4]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo5]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo6]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo7]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo8]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo9]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT ((0)) FOR [Costo10]
GO

ALTER TABLE [dbo].[SAPRIMCOM] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


