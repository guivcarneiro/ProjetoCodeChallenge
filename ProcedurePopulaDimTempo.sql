

Create procedure ISP_insertDimTempo
   @dataInicial date, @dataFinal date
as
begin
  declare  @data date, 
   @ano smallint, @mes smallint, @dia smallint, 
   @diaSemana smallint, @diaUtil char(1), @fimSemana char(1), 
   @feriado char(1), @preFeriado char(1), @posFeriado char(1), 
   @nomeFeriado varchar(30), @nomeDiaSemana varchar(15), 
   @nomeDiaSemanaAbrev char(3), @nomeMes varchar(15), 
   @nomeMesAbrev char(3), @bimestre smallint, @trimestre smallint, 
   @nrSemanaMes smallint, @estacaoAno varchar(15), 
   @dataPorExtenso varchar(50)
  
  /*Nao utilizado mais 
  --informe aqui o período para o qual deseja criar os dados
  --set @dataInicial = '01/01/2012'
  --set @dataFinal = '31/12/2012'
  */
  
  while @dataInicial <= @dataFinal
  begin
  set @data = @dataInicial
  set @ano = year(@data)
  set @mes = month(@data)
  set @dia = day(@data)
  set @diaSemana = datepart(weekday,@data)
  
  
  --verifica se é fim de semana ou semana
  if @diaSemana in (1,7) 
  set @fimSemana = 'S'
  else set @fimSemana = 'N'
  
  /* feriados locais/regionais e aqueles que não possuem data fixa 
  (carnaval, páscoa e corpus cristis) tb devem ser adicionados aqui */
  
  --nome feriado fixo
  if (@mes = 1 and @dia in (1,2)) or (@mes = 12 and @dia = 31) --confraternização universal
  set @nomeFeriado = 'confraternização universal'
  else 
  if (@mes = 4 and @dia in (20,21,22)) --tiradentes
  set @nomeFeriado = 'tiradentes'
  else 
  if (@mes = 5 and @dia in (1,2))or (@mes = 4 and @dia = 30) --dia do trabalho
  set @nomeFeriado = 'dia do trabalho'
  else 
  if (@mes = 9 and @dia in (6,7,8)) --independência do brasil
  set @nomeFeriado = 'independência do brasil'
  else 
  if (@mes = 10 and @dia in (11,12,13)) --nossa senhora aparecida
  set @nomeFeriado = 'nossa senhora aparecida'
  else
  if (@mes = 11 and @dia in (1,2,3)) --finados
  set @nomeFeriado = 'finados'
  else
  if (@mes = 11 and @dia in (14,15,16)) --proclamação da república
  set @nomeFeriado = 'proclamação da república'
  else
  if (@mes = 12 and @dia in (24,25,26)) --natal
  set @nomeFeriado = 'natal'
  else set @nomeFeriado = null
  
  --pre feriado
  if (@mes = 12 and @dia = 31) or --confraternização universal
  (@mes = 4 and @dia = 20) or --tiradentes
  (@mes = 4 and @dia = 30) or --dia do trabalho
  (@mes = 9 and @dia = 6) or --independência do brasil
  (@mes = 10 and @dia = 11) or --nossa senhora aparecida
  (@mes = 11 and @dia = 1) or --finados
  (@mes = 11 and @dia = 14) or --proclamação da república
  (@mes = 12 and @dia = 24) --natal
  set @preFeriado = 'S'
  else set @preFeriado = 'N'
  
  --feriado
  if (@mes = 1 and @dia = 1) or --confraternização universal
  (@mes = 4 and @dia = 21) or --tiradentes
  (@mes = 5 and @dia = 1) or --dia do trabalho
  (@mes = 9 and @dia = 7) or --independência do brasil
  (@mes = 10 and @dia = 12) or --nossa senhora aparecida
  (@mes = 11 and @dia = 2) or --finados
  (@mes = 11 and @dia = 15) or --proclamação da república
  (@mes = 12 and @dia = 25) --natal
  set @feriado = 'S'
  else set @feriado = 'N'
  --pos feriado
  if (@mes = 1 and @dia = 2) or --confraternização universal
  (@mes = 4 and @dia = 22) or --tiradentes
  (@mes = 5 and @dia = 2) or --dia do trabalho
  (@mes = 9 and @dia = 8) or --independência do brasil
  (@mes = 10 and @dia = 13) or --nossa senhora aparecida
  (@mes = 11 and @dia = 3) or --finados
  (@mes = 11 and @dia = 16) or --proclamação da república
  (@mes = 12 and @dia = 26) --natal
  set @posFeriado = 'S'
  else set @posFeriado = 'N'
  
  --identicar mes
  set @nomeMes = case when @mes = 1 then 'janeiro'
  when @mes = 2 then 'fevereiro'
  when @mes = 3 then 'março'
  when @mes = 4 then 'abril'
  when @mes = 5 then 'maio'
  when @mes = 6 then 'junho'
  when @mes = 7 then 'julho'
  when @mes = 8 then 'agosto'
  when @mes = 9 then 'setembro'
  when @mes = 10 then 'outubro'
  when @mes = 11 then 'novembro'
  when @mes = 12 then 'dezembro' end
  
  --nome mes abreviado
  set @nomeMesAbrev = case when @mes = 1 then 'jan'
  when @mes = 2 then 'fev'
  when @mes = 3 then 'mar'
  when @mes = 4 then 'abr'
  when @mes = 5 then 'mai'
  when @mes = 6 then 'jun'
  when @mes = 7 then 'jul'
  when @mes = 8 then 'ago'
  when @mes = 9 then 'set'
  when @mes = 10 then 'out'
  when @mes = 11 then 'nov'
  when @mes = 12 then 'dez' end
  
  --identicar dia util
  if @fimSemana = 'S' or @feriado = 'S'
  set @diaUtil = 'N'
  else set @diaUtil = 'S'
  
  --identificar dia da semana
  set @nomeDiaSemana = case when @diaSemana = 1 then 'domingo'
  when @diaSemana = 2 then 'segunda-feira'
  when @diaSemana = 3 then 'terça-feira'
  when @diaSemana = 4 then 'quarta-feira'
  when @diaSemana = 5 then 'quinta-feira'
  when @diaSemana = 6 then 'sexta-feira'
  else 'sábado' end
  
  --identificar dia da semana abreviado
  set @nomeDiaSemanaAbrev = case when @diaSemana = 1 then 'dom'
  when @diaSemana = 2 then 'seg'
  when @diaSemana = 3 then 'ter'
  when @diaSemana = 4 then 'qua'
  when @diaSemana = 5 then 'qui'
  when @diaSemana = 6 then 'sex'
  else 'sáb' end
  
  --identificar bimestre
  set @bimestre = case when @mes in (1,2) then 1
  when @mes in (3,4) then 2
  when @mes in (5,6) then 3
  when @mes in (7,8) then 4
  when @mes in (9,10) then 5
  else 6 end
  
  --identicar trimestre
  set @trimestre = case when @mes in (1,2,3) then 1
  when @mes in (4,5,6) then 2
  when @mes in (7,8,9) then 3
  else 4 end
  
  --identificar numero da semana
  set @nrSemanaMes = case when @dia < 8 then 1
  when @dia < 15 then 2
  when @dia < 22 then 3
  when @dia < 29 then 4
  else 5 end
  
  --identificar estacao do ano no Brasil
  if @data between cast('23/09/'+convert(char(4),@ano) as date) and cast('20/12/'+convert(char(4),@ano) as date)
  set @estacaoAno = 'primavera'
  else if @data between cast('21/03/'+convert(char(4),@ano) as date) and cast('20/06/'+convert(char(4),@ano) as date)
  set @estacaoAno = 'outono'
  else if @data between cast('21/06/'+convert(char(4),@ano) as date) and cast('22/09/'+convert(char(4),@ano) as date)
  set @estacaoAno = 'inverno'
  else -- @data between 21/12 e 20/03
  set @estacaoAno = 'verão'
  
  --insert
  INSERT INTO DIM_TEMPO
  SELECT @data
  ,@ano
  ,@mes
  ,@dia
  ,@diaSemana
  ,datepart(dayofyear,@data) --DIA_ANO
  ,case when (@ano % 4) = 0 then 'S' else 'N' end -- ANO_BISSEXTO
  ,@diaUtil
  ,@fimSemana
  ,@feriado
  ,@preFeriado
  ,@posFeriado
  ,@nomeFeriado
  ,@nomeDiaSemana
  ,@nomeDiaSemanaAbrev
  ,@nomeMes
  ,@nomeMesAbrev
  ,case when @dia < 16 then 1 else 2 end -- QUINZENA
  ,@bimestre
  ,@trimestre
  ,case when @mes < 7 then 1 else 2 end -- SEMESTRE
  ,@nrSemanaMes
  ,datepart(wk,@data)--NR_SEMANA_ANO, smallint
  ,@estacaoAno
  ,lower(@nomeDiaSemana + ', ' + cast(@dia as varchar) + ' de ' + @nomeMes + ' de ' + cast(@ano as varchar))
  
  
  set @dataInicial = dateadd(day,1,@dataInicial) 
  end
end
  
--executar pprocedure 
exec ISP_insertDimTempo '1990-01-01','2050-12-12'