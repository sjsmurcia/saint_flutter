USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBCONC]    Script Date: 24/08/2025 20:38:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBCONC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[NoConc] [int] NOT NULL,
	[CodUsua] [varchar](30) NULL,
	[Descripcion] [varchar](50) NULL,
	[NoCuenta] [varchar](20) NULL,
	[FechaI] [datetime] NULL,
	[SaldoI] [decimal](28, 4) NOT NULL,
	[NoDepoC] [int] NOT NULL,
	[NoCredC] [int] NOT NULL,
	[NoCheqC] [int] NOT NULL,
	[NoNDebC] [int] NOT NULL,
	[MtDepoC] [decimal](28, 4) NOT NULL,
	[MtCredC] [decimal](28, 4) NOT NULL,
	[MtCheqC] [decimal](28, 4) NOT NULL,
	[MtNDebC] [decimal](28, 4) NOT NULL,
	[NoDepoT] [int] NOT NULL,
	[NoCredT] [int] NOT NULL,
	[NoCheqT] [int] NOT NULL,
	[NoNDebT] [int] NOT NULL,
	[MtDepoT] [decimal](28, 4) NOT NULL,
	[MtCredT] [decimal](28, 4) NOT NULL,
	[MtCheqT] [decimal](28, 4) NOT NULL,
	[MtNDebT] [decimal](28, 4) NOT NULL,
	[FechaF] [datetime] NULL,
	[SaldoF] [decimal](28, 4) NOT NULL,
	[SaldoLib] [decimal](28, 4) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoConc]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [SaldoI]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoDepoC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoCredC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoCheqC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoNDebC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtDepoC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtCredC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtCheqC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtNDebC]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoDepoT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoCredT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoCheqT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [NoNDebT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtDepoT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtCredT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtCheqT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [MtNDebT]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [SaldoF]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT ((0)) FOR [SaldoLib]
GO

ALTER TABLE [dbo].[SBCONC] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


