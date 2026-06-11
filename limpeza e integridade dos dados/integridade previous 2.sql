-- verificando verificando os maiores valores de creditos aprovados,
select 
SK_ID_PREV
,sum([AMT_CREDIT]) as somacred
from [previous_application_clean]
group by SK_ID_PREV
order by sum([AMT_CREDIT]) desc
--verificando os valores de creditos solicitados do cliente para limitar na consultas e eliminar valores extremos.
SELECT distinct
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY AMT_CREDIT) OVER() AS P95,
    PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY AMT_CREDIT) OVER() AS P99
FROM [previous_application_clean]
