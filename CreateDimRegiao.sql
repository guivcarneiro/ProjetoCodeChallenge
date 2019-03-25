USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Regiao]    Script Date: 24/03/2019 19:00:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Regiao](
	[ID_DDD] [varchar](2) NOT NULL,
	[DSC_Cidade] [varchar](150) NOT NULL,
	[UF_Estado] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


