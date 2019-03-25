USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Produto]    Script Date: 24/03/2019 18:47:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[Dim_Produto](
	[ID_Produto] [int] NOT NULL,
	[Nm_Produto] [varchar](150) NOT NULL,
	[Dsc_Produto] [varchar](300) NULL,
	[Dt_Ativacao] [datetime] NULL,
	[Cod_Status_Produto] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


