USE [admin]
GO

/****** Object:  Table [dbo].[SACORTEZ]    Script Date: 24/08/2025 9:55:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SACORTEZ](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[NroTurno] [int] NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodEsta] [varchar](10) NOT NULL,
	[CodUsua] [varchar](10) NULL,
	[NumeroP] [varchar](15) NULL,
	[NumeroC] [varchar](10) NULL,
	[NumeroZ] [varchar](10) NULL,
	[MtoTotal] [decimal](28, 4) NOT NULL,
	[NumeroF] [varchar](10) NULL,
	[NroFacts] [int] NOT NULL,
	[NroDevol] [int] NOT NULL,
	[NumeroR] [varchar](10) NULL,
	[TExento] [decimal](28, 4) NOT NULL,
	[MtoTax] [decimal](28, 4) NOT NULL,
	[MtoTotal1] [decimal](28, 4) NOT NULL,
	[MtoTax1] [decimal](28, 4) NOT NULL,
	[MtoTotal2] [decimal](28, 4) NOT NULL,
	[MtoTax2] [decimal](28, 4) NOT NULL,
	[MtoTotal3] [decimal](28, 4) NOT NULL,
	[MtoTax3] [decimal](28, 4) NOT NULL,
	[TDevExento] [decimal](28, 4) NOT NULL,
	[DevMtoTotal1] [decimal](28, 4) NOT NULL,
	[DevMtoTax1] [decimal](28, 4) NOT NULL,
	[DevMtoTotal2] [decimal](28, 4) NOT NULL,
	[DevMtoTax2] [decimal](28, 4) NOT NULL,
	[DevMtoTotal3] [decimal](28, 4) NOT NULL,
	[DevMtoTax3] [decimal](28, 4) NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaUC] [datetime] NULL,
	[NumeroT] [int] NOT NULL,
	[Estado] [varchar](15) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [NroTurno]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTotal]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [NroFacts]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [NroDevol]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [TExento]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTax]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTotal1]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTax1]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTotal2]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTax2]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTotal3]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [MtoTax3]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [TDevExento]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [DevMtoTotal1]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [DevMtoTax1]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [DevMtoTotal2]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [DevMtoTax2]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [DevMtoTotal3]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [DevMtoTax3]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT ((0)) FOR [NumeroT]
GO

ALTER TABLE [dbo].[SACORTEZ] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


