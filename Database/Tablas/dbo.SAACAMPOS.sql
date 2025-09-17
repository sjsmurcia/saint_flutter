USE [admin]
GO

/****** Object:  Table [dbo].[SAACAMPOS]    Script Date: 24/08/2025 9:02:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAACAMPOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodTbl] [varchar](20) NOT NULL,
	[NumGrp] [int] NOT NULL,
	[NombCpo] [varchar](40) NOT NULL,
	[AliasCpo] [varchar](40) NOT NULL,
	[TipoCpo] [int] NOT NULL,
	[Longitud] [int] NOT NULL,
	[Requerido] [smallint] NOT NULL,
	[CBusqueda] [smallint] NOT NULL,
	[Value] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAACAMPOS] ADD  DEFAULT ((0)) FOR [NumGrp]
GO

ALTER TABLE [dbo].[SAACAMPOS] ADD  DEFAULT ((0)) FOR [TipoCpo]
GO

ALTER TABLE [dbo].[SAACAMPOS] ADD  DEFAULT ((0)) FOR [Longitud]
GO

ALTER TABLE [dbo].[SAACAMPOS] ADD  DEFAULT ((0)) FOR [Requerido]
GO

ALTER TABLE [dbo].[SAACAMPOS] ADD  DEFAULT ((0)) FOR [CBusqueda]
GO

ALTER TABLE [dbo].[SAACAMPOS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


