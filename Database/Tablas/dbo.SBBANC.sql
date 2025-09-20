USE [admin]
GO

/****** Object:  Table [dbo].[SBBANC]    Script Date: 24/08/2025 20:37:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBBANC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[NoCuenta] [varchar](20) NULL,
	[Sucursal] [varchar](50) NULL,
	[TDC] [int] NOT NULL,
	[CtaContab] [varchar](25) NULL,
	[SaldoAct] [decimal](28, 4) NOT NULL,
	[SaldoC1] [decimal](28, 4) NOT NULL,
	[FechaC1] [datetime] NULL,
	[SaldoC2] [decimal](28, 4) NOT NULL,
	[FechaC2] [datetime] NULL,
	[PrxConc] [int] NOT NULL,
	[InvChe] [int] NOT NULL,
	[IDB] [int] NOT NULL,
	[Moneda] [varchar](3) NULL,
	[PDB] [decimal](28, 4) NOT NULL,
	[CtaDebito] [varchar](30) NULL,
	[PrxNDDB] [int] NOT NULL,
	[CtaConc] [int] NOT NULL,
	[RTransf] [int] NOT NULL,
	[NomSuc] [varchar](40) NULL,
	[Pais] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Ciudad] [int] NOT NULL,
	[Municipio] [int] NOT NULL,
	[ZipCode] [varchar](20) NULL,
	[Direccion1] [varchar](40) NULL,
	[Direccion2] [varchar](40) NULL,
	[Gerente] [varchar](30) NULL,
	[Telefonos] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[Email] [varchar](25) NULL,
	[Memo] [text] NULL,
	[MesesH] [int] NOT NULL,
	[VNoCh] [int] NOT NULL,
	[VNoDp] [int] NOT NULL,
	[VNoNc] [int] NOT NULL,
	[VNoNd] [int] NOT NULL,
	[PrxCheque] [decimal](28, 4) NOT NULL,
	[NComp0] [int] NOT NULL,
	[NComp1] [int] NOT NULL,
	[NComp2] [int] NOT NULL,
	[NComp3] [int] NOT NULL,
	[NComp4] [int] NOT NULL,
	[NComp5] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [TDC]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [SaldoAct]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [SaldoC1]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [SaldoC2]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [PrxConc]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [InvChe]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [IDB]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [PDB]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [PrxNDDB]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [CtaConc]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [RTransf]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [Pais]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [Estado]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [Ciudad]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [Municipio]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [MesesH]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [VNoCh]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [VNoDp]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [VNoNc]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [VNoNd]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [PrxCheque]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [NComp0]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [NComp1]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [NComp2]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [NComp3]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [NComp4]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT ((0)) FOR [NComp5]
GO

ALTER TABLE [dbo].[SBBANC] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


