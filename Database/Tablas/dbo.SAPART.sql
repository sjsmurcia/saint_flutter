USE [admin]
GO

/****** Object:  Table [dbo].[SAPART]    Script Date: 24/08/2025 20:10:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPART](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodProd] [varchar](15) NOT NULL,
	[CodAlte] [varchar](15) NULL,
	[Cantidad] [decimal](28, 4) NOT NULL,
	[EsFijo] [int] NOT NULL,
	[EsUnid] [int] NOT NULL,
	[EsServ] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPART] ADD  DEFAULT ((0)) FOR [Cantidad]
GO

ALTER TABLE [dbo].[SAPART] ADD  DEFAULT ((0)) FOR [EsFijo]
GO

ALTER TABLE [dbo].[SAPART] ADD  DEFAULT ((0)) FOR [EsUnid]
GO

ALTER TABLE [dbo].[SAPART] ADD  DEFAULT ((0)) FOR [EsServ]
GO

ALTER TABLE [dbo].[SAPART] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


