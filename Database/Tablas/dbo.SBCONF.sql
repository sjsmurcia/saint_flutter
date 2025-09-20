USE [admin]
GO

/****** Object:  Table [dbo].[SBCONF]    Script Date: 24/08/2025 20:39:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SBCONF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodSucu] [varchar](5) NULL,
	[MaxCheque] [decimal](28, 4) NOT NULL,
	[DiasD1] [int] NOT NULL,
	[DiasD2] [int] NOT NULL,
	[DiasD3] [int] NOT NULL,
	[IChequeNE] [int] NOT NULL,
	[ICEgreso] [int] NOT NULL,
	[PrxCEgreso] [int] NOT NULL,
	[PrxDeposito] [int] NOT NULL,
	[PrxNDebito] [int] NOT NULL,
	[PrxNCredito] [int] NOT NULL,
	[PDebBan] [decimal](28, 4) NOT NULL,
	[MesesH] [int] NOT NULL,
	[StDta] [varchar](90) NULL,
	[AlertarND] [int] NOT NULL,
	[MOpeConc] [int] NOT NULL,
	[Consolida] [int] NOT NULL,
	[DirContab] [varchar](70) NULL,
	[DirDtaCont] [varchar](70) NULL,
	[CCTipo] [int] NOT NULL,
	[CCDescrip] [varchar](40) NULL,
	[CCSSW] [int] NOT NULL,
	[CCServer] [varchar](70) NULL,
	[CCDb] [varchar](70) NULL,
	[CCUser] [varchar](70) NULL,
	[CCPwd] [varchar](70) NULL,
	[CCPrefix] [int] NOT NULL,
	[NroCxB] [int] NOT NULL,
	[ACtas0] [int] NOT NULL,
	[ACtas1] [int] NOT NULL,
	[ACtas2] [int] NOT NULL,
	[ACtas3] [int] NOT NULL,
	[ACtas4] [int] NOT NULL,
	[ACtas5] [int] NOT NULL,
	[NOpe1] [int] NOT NULL,
	[NOpe2] [int] NOT NULL,
	[NOpe3] [int] NOT NULL,
	[NOpe4] [int] NOT NULL,
	[NOpe5] [int] NOT NULL,
	[NOpe6] [int] NOT NULL,
	[NOpe7] [int] NOT NULL,
	[NOpe8] [int] NOT NULL,
	[NOpe9] [int] NOT NULL,
	[NOpe10] [int] NOT NULL,
	[CtaAux1] [varchar](30) NULL,
	[CtaAux2] [varchar](30) NULL,
	[CtaAux3] [varchar](30) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [MaxCheque]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [DiasD1]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [DiasD2]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [DiasD3]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [IChequeNE]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ICEgreso]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [PrxCEgreso]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [PrxDeposito]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [PrxNDebito]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [PrxNCredito]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [PDebBan]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [MesesH]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [AlertarND]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [MOpeConc]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [Consolida]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [CCTipo]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [CCSSW]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [CCPrefix]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NroCxB]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ACtas0]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ACtas1]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ACtas2]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ACtas3]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ACtas4]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [ACtas5]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe1]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe2]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe3]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe4]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe5]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe6]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe7]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe8]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe9]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT ((0)) FOR [NOpe10]
GO

ALTER TABLE [dbo].[SBCONF] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


