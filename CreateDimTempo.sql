USE [DM_CodeChallenge]
GO

/****** Object:  Table [dbo].[Dim_Tempo]    Script Date: 24/03/2019 19:01:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Tempo](
	[ID_Tempo] [int] IDENTITY(1,1) NOT NULL,
	[Data] [date] NOT NULL,
	[Ano] [smallint] NOT NULL,
	[Mes] [smallint] NOT NULL,
	[Dia] [smallint] NOT NULL,
	[Dia_Semana] [smallint] NOT NULL,
	[Dia_Ano] [smallint] NOT NULL,
	[Ano_Bissexto] [char](1) NOT NULL,
	[Dia_Util] [char](1) NOT NULL,
	[Fim_Semana] [char](1) NOT NULL,
	[Feriado] [char](1) NOT NULL,
	[Pre_Feriado] [char](1) NOT NULL,
	[Pos_Feriado] [char](1) NOT NULL,
	[Nome_Feriado] [nvarchar](30) NULL,
	[Nome_Dia_Semana] [nvarchar](15) NOT NULL,
	[Nome_Dia_Semana_Abrev] [char](3) NOT NULL,
	[Nome_Mes] [nvarchar](15) NOT NULL,
	[Nome_Mes_Abrev] [char](3) NOT NULL,
	[Quinzena] [smallint] NOT NULL,
	[Bimestre] [smallint] NOT NULL,
	[Trimestre] [smallint] NOT NULL,
	[Semestre] [smallint] NOT NULL,
	[Nr_Semana_Mes] [smallint] NOT NULL,
	[Nr_Semana_Ano] [smallint] NOT NULL,
	[Estacao_Ano] [varchar](15) NOT NULL,
	[Data_Por_Extenso] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


