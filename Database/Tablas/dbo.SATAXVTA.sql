USE [SAINTA]
GO

/****** Object:  Table [dbo].[SATAXVTA]    Script Date: 24/08/2025 20:34:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SATAXVTA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[TipoFac] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[CodTaxs] [varchar](10) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[TGravable] [decimal](28, 4) NOT NULL,
	[EsReten] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SATAXVTA] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SATAXVTA] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SATAXVTA] ADD  DEFAULT ((0)) FOR [TGravable]
GO

ALTER TABLE [dbo].[SATAXVTA] ADD  DEFAULT ((0)) FOR [EsReten]
GO

ALTER TABLE [dbo].[SATAXVTA] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


