USE [admin]
GO

/****** Object:  Table [dbo].[SSPARD]    Script Date: 24/08/2025 20:50:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSPARD](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodParm] [varchar](15) NOT NULL,
	[Modulo] [int] NOT NULL,
	[Parametro] [int] NOT NULL,
	[NoData] [int] NOT NULL,
	[TipoData] [int] NOT NULL,
	[IData] [int] NOT NULL,
	[SData] [varchar](50) NULL,
	[FData] [decimal](28, 4) NOT NULL,
	[SSFld] [varchar](35) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT ((0)) FOR [Modulo]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT ((0)) FOR [Parametro]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT ((0)) FOR [NoData]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT ((0)) FOR [TipoData]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT ((0)) FOR [IData]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT ((0)) FOR [FData]
GO

ALTER TABLE [dbo].[SSPARD] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


