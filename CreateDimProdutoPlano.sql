USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Produto_Plano]    Script Date: 24/03/2019 20:46:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[Dim_Produto_Plano](
	[ID_Produto] [int] NOT NULL,
	[Dsc_Plano] [varchar](30) NOT NULL,
	[ID_Step_Tarifacao] [smallint] NOT NULL,
	[Vlr_Step] [numeric](11, 5) NULL,
 CONSTRAINT [PK_ProdutoPlanoStep] PRIMARY KEY CLUSTERED 
(
	[ID_Produto] ASC,
	[ID_Step_Tarifacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


