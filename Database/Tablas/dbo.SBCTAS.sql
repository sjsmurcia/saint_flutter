USE [SAINTA]
GO

/****** Object:  Table [dbo].[SBCTAS]    Script Date: 24/08/2025 20:39:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBCTAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodCta] [varchar](30) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[IEA] [int] NOT NULL,
	[ECG] [int] NOT NULL,
	[Grupo] [varchar](30) NULL,
	[UFecha] [datetime] NULL,
	[UDcto] [varchar](25) NULL,
	[UBanco] [varchar](30) NULL,
	[UBenef] [varchar](50) NULL,
	[UComent1] [varchar](50) NULL,
	[UComent2] [varchar](50) NULL,
	[UMonto] [decimal](28, 4) NOT NULL,
	[EsBanco] [int] NOT NULL,
	[TDC] [int] NOT NULL,
	[SaldoAct] [decimal](28, 4) NOT NULL,
	[Tercero] [varchar](30) NULL,
	[CodCentro] [varchar](30) NULL,
	[CtaCF] [int] NOT NULL,
	[CtaMov] [int] NOT NULL,
	[CtaTer] [int] NOT NULL,
	[CtaCC] [int] NOT NULL,
	[CtaBase] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [IEA]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [ECG]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [UMonto]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [EsBanco]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [TDC]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [SaldoAct]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [CtaCF]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [CtaMov]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [CtaTer]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [CtaCC]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT ((0)) FOR [CtaBase]
GO

ALTER TABLE [dbo].[SBCTAS] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


