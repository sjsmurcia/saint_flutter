USE [admin]
GO

/****** Object:  Table [dbo].[SBOPDCTS]    Script Date: 24/08/2025 20:45:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBOPDCTS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroOPago] [varchar](15) NOT NULL,
	[NroLinea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[CodCta] [varchar](30) NULL,
	[Descripcion] [varchar](70) NULL,
	[CodCenCto] [varchar](30) NULL,
	[CodTercero] [varchar](30) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBOPDCTS] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SBOPDCTS] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBOPDCTS] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBOPDCTS] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[SBOPDCTS] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[SBOPDCTS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


