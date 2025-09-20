USE [admin]
GO

/****** Object:  Table [dbo].[SASETTINGS]    Script Date: 24/08/2025 20:29:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SASETTINGS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NOT NULL,
	[FieldName] [varchar](15) NOT NULL,
	[ModuleId] [int] NOT NULL,
	[OptionId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[RegExpr] [varchar](100) NULL,
	[Value] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SASETTINGS] ADD  DEFAULT ((0)) FOR [ModuleId]
GO

ALTER TABLE [dbo].[SASETTINGS] ADD  DEFAULT ((0)) FOR [OptionId]
GO

ALTER TABLE [dbo].[SASETTINGS] ADD  DEFAULT ((0)) FOR [OrderId]
GO

ALTER TABLE [dbo].[SASETTINGS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


