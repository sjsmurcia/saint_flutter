USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAIPACXC]    Script Date: 24/08/2025 13:32:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAIPACXC](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[NroPpal] [int] NOT NULL,
	[CodTarj] [varchar](10) NULL,
	[Descrip] [varchar](40) NULL,
	[NumeroD] [varchar](20) NULL,
	[CodOper] [varchar](10) NULL,
	[TipoPag] [int] NOT NULL,
	[TipoTra] [int] NOT NULL,
	[FechaE] [datetime] NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Impuesto] [decimal](28, 4) NOT NULL,
	[ImpuestoD] [decimal](28, 4) NOT NULL,
	[RetencT] [decimal](28, 4) NOT NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[Refere] [varchar](40) NULL,
	[Terminal] [varchar](10) NULL,
	[NroLote] [varchar](5) NULL,
	[MontoMEx] [decimal](28, 4) NOT NULL,
	[Autoriza] [varchar](20) NULL,
	[Adquiere] [varchar](20) NULL,
	[Afiliado] [varchar](20) NULL,
	[NroTurno] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [NroPpal]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [TipoPag]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [TipoTra]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [Impuesto]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [ImpuestoD]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [RetencT]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [MontoMEx]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT ((0)) FOR [NroTurno]
GO

ALTER TABLE [dbo].[SAIPACXC] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


