USE [admin]
GO

/****** Object:  Table [dbo].[SBOPPGOS]    Script Date: 24/08/2025 20:46:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBOPPGOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroOPago] [varchar](15) NOT NULL,
	[NroUCxP] [int] NOT NULL,
	[NroLinea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[SData] [varchar](255) NULL,
	[FData] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBOPPGOS] ADD  DEFAULT ((0)) FOR [NroUCxP]
GO

ALTER TABLE [dbo].[SBOPPGOS] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SBOPPGOS] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBOPPGOS] ADD  DEFAULT ((0)) FOR [FData]
GO

ALTER TABLE [dbo].[SBOPPGOS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


