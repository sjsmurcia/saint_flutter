USE [admin]
GO

/****** Object:  Table [dbo].[SAINSTA]    Script Date: 24/08/2025 13:31:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAINSTA](
	[CodInst] [int] IDENTITY(1,1) NOT NULL,
	[InsPadre] [int] NOT NULL,
	[Nivel] [int] NOT NULL,
	[TipoIns] [smallint] NOT NULL,
	[Descrip] [varchar](40) NOT NULL,
	[Descto] [decimal](28, 4) NOT NULL,
	[DEsComp] [smallint] NOT NULL,
	[DEsSeri] [smallint] NOT NULL,
	[DEsLote] [smallint] NOT NULL,
	[DEsComi] [smallint] NOT NULL,
	[DEsCorrel] [smallint] NOT NULL,
	[DigitosC] [smallint] NOT NULL,
	[DEsTabla] [smallint] NOT NULL,
	[CodAlte] [varchar](15) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodInst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [InsPadre]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [Nivel]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [TipoIns]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [Descto]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DEsComp]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DEsSeri]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DEsLote]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DEsComi]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DEsCorrel]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DigitosC]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT ((0)) FOR [DEsTabla]
GO

ALTER TABLE [dbo].[SAINSTA] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


