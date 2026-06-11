-- Verifica inadimplência por número de contratos e tempo de serviço
WITH Analise_Clientes AS (
    SELECT 
        a.SK_ID_CURR,
        COUNT(a.SK_ID_BUREAU) AS Qtd_Contratos_Externos_Ativos,
        MAX(CAST(b.TARGET AS INT)) AS Inadimplente_Interno, --função max para não ser pedido no group by
        -- trata dias negativos em anos positivos e trata os desempregados
        --Na tabela os dias são informados negativos
        MAX(CASE 
            WHEN b.DAYS_EMPLOYED >= 0 THEN 0 
            ELSE ABS(b.DAYS_EMPLOYED) / 365.25 
        END) AS Anos_Empregado
    FROM [bureau] a 
    JOIN [dbo].[application_train_final] b ON a.SK_ID_CURR = b.SK_ID_CURR
    WHERE a.CREDIT_ACTIVE = 'Active'
    GROUP BY a.SK_ID_CURR
),
Classificacao_Emprego AS (
    SELECT 
        CASE 
            WHEN Qtd_Contratos_Externos_Ativos > 3 THEN 'Mais de 3 Créditos Ativos'
            ELSE '3 ou Menos Créditos Ativos'
        END AS Perfil_do_Cliente,
        CASE 
            WHEN Anos_Empregado = 0 THEN 'Desempregado/Não Informado'
            WHEN Anos_Empregado < 2 THEN 'Menos de 2 Anos de Emprego'
            WHEN Anos_Empregado BETWEEN 2 AND 5 THEN '2 a 5 Anos de Emprego'
            ELSE 'Mais de 5 Anos de Emprego'
        END AS Faixa_Emprego,
        Inadimplente_Interno
    FROM Analise_Clientes
)
SELECT 
    Perfil_do_Cliente,
    Faixa_Emprego,
    COUNT(*) AS Total_de_Clientes,
    SUM(Inadimplente_Interno) AS Total_Inadimplentes,
    ROUND(AVG(CAST(Inadimplente_Interno AS FLOAT)) * 100, 2) AS Taxa_Inadimplencia_Pct
FROM Classificacao_Emprego
GROUP BY Perfil_do_Cliente, Faixa_Emprego
ORDER BY Perfil_do_Cliente DESC, Taxa_Inadimplencia_Pct DESC;
