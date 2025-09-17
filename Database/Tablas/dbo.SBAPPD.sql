USE [admin]
GO

/****** Object:  Table [dbo].[SBAPPD]    Script Date: 24/08/2025 20:36:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBAPPD](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[NroPpal] [int] NOT NULL,
	[CodBanc] [varchar](30) NULL,
	[Documento] [varchar](15) NULL,
	[RIF] [varchar](20) NULL,
	[Descripcion] [varchar](70) NULL,
	[DescripPago] [varchar](70) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[NumeroD] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBAPPD] ADD  DEFAULT ((0)) FOR [NroPpal]
GO

ALTER TABLE [dbo].[SBAPPD] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBAPPD] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


