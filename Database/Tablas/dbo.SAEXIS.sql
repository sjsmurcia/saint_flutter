USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAEXIS]    Script Date: 24/08/2025 13:16:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAEXIS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodProd] [varchar](15) NOT NULL,
	[CodUbic] [varchar](10) NOT NULL,
	[PuestoI] [varchar](10) NULL,
	[Existen] [decimal](28, 4) NOT NULL,
	[ExUnidad] [decimal](28, 4) NOT NULL,
	[CantPed] [decimal](28, 4) NOT NULL,
	[UnidPed] [decimal](28, 4) NOT NULL,
	[CantCom] [decimal](28, 4) NOT NULL,
	[UnidCom] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT ((0)) FOR [Existen]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT ((0)) FOR [ExUnidad]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT ((0)) FOR [CantPed]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT ((0)) FOR [UnidPed]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT ((0)) FOR [CantCom]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT ((0)) FOR [UnidCom]
GO

ALTER TABLE [dbo].[SAEXIS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


