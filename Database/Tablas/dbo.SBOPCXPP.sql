USE [admin]
GO

/****** Object:  Table [dbo].[SBOPCXPP]    Script Date: 24/08/2025 20:45:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBOPCXPP](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[Estado] [int] NOT NULL,
	[EdoPago] [int] NOT NULL,
	[NroIDOP] [int] NOT NULL,
	[Clase] [varchar](15) NULL,
	[CodBanc] [varchar](30) NULL,
	[FechaE] [datetime] NULL,
	[CodOper] [varchar](15) NULL,
	[CodBene] [varchar](30) NULL,
	[Descripcion] [varchar](60) NULL,
	[NroOPago] [varchar](15) NULL,
	[Documento] [varchar](25) NULL,
	[NroUTrnB] [int] NOT NULL,
	[NumeroD] [varchar](20) NULL,
	[Document] [varchar](40) NULL,
	[NroURecP] [int] NOT NULL,
	[NroURetP] [int] NOT NULL,
	[NroDcts] [int] NOT NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[MtoPagos] [decimal](28, 4) NOT NULL,
	[MtoReten] [decimal](28, 4) NOT NULL,
	[Porcent] [decimal](28, 4) NOT NULL,
	[UsaIDB] [int] NOT NULL,
	[CtaIDB] [varchar](15) NULL,
	[DCtaIDB] [varchar](50) NULL,
	[CenCtoIdb] [varchar](15) NULL,
	[MtoIDB] [decimal](28, 4) NOT NULL,
	[Notas1] [varchar](60) NULL,
	[Notas2] [varchar](60) NULL,
	[Notas3] [varchar](60) NULL,
	[Notas4] [varchar](60) NULL,
	[Notas5] [varchar](60) NULL,
	[Notas6] [varchar](60) NULL,
	[Notas7] [varchar](60) NULL,
	[Notas8] [varchar](60) NULL,
	[Notas9] [varchar](60) NULL,
	[Notas10] [varchar](60) NULL,
	[Comentario1] [varchar](50) NULL,
	[Comentario2] [varchar](50) NULL,
	[Comentario3] [varchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [EdoPago]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [NroIDOP]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [NroUTrnB]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [NroURecP]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [NroURetP]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [NroDcts]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [MtoPagos]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [MtoReten]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [Porcent]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [UsaIDB]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT ((0)) FOR [MtoIDB]
GO

ALTER TABLE [dbo].[SBOPCXPP] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


