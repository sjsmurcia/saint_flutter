USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAPLANI]    Script Date: 24/08/2025 20:10:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPLANI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[CodClie] [varchar](15) NOT NULL,
	[NroPpal] [int] NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaV] [datetime] NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodEsta] [varchar](10) NULL,
	[CodUsua] [varchar](10) NULL,
	[CodOper] [varchar](10) NULL,
	[CodVend] [varchar](10) NULL,
	[Autori] [varchar](40) NULL,
	[Respon] [varchar](40) NULL,
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
	[Monto] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPLANI] ADD  DEFAULT ((0)) FOR [NroPpal]
GO

ALTER TABLE [dbo].[SAPLANI] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAPLANI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


