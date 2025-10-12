USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBTRTR]    Script Date: 24/08/2025 20:48:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBTRTR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[AOD] [varchar](1) NOT NULL,
	[NOpe] [int] NOT NULL,
	[NoConc] [int] NOT NULL,
	[CRefer] [varchar](35) NULL,
	[CodUsua] [varchar](30) NULL,
	[FechaLib] [datetime] NULL,
	[CodBene] [varchar](30) NULL,
	[TDC] [int] NOT NULL,
	[CDCD] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Documento] [varchar](25) NULL,
	[Comentario1] [varchar](60) NULL,
	[Comentario2] [varchar](50) NULL,
	[Comentario3] [varchar](50) NULL,
	[OBCP] [varchar](1) NULL,
	[Origen] [varchar](35) NULL,
	[Estado] [int] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[Monto1] [decimal](28, 4) NOT NULL,
	[Monto2] [decimal](28, 4) NOT NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [NOpe]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [NoConc]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [TDC]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [CDCD]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [Monto1]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [Monto2]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SBTRTR] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


