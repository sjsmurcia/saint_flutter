USE [admin]
GO

/****** Object:  Table [dbo].[SSUSRS]    Script Date: 24/08/2025 20:51:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SSUSRS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodUsua] [varchar](10) NOT NULL,
	[Descrip] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Movil] [varchar](15) NULL,
	[Level] [int] NOT NULL,
	[Activo] [smallint] NOT NULL,
	[Password] [varchar](100) NULL,
	[IdUserNot] [int] NOT NULL,
	[Profile] [varchar](50) NULL,
	[CodVend] [varchar](15) NULL,
	[SData1] [varchar](250) NOT NULL,
	[SData2] [varchar](250) NOT NULL,
	[SData3] [varchar](250) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SSUSRS] ADD  DEFAULT ((0)) FOR [Level]
GO

ALTER TABLE [dbo].[SSUSRS] ADD  DEFAULT ((0)) FOR [Activo]
GO

ALTER TABLE [dbo].[SSUSRS] ADD  DEFAULT ((0)) FOR [IdUserNot]
GO

ALTER TABLE [dbo].[SSUSRS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


