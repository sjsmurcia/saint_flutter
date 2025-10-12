USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBCTAP]    Script Date: 24/08/2025 20:39:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBCTAP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ID3] [varchar](20) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[Descripcion] [varchar](70) NOT NULL,
	[NroCuenta] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBCTAP] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


