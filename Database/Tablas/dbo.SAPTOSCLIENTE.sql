USE [admin]
GO

/****** Object:  Table [dbo].[SAPTOSCLIENTE]    Script Date: 24/08/2025 20:25:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SAPTOSCLIENTE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodClie] [varchar](15) NOT NULL,
	[Periodo] [varchar](6) NOT NULL,
	[NroFacts] [int] NOT NULL,
	[Credito] [decimal](28, 4) NOT NULL,
	[Contado] [decimal](28, 4) NOT NULL,
	[MtoVentas] [decimal](28, 4) NOT NULL,
	[Descto] [decimal](28, 4) NOT NULL,
	[ValorPtos] [decimal](28, 4) NOT NULL,
	[FechaE] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT ((0)) FOR [NroFacts]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT ((0)) FOR [Credito]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT ((0)) FOR [Contado]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT ((0)) FOR [MtoVentas]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT ((0)) FOR [Descto]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT ((0)) FOR [ValorPtos]
GO

ALTER TABLE [dbo].[SAPTOSCLIENTE] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


