USE [admin]
GO

/****** Object:  Table [dbo].[SAITEMPLANI]    Script Date: 24/08/2025 13:38:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAITEMPLANI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[NroRegi] [int] NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[TipoCxc] [varchar](2) NULL,
	[NumeroC] [varchar](20) NOT NULL,
	[Document] [varchar](40) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Saldo] [decimal](28, 4) NOT NULL,
	[CancelI] [decimal](28, 4) NOT NULL,
	[CancelA] [decimal](28, 4) NOT NULL,
	[CancelE] [decimal](28, 4) NOT NULL,
	[CancelC] [decimal](28, 4) NOT NULL,
	[CancelT] [decimal](28, 4) NOT NULL,
	[CancelG] [decimal](28, 4) NOT NULL,
	[Comision] [decimal](28, 4) NOT NULL,
	[DetalChq] [varchar](40) NULL,
	[PrxVisita] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [NroRegi]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [Saldo]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [CancelI]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [CancelA]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [CancelE]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [CancelC]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [CancelT]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [CancelG]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT ((0)) FOR [Comision]
GO

ALTER TABLE [dbo].[SAITEMPLANI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


