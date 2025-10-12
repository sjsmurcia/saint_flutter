USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBPRXC]    Script Date: 24/08/2025 20:46:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBPRXC](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[Numero] [varchar](25) NOT NULL,
	[Estado] [int] NOT NULL,
	[CodBene] [varchar](30) NULL,
	[Beneficiario] [varchar](60) NULL,
	[Descripcion] [varchar](60) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Fecha] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBPRXC] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBPRXC] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBPRXC] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


