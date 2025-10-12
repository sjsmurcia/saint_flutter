USE [SAINTA]
GO

/****** Object:  Table [dbo].[SASEPROPI]    Script Date: 24/08/2025 20:28:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SASEPROPI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[TipoOpI] [varchar](1) NOT NULL,
	[NumeroD] [varchar](20) NOT NULL,
	[NroSerial] [varchar](40) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[NroLineaC] [int] NOT NULL,
	[CodItem] [varchar](15) NULL,
	[CodUbic] [varchar](10) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SASEPROPI] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SASEPROPI] ADD  DEFAULT ((0)) FOR [NroLineaC]
GO

ALTER TABLE [dbo].[SASEPROPI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


