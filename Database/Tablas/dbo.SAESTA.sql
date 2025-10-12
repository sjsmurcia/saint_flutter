USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAESTA]    Script Date: 24/08/2025 9:58:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAESTA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodEsta] [varchar](10) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[CodUsua] [varchar](10) NOT NULL,
	[Descrip] [varchar](50) NOT NULL,
	[PtoEmision] [varchar](10) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAESTA] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


