USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBDOPF]    Script Date: 24/08/2025 20:41:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBDOPF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NroUnico] [varchar](15) NOT NULL,
	[CodOpFr] [varchar](30) NOT NULL,
	[CodCta] [varchar](30) NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[CodCenCto] [varchar](30) NULL,
	[CodTercero] [varchar](30) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Monto2] [decimal](28, 4) NOT NULL,
	[Comentario] [varchar](50) NULL,
	[Comentario1] [varchar](50) NULL,
	[Comentario2] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBDOPF] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBDOPF] ADD  DEFAULT ((0)) FOR [Monto2]
GO

ALTER TABLE [dbo].[SBDOPF] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


