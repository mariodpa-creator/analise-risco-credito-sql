--total de endividados por faixa etária, identificando se a idade influencia no atraso de pagamento
SELECT 
    Faixa_Etaria,
    COUNT(*) AS Total_Clientes,
    SUM(TARGET) AS Total_Inadimplentes,
    ROUND(CAST(SUM(TARGET) AS FLOAT) / COUNT(*) * 100, 2) AS Taxa_Inadimplencia_Pct
FROM (
    SELECT 
        TARGET,
        CASE 
            WHEN Idade_Anos < 30 THEN '20-29 anos'
            WHEN Idade_Anos BETWEEN 30 AND 39 THEN '30-39 anos'
            WHEN Idade_Anos BETWEEN 40 AND 49 THEN '40-49 anos'
            WHEN Idade_Anos BETWEEN 50 AND 59 THEN '50-59 anos'
            ELSE '60+ anos'
        END AS Faixa_Etaria
    FROM application_train_final
) AS Subconsulta
GROUP BY Faixa_Etaria
ORDER BY Faixa_Etaria;
