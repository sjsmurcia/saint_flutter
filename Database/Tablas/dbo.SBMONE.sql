USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBMONE]    Script Date: 24/08/2025 20:44:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBMONE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodMone] [varchar](5) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[Pais] [varchar](25) NULL,
	[Factor] [decimal](28, 4) NOT NULL,
	[EsBase] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBMONE] ADD  DEFAULT ((0)) FOR [Factor]
GO

ALTER TABLE [dbo].[SBMONE] ADD  DEFAULT ((0)) FOR [EsBase]
GO

ALTER TABLE [dbo].[SBMONE] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


