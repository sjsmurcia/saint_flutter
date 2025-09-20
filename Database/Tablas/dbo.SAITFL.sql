USE [admin]
GO

/****** Object:  Table [dbo].[SAITFL]    Script Date: 24/08/2025 13:39:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAITFL](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodFacL] [varchar](10) NOT NULL,
	[EsServ] [smallint] NOT NULL,
	[EsUnid] [smallint] NOT NULL,
	[CodItem] [varchar](15) NOT NULL,
	[Cantidad] [decimal](28, 4) NOT NULL,
	[Precio] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAITFL] ADD  DEFAULT ((0)) FOR [EsServ]
GO

ALTER TABLE [dbo].[SAITFL] ADD  DEFAULT ((0)) FOR [EsUnid]
GO

ALTER TABLE [dbo].[SAITFL] ADD  DEFAULT ((0)) FOR [Cantidad]
GO

ALTER TABLE [dbo].[SAITFL] ADD  DEFAULT ((0)) FOR [Precio]
GO

ALTER TABLE [dbo].[SAITFL] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


