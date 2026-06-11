-- verificando quantidade de nulos
select
    count(*) as totallinha
    ,sum(case when AMT_ANNUITY  is null then 1 else 0 end) 
    ,sum(case when AMT_ANNUITY  is null then 1 else 0 end)*100/count(*) porcentagem
from previous_application_clean
-- verificando se os contratos anteriores estão devidamente vinculados a um cliente atual.
-- a quantidade de linhas deve ser igual
select

count(sk_id_prev) totallinhas
,count(sk_id_curr)
from previous_application_clean

--verificando se existem registros duplicados
select
 sk_id_prev
,count(sk_id_prev) totallinhas
from previous_application_clean
group by sk_id_prev
having count(*)>1

--entendendo os valores estatisticos das propostas de créditos, para ver a qualidade dos dados e os extremos

 SELECT 
    MAX(AMT_CREDIT) AS Maximo,
    MIN(AMT_CREDIT) AS Minimo,
    AVG(AMT_CREDIT) AS Media,
    STDEV(AMT_CREDIT) AS Desvio_Padrao,
    STDEV(AMT_CREDIT) / NULLIF(AVG(AMT_CREDIT), 0) AS Variabilidade
FROM previous_application_clean;

--identificando os contratos por faixa de valor, para verificar os outliers
SELECT 
    CASE 
        WHEN AMT_CREDIT = 0 THEN '1. Zero'
        WHEN AMT_CREDIT <= 50000 THEN '2. Até 50k'
        WHEN AMT_CREDIT <= 200000 THEN '3. 50k - 200k'
        WHEN AMT_CREDIT <= 500000 THEN '4. 200k - 500k'
        ELSE '5. Acima de 500k (Potenciais Outliers)'
    END AS Faixa_Credito,
    COUNT(*) AS Qtd_Contratos,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(10,2)) AS Porcentagem
FROM previous_application_clean
GROUP BY 
    CASE 
        WHEN AMT_CREDIT = 0 THEN '1. Zero'
        WHEN AMT_CREDIT <= 50000 THEN '2. Até 50k'
        WHEN AMT_CREDIT <= 200000 THEN '3. 50k - 200k'
        WHEN AMT_CREDIT <= 500000 THEN '4. 200k - 500k'
        ELSE '5. Acima de 500k (Potenciais Outliers)'
    END
ORDER BY Faixa_Credito;

--verificando o percentil 0.99
SELECT distinct 
    PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY AMT_CREDIT) OVER() AS Percentil_99,
    MAX(AMT_CREDIT) OVER() AS Valor_Maximo
FROM previous_application_clean
GROUP BY AMT_CREDIT
