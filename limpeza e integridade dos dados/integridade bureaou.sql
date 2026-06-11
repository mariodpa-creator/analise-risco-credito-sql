--select top 10 * from [application_train_final]

--select top 100 * from [dbo].[bureau]

--verificando a quantidade nulos da coluna [AMT_ANNUITY] na tabela, para verificar a qualidade dos dados e se deve descarta-la.
select count(*) as totalregistro
,sum(case when [AMT_ANNUITY] is null then 1 else 0 end) totalnulos
,(sum(case when [AMT_ANNUITY] is null then 1 else 0 end)*100)/count(*) percentualnulos
,sum(case when AMT_CREDIT_SUM_DEBT is null then 1 else 0 end)
from [bureau]

--calculando o endividamento total atual de cada cliente no mercado, desconsiderando extremos.
select [SK_ID_CURR], cast(sum( isnull([AMT_CREDIT_SUM_DEBT],0)) as decimal(38,2))

from [dbo].[bureau]
where [AMT_CREDIT_SUM_DEBT] < 1000000000
group by [SK_ID_CURR]
order by 2 desc

--verificando os extremos
select min([AMT_CREDIT_SUM_DEBT]), max([AMT_CREDIT_SUM_DEBT]) from bureau

--verificandos os outliers
SELECT TOP 5
    [SK_ID_CURR], 
    [AMT_CREDIT_SUM_DEBT]
FROM [dbo].[bureau]
ORDER BY [AMT_CREDIT_SUM_DEBT] DESC;

--verificando os extremos, para ver se tem dados errados
SELECT 
    MAX(AMT_CREDIT_SUM) as Max_Credito,
    MAX(AMT_CREDIT_SUM_DEBT) as Max_Divida,
    MAX(AMT_CREDIT_MAX_OVERDUE) as Max_Atraso,
    MIN(DAYS_CREDIT) as Min_Dias_Credito,
    MAX(DAYS_CREDIT_UPDATE) as Max_Atualizacao
FROM [dbo].[bureau];

