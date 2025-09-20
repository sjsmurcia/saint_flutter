USE [admin]
GO

/****** Object:  Table [dbo].[SBDIFE]    Script Date: 24/08/2025 20:41:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBDIFE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[NOpe] [int] NOT NULL,
	[NLinea] [int] NOT NULL,
	[CodUsua] [varchar](30) NULL,
	[CodEsta] [varchar](30) NULL,
	[CDCD] [int] NOT NULL,
	[Documento] [varchar](25) NULL,
	[Fecha] [datetime] NULL,
	[FechaLib] [datetime] NULL,
	[Beneficiario] [varchar](50) NULL,
	[TipoPgo] [varchar](60) NULL,
	[DescPgo] [varchar](60) NULL,
	[DctoPgo] [varchar](60) NULL,
	[Descripcion] [varchar](60) NULL,
	[Monto] [decimal](28, 4) NOT NULL,
	[TipoOpe] [int] NOT NULL,
	[MontoE] [decimal](28, 4) NOT NULL,
	[NBanco] [varchar](50) NULL,
	[NumeroC] [varchar](30) NULL,
	[PlazaC] [int] NOT NULL,
	[MontoC] [decimal](28, 4) NOT NULL,
	[FechaC] [datetime] NULL,
	[CodTarj] [varchar](10) NULL,
	[Descrip] [varchar](40) NULL,
	[MontoBT] [decimal](28, 4) NOT NULL,
	[BaseIT] [decimal](28, 4) NOT NULL,
	[ComiT] [decimal](28, 4) NOT NULL,
	[ImpT] [decimal](28, 4) NOT NULL,
	[NetoT] [decimal](28, 4) NOT NULL,
	[FechaT] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [NOpe]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [NLinea]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [CDCD]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [Monto]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [TipoOpe]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [MontoE]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [PlazaC]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [MontoC]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [MontoBT]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [BaseIT]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [ComiT]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [ImpT]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT ((0)) FOR [NetoT]
GO

ALTER TABLE [dbo].[SBDIFE] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


