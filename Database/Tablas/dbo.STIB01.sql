USE [SAINTA]
GO

/****** Object:  Table [dbo].[STIB01]    Script Date: 24/08/2025 20:51:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STIB01](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NOpe] [int] NOT NULL,
	[CodBanco] [varchar](30) NULL,
	[DesBanco] [varchar](70) NULL,
	[NoCuenta] [varchar](20) NULL,
	[NroDcto] [varchar](25) NULL,
	[NroComp] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[FechaA] [varchar](4) NULL,
	[FechaM] [varchar](4) NULL,
	[FechaD] [varchar](4) NULL,
	[TipBen] [int] NOT NULL,
	[CodBene] [varchar](30) NULL,
	[AOD] [varchar](1) NULL,
	[TDC] [int] NOT NULL,
	[DesTDC] [varchar](50) NULL,
	[CDCD] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Comentario1] [varchar](50) NULL,
	[Comentario2] [varchar](50) NULL,
	[Comentario3] [varchar](50) NULL,
	[MtoOp] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[MtoEfe] [decimal](28, 4) NOT NULL,
	[MtoChe] [decimal](28, 4) NOT NULL,
	[MtoTar] [decimal](28, 4) NOT NULL,
	[MtoTxt1] [varchar](150) NULL,
	[MtoTxt2] [varchar](150) NULL,
	[MtoTxt3] [varchar](150) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [NOpe]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [NroComp]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [TipBen]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [TDC]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [CDCD]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [MtoOp]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [MtoEfe]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [MtoChe]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT ((0)) FOR [MtoTar]
GO

ALTER TABLE [dbo].[STIB01] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


