USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAANULAC]    Script Date: 24/08/2025 9:48:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAANULAC](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [int] NOT NULL,
	[NroEstable] [varchar](10) NULL,
	[PtoEmision] [varchar](10) NULL,
	[AutSRI] [varchar](80) NULL,
	[NroInicio] [int] NOT NULL,
	[NroFinal] [int] NOT NULL,
	[FechaE] [datetime] NULL,
	[FechaL] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAANULAC] ADD  DEFAULT ((0)) FOR [Tipo]
GO

ALTER TABLE [dbo].[SAANULAC] ADD  DEFAULT ((0)) FOR [NroInicio]
GO

ALTER TABLE [dbo].[SAANULAC] ADD  DEFAULT ((0)) FOR [NroFinal]
GO

ALTER TABLE [dbo].[SAANULAC] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


