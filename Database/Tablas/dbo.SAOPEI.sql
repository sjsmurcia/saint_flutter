USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAOPEI]    Script Date: 24/08/2025 20:02:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAOPEI](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[TipoOpI] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[CodEsta] [varchar](10) NULL,
	[CodUsua] [varchar](10) NULL,
	[CodUbic] [varchar](10) NULL,
	[CodUbic2] [varchar](10) NULL,
	[Signo] [smallint] NOT NULL,
	[FechaT] [datetime] NULL,
	[OTipo] [varchar](1) NULL,
	[ONumero] [varchar](20) NULL,
	[Autori] [varchar](40) NULL,
	[Respon] [varchar](40) NULL,
	[UsoMat] [varchar](40) NULL,
	[OrdenC] [varchar](30) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[CodOper] [varchar](10) NULL,
	[UsoInterno] [smallint] NOT NULL,
	[CodClie] [varchar](15) NULL,
	[NroTurno] [int] NOT NULL,
	[Notas1] [varchar](60) NULL,
	[Notas2] [varchar](60) NULL,
	[Notas3] [varchar](60) NULL,
	[Notas4] [varchar](60) NULL,
	[Notas5] [varchar](60) NULL,
	[Notas6] [varchar](60) NULL,
	[Notas7] [varchar](60) NULL,
	[Notas8] [varchar](60) NULL,
	[Notas9] [varchar](60) NULL,
	[Notas10] [varchar](60) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAOPEI] ADD  DEFAULT ((0)) FOR [Signo]
GO

ALTER TABLE [dbo].[SAOPEI] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAOPEI] ADD  DEFAULT ((0)) FOR [UsoInterno]
GO

ALTER TABLE [dbo].[SAOPEI] ADD  DEFAULT ((0)) FOR [NroTurno]
GO

ALTER TABLE [dbo].[SAOPEI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


