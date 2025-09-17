USE [admin]
GO

/****** Object:  Table [dbo].[SAUSRREP]    Script Date: 24/08/2025 20:35:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAUSRREP](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodMenu] [varchar](15) NULL,
	[SisSnt] [int] NOT NULL,
	[NroRpt] [varchar](70) NOT NULL,
	[Descrip] [varchar](130) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAUSRREP] ADD  DEFAULT ((0)) FOR [SisSnt]
GO

ALTER TABLE [dbo].[SAUSRREP] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


