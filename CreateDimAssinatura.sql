USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Assinatura]    Script Date: 24/03/2019 18:56:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Assinatura](
	[ID_Assinatura] [bigint] NOT NULL,
	[ID_DDD] [varchar](2) NOT NULL,
	[Num_Tel] [varchar](11) NOT NULL,
	[ID_Produto] [int] NULL,
	[Dt_Assinatura] [datetime] NULL,
	[ID_Pendente] [bit] NULL,
	[ID_Status_Assinatura] [bit] NULL,
	[Dt_Cancelamento] [datetime] NULL,
	[Dsc_Motivo_Cancelamento] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Assinatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


