USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBOPDPAG]    Script Date: 24/08/2025 20:45:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBOPDPAG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroOPago] [varchar](15) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[NroUCxP] [int] NOT NULL,
	[TipoCxP] [varchar](5) NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[Document] [varchar](50) NULL,
	[NumeroD] [varchar](15) NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoReten] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT ((0)) FOR [NroUCxP]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT ((0)) FOR [MtoReten]
GO

ALTER TABLE [dbo].[SBOPDPAG] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


