USE [admin]
GO

/****** Object:  Table [dbo].[SBFDCDET]    Script Date: 24/08/2025 20:42:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBFDCDET](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[NLinea] [int] NOT NULL,
	[TipoOpe] [int] NOT NULL,
	[CodCta] [varchar](30) NOT NULL,
	[Descripcion] [varchar](70) NOT NULL,
	[TDC] [int] NOT NULL,
	[ReqBan] [text] NOT NULL,
	[ReqCts] [text] NOT NULL,
	[ReqOpe] [text] NOT NULL,
	[StCDCD] [varchar](10) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBFDCDET] ADD  DEFAULT ((0)) FOR [NLinea]
GO

ALTER TABLE [dbo].[SBFDCDET] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SBFDCDET] ADD  DEFAULT ((0)) FOR [TDC]
GO

ALTER TABLE [dbo].[SBFDCDET] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


