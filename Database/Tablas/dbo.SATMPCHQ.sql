USE [admin]
GO

/****** Object:  Table [dbo].[SATMPCHQ]    Script Date: 24/08/2025 20:35:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SATMPCHQ](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Descrip] [varchar](100) NULL,
	[FechaE] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SATMPCHQ] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SATMPCHQ] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


