USE [SAINTA]
GO

/****** Object:  Table [dbo].[STIB02]    Script Date: 24/08/2025 20:52:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STIB02](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NOpe] [int] NOT NULL,
	[CodCta] [varchar](50) NULL,
	[DesCta] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[MtoOp] [decimal](28, 4) NOT NULL,
	[MtoDb] [decimal](28, 4) NOT NULL,
	[MtoCr] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[STIB02] ADD  DEFAULT ((0)) FOR [NOpe]
GO

ALTER TABLE [dbo].[STIB02] ADD  DEFAULT ((0)) FOR [MtoOp]
GO

ALTER TABLE [dbo].[STIB02] ADD  DEFAULT ((0)) FOR [MtoDb]
GO

ALTER TABLE [dbo].[STIB02] ADD  DEFAULT ((0)) FOR [MtoCr]
GO

ALTER TABLE [dbo].[STIB02] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


