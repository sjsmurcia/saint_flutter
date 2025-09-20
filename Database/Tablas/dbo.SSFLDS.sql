USE [admin]
GO

/****** Object:  Table [dbo].[SSFLDS]    Script Date: 24/08/2025 20:49:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSFLDS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodNivl] [varchar](15) NOT NULL,
	[Tabla] [varchar](60) NOT NULL,
	[NCampo] [int] NOT NULL,
	[Descrip] [varchar](70) NULL,
	[Activo] [int] NOT NULL,
	[Editable] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SSFLDS] ADD  DEFAULT ((0)) FOR [NCampo]
GO

ALTER TABLE [dbo].[SSFLDS] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SSFLDS] ADD  DEFAULT ((0)) FOR [Editable]
GO

ALTER TABLE [dbo].[SSFLDS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


