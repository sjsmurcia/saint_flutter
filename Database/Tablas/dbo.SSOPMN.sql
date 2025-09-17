USE [admin]
GO

/****** Object:  Table [dbo].[SSOPMN]    Script Date: 24/08/2025 20:50:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSOPMN](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodMenu] [varchar](15) NOT NULL,
	[CodOpMn] [varchar](13) NOT NULL,
	[Nivel] [int] NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[Accion] [int] NOT NULL,
	[OpActiva] [int] NOT NULL,
	[UPrinter] [int] NOT NULL,
	[SSFld] [varchar](35) NULL,
	[RptUbi] [int] NOT NULL,
	[RptNombre] [varchar](130) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SSOPMN] ADD  DEFAULT ((0)) FOR [Nivel]
GO

ALTER TABLE [dbo].[SSOPMN] ADD  DEFAULT ((0)) FOR [Accion]
GO

ALTER TABLE [dbo].[SSOPMN] ADD  DEFAULT ((0)) FOR [OpActiva]
GO

ALTER TABLE [dbo].[SSOPMN] ADD  DEFAULT ((0)) FOR [UPrinter]
GO

ALTER TABLE [dbo].[SSOPMN] ADD  DEFAULT ((0)) FOR [RptUbi]
GO

ALTER TABLE [dbo].[SSOPMN] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


