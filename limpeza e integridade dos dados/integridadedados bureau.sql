--limpando a tabela original que contem valores  muito alto
drop table if exists stg_bureau
select 
 [SK_ID_CURR]
,[SK_ID_BUREAU]
,[CREDIT_ACTIVE]
,case when [AMT_CREDIT_SUM] > 100000000 then 100000000 else isnull([AMT_CREDIT_SUM],0) end as [AMT_CREDIT_SUM]
    -- Trata a dívida atual (Teto de 100 Milhões e remove negativos)
,CASE 
        WHEN AMT_CREDIT_SUM_DEBT IS NULL THEN 0
        WHEN AMT_CREDIT_SUM_DEBT < 0 THEN 0  
        WHEN AMT_CREDIT_SUM_DEBT > 100000000 THEN 100000000
        ELSE AMT_CREDIT_SUM_DEBT
    END AS AMT_CREDIT_SUM_DEBT

,case
	when DAYS_CREDIT_UPDATE>0 then 0 else DAYS_CREDIT_UPDATE end as DAYS_CREDIT_UPDATE

,case
	when [DAYS_CREDIT]>0 then 0 else DAYS_CREDIT end as DAYS_CREDIT
	into stg_bureau 
	from [dbo].[bureau]


-- resumo consolidado por cliente
drop table if exists bureau_final_cliente
select 

	[SK_ID_CURR]
	,count(	[SK_ID_CURR]) as totalcontratos
	,cast(sum([AMT_CREDIT_SUM]) as decimal(38,2)) as totalcredito
	,cast(sum([AMT_CREDIT_SUM_DEBT]) as decimal(38,2)) as totaldivida
	,min([DAYS_CREDIT_UPDATE]) as diasultatualizacao
into bureau_final_cliente
from  [dbo].[bureau]
group by [SK_ID_CURR]