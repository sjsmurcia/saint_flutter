USE [admin]
GO

/****** Object:  Table [dbo].[SBOPCTAS]    Script Date: 24/08/2025 20:44:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBOPCTAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodProv] [varchar](15) NOT NULL,
	[NroOPago] [varchar](15) NOT NULL,
	[NroILB] [int] NOT NULL,
	[NroLinea] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[SData] [varchar](255) NULL,
	[FData] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBOPCTAS] ADD  DEFAULT ((0)) FOR [NroILB]
GO

ALTER TABLE [dbo].[SBOPCTAS] ADD  DEFAULT ((0)) FOR [NroLinea]
GO

ALTER TABLE [dbo].[SBOPCTAS] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBOPCTAS] ADD  DEFAULT ((0)) FOR [FData]
GO

ALTER TABLE [dbo].[SBOPCTAS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


