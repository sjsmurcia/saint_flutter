USE [SAINTA]
GO

/****** Object:  Table [dbo].[SAFALO]    Script Date: 11/10/2025 13:10:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAFALO](
	[CodFacL] [varchar](10) NOT NULL,
	[Descrip] [varchar](60) NULL,
	[DiasCred] [int] NOT NULL,
	[CodVend] [varchar](10) NULL,
	[CodOper] [varchar](10) NULL,
	[TipoOpe] [smallint] NOT NULL,
	[TipoFac] [smallint] NOT NULL,
	[FechaE] [datetime] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_SAFALO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAFALO] ADD  DEFAULT ((0)) FOR [DiasCred]
GO

ALTER TABLE [dbo].[SAFALO] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SAFALO] ADD  DEFAULT ((0)) FOR [TipoFac]
GO

ALTER TABLE [dbo].[SAFALO] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


