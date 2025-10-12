USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBBENE]    Script Date: 24/08/2025 20:38:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBBENE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBene] [varchar](30) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[IOE] [varchar](1) NULL,
	[Pais] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Ciudad] [int] NOT NULL,
	[Municipio] [int] NOT NULL,
	[ZipCode] [varchar](20) NULL,
	[ECG] [int] NOT NULL,
	[Direccion1] [varchar](40) NULL,
	[Direccion2] [varchar](40) NULL,
	[Telefonos] [varchar](30) NULL,
	[Movil] [varchar](15) NULL,
	[Fax] [varchar](25) NULL,
	[Email] [varchar](25) NULL,
	[Memo] [text] NULL,
	[CodCta] [varchar](30) NULL,
	[Concepto1] [varchar](60) NULL,
	[Concepto2] [varchar](60) NULL,
	[Concepto3] [varchar](60) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[Coment1] [varchar](40) NULL,
	[Coment2] [varchar](40) NULL,
	[Coment3] [varchar](40) NULL,
	[FechaI] [datetime] NULL,
	[UFecha] [datetime] NULL,
	[UDcto] [varchar](25) NULL,
	[UBanco] [varchar](30) NULL,
	[UBenef] [varchar](50) NULL,
	[UComent1] [varchar](50) NULL,
	[UComent2] [varchar](50) NULL,
	[UMonto] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [Pais]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [Ciudad]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [Municipio]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [ECG]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT ((0)) FOR [UMonto]
GO

ALTER TABLE [dbo].[SBBENE] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


