USE [admin]
GO

/****** Object:  Table [dbo].[SAIPRD]    Script Date: 24/08/2025 13:34:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAIPRD](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodProd] [varchar](15) NOT NULL,
	[TipoReg] [int] NOT NULL,
	[ItemName] [varchar](30) NULL,
	[FolderName] [varchar](60) NULL,
	[Imagen] [image] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAIPRD] ADD  DEFAULT ((0)) FOR [TipoReg]
GO

ALTER TABLE [dbo].[SAIPRD] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


