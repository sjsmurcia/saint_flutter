USE [admin]
GO

/****** Object:  Table [dbo].[SAPRSRI]    Script Date: 24/08/2025 20:14:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPRSRI](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroEstable] [varchar](10) NOT NULL,
	[PtoEmision] [varchar](10) NOT NULL,
	[FechaV] [date] NULL,
	[NroInicio] [int] NOT NULL,
	[NroFinal] [int] NOT NULL,
	[AutSRI] [varchar](80) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPRSRI] ADD  DEFAULT ((0)) FOR [NroInicio]
GO

ALTER TABLE [dbo].[SAPRSRI] ADD  DEFAULT ((0)) FOR [NroFinal]
GO

ALTER TABLE [dbo].[SAPRSRI] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


