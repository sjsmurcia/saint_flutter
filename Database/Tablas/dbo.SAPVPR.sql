USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAPVPR]    Script Date: 24/08/2025 20:25:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPVPR](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodItem] [varchar](15) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[Refere] [varchar](15) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPVPR] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


