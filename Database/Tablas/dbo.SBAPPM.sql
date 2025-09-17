USE [admin]
GO

/****** Object:  Table [dbo].[SBAPPM]    Script Date: 24/08/2025 20:37:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBAPPM](
	[NroUnico] [int] IDENTITY(1,1) NOT NULL,
	[CodBanc] [varchar](30) NOT NULL,
	[NroCtrl] [varchar](20) NOT NULL,
	[FechaP] [datetime] NULL,
	[NroPagos] [int] NOT NULL,
	[MtoPagos] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBAPPM] ADD  DEFAULT ((0)) FOR [NroPagos]
GO

ALTER TABLE [dbo].[SBAPPM] ADD  DEFAULT ((0)) FOR [MtoPagos]
GO

ALTER TABLE [dbo].[SBAPPM] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


