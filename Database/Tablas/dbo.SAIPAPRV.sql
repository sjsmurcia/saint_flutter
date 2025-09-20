USE [admin]
GO

/****** Object:  Table [dbo].[SAIPAPRV]    Script Date: 24/08/2025 13:33:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAIPAPRV](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[CodTarj] [varchar](10) NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[EsPorct] [smallint] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAIPAPRV] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SAIPAPRV] ADD  DEFAULT ((0)) FOR [EsPorct]
GO

ALTER TABLE [dbo].[SAIPAPRV] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


