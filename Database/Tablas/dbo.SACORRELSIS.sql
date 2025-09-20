USE [admin]
GO

/****** Object:  Table [dbo].[SACORRELSIS]    Script Date: 24/08/2025 9:54:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SACORRELSIS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[FieldName] [varchar](20) NOT NULL,
	[CodEsta] [varchar](10) NULL,
	[Prefijo] [varchar](15) NULL,
	[ValueInt] [int] NOT NULL,
	[Desde] [int] NOT NULL,
	[Hasta] [int] NOT NULL,
	[LenCorrel] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SACORRELSIS] ADD  DEFAULT ((0)) FOR [ValueInt]
GO

ALTER TABLE [dbo].[SACORRELSIS] ADD  DEFAULT ((0)) FOR [Desde]
GO

ALTER TABLE [dbo].[SACORRELSIS] ADD  DEFAULT ((0)) FOR [Hasta]
GO

ALTER TABLE [dbo].[SACORRELSIS] ADD  DEFAULT ((0)) FOR [LenCorrel]
GO

ALTER TABLE [dbo].[SACORRELSIS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


