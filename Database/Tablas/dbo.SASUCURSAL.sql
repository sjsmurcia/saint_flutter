USE [SAINTA]
GO

/****** Object:  Table [dbo].[SASUCURSAL]    Script Date: 24/08/2025 20:30:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SASUCURSAL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[Descrip] [varchar](80) NULL,
	[Direc1] [varchar](80) NULL,
	[Direc2] [varchar](80) NULL,
	[Telef] [varchar](40) NULL,
	[ZipCode] [varchar](20) NULL,
	[Municipio] [int] NOT NULL,
	[Ciudad] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Pais] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SASUCURSAL] ADD  DEFAULT ((0)) FOR [Municipio]
GO

ALTER TABLE [dbo].[SASUCURSAL] ADD  DEFAULT ((0)) FOR [Ciudad]
GO

ALTER TABLE [dbo].[SASUCURSAL] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SASUCURSAL] ADD  DEFAULT ((0)) FOR [Pais]
GO

ALTER TABLE [dbo].[SASUCURSAL] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


