USE [admin]
GO

/****** Object:  Table [dbo].[SBRPTD]    Script Date: 24/08/2025 20:47:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBRPTD](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Unico] [varchar](70) NOT NULL,
	[CodBanco] [varchar](70) NULL,
	[NroCuenta] [varchar](70) NULL,
	[DesBanco] [varchar](70) NULL,
	[TipBanco] [varchar](70) NULL,
	[TitRpt1] [varchar](100) NULL,
	[TitRpt2] [varchar](100) NULL,
	[TitRpt3] [varchar](100) NULL,
	[TitRpt4] [varchar](100) NULL,
	[TitRpt5] [varchar](100) NULL,
	[FecRpt1] [datetime] NULL,
	[FecRpt2] [datetime] NULL,
	[FecRpt3] [datetime] NULL,
	[FecRpt4] [datetime] NULL,
	[FecRpt5] [datetime] NULL,
	[MtoRpt1] [decimal](28, 4) NOT NULL,
	[MtoRpt2] [decimal](28, 4) NOT NULL,
	[MtoRpt3] [decimal](28, 4) NOT NULL,
	[MtoRpt4] [decimal](28, 4) NOT NULL,
	[MtoRpt5] [decimal](28, 4) NOT NULL,
	[MtoTxt1] [varchar](100) NULL,
	[MtoTxt2] [varchar](100) NULL,
	[MtoTxt3] [varchar](100) NULL,
	[MtoTxt4] [varchar](100) NULL,
	[MtoTxt5] [varchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBRPTD] ADD  DEFAULT ((0)) FOR [MtoRpt1]
GO

ALTER TABLE [dbo].[SBRPTD] ADD  DEFAULT ((0)) FOR [MtoRpt2]
GO

ALTER TABLE [dbo].[SBRPTD] ADD  DEFAULT ((0)) FOR [MtoRpt3]
GO

ALTER TABLE [dbo].[SBRPTD] ADD  DEFAULT ((0)) FOR [MtoRpt4]
GO

ALTER TABLE [dbo].[SBRPTD] ADD  DEFAULT ((0)) FOR [MtoRpt5]
GO

ALTER TABLE [dbo].[SBRPTD] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


