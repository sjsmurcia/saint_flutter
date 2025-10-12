USE [SAINTA]
GO

/****** Object:  Table [dbo].[SSAUTR]    Script Date: 24/08/2025 20:48:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSAUTR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodAutr] [varchar](15) NOT NULL,
	[Modulo] [int] NOT NULL,
	[Parametro] [int] NOT NULL,
	[Autoriza] [varchar](15) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SSAUTR] ADD  DEFAULT ((0)) FOR [Modulo]
GO

ALTER TABLE [dbo].[SSAUTR] ADD  DEFAULT ((0)) FOR [Parametro]
GO

ALTER TABLE [dbo].[SSAUTR] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


