USE [admin]
GO

/****** Object:  Table [dbo].[SAPROD]    Script Date: 24/08/2025 20:13:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPROD](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProd] [varchar](15) NOT NULL,
	[Descrip] [varchar](40) NULL,
	[CodInst] [int] NOT NULL,
	[Activo] [smallint] NOT NULL,
	[Descrip2] [varchar](40) NULL,
	[Descrip3] [varchar](40) NULL,
	[Refere] [varchar](15) NULL,
	[Marca] [varchar](20) NULL,
	[Unidad] [varchar](3) NULL,
	[UndEmpaq] [varchar](3) NULL,
	[CantEmpaq] [decimal](28, 4) NOT NULL,
	[Precio1] [decimal](28, 4) NOT NULL,
	[PrecioI1] [decimal](28, 4) NOT NULL,
	[PrecioIU1] [decimal](28, 4) NOT NULL,
	[Precio2] [decimal](28, 4) NOT NULL,
	[PrecioU2] [decimal](28, 4) NOT NULL,
	[PrecioI2] [decimal](28, 4) NOT NULL,
	[PrecioIU2] [decimal](28, 4) NOT NULL,
	[Precio3] [decimal](28, 4) NOT NULL,
	[PrecioU3] [decimal](28, 4) NOT NULL,
	[PrecioI3] [decimal](28, 4) NOT NULL,
	[PrecioIU3] [decimal](28, 4) NOT NULL,
	[PrecioU] [decimal](28, 4) NOT NULL,
	[CostAct] [decimal](28, 4) NOT NULL,
	[CostPro] [decimal](28, 4) NOT NULL,
	[CostAnt] [decimal](28, 4) NOT NULL,
	[Existen] [decimal](28, 4) NOT NULL,
	[ExUnidad] [decimal](28, 4) NOT NULL,
	[Compro] [decimal](28, 4) NOT NULL,
	[Pedido] [decimal](28, 4) NOT NULL,
	[Minimo] [decimal](28, 4) NOT NULL,
	[Maximo] [decimal](28, 4) NOT NULL,
	[Tara] [decimal](28, 4) NOT NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[DEsComp] [smallint] NOT NULL,
	[DEsComi] [smallint] NOT NULL,
	[DEsSeri] [smallint] NOT NULL,
	[EsReten] [smallint] NOT NULL,
	[DEsLote] [smallint] NOT NULL,
	[DEsVence] [smallint] NOT NULL,
	[EsImport] [smallint] NOT NULL,
	[EsExento] [smallint] NOT NULL,
	[EsEnser] [smallint] NOT NULL,
	[EsOferta] [smallint] NOT NULL,
	[EsPesa] [smallint] NOT NULL,
	[EsEmpaque] [smallint] NOT NULL,
	[ExDecimal] [smallint] NOT NULL,
	[DiasEntr] [int] NOT NULL,
	[FechaUV] [datetime] NULL,
	[FechaUC] [datetime] NULL,
	[DiasTole] [int] NOT NULL,
	[Peso] [decimal](28, 4) NOT NULL,
	[Volumen] [decimal](28, 4) NOT NULL,
	[UndVol] [varchar](3) NULL,
	[PriceEx] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [CodInst]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [CantEmpaq]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Precio1]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioI1]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioIU1]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Precio2]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioU2]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioI2]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioIU2]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Precio3]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioU3]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioI3]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioIU3]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PrecioU]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [CostAct]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [CostPro]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [CostAnt]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Existen]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [ExUnidad]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Compro]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Pedido]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Minimo]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Maximo]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Tara]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DEsComp]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DEsComi]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DEsSeri]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DEsLote]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DEsVence]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsImport]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsExento]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsEnser]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsOferta]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsPesa]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [EsEmpaque]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [ExDecimal]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DiasEntr]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [DiasTole]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Peso]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [Volumen]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT ((0)) FOR [PriceEx]
GO

ALTER TABLE [dbo].[SAPROD] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


