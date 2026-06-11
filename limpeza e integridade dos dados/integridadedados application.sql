-- Verifique a porcentagem de nulos em colunas críticas
SELECT 
    (COUNT(*) - COUNT(AMT_INCOME_TOTAL)) * 100.0 / COUNT(*) AS pct_renda
    ,(COUNT(*) - COUNT(EXT_SOURCE_1)) * 100.0 / COUNT(*) AS pct_null_scoreexterno
FROM application_train_final;

SELECT 
    (COUNT(*) - COUNT(EXT_SOURCE_2)) * 100.0 / COUNT(*) AS pct_null_scoremercado
FROM application_train_final;

--verificanfdo se existem strings vazias
SELECT 
    COUNT(*) AS total_linhas,
    SUM(CASE WHEN OCCUPATION_TYPE = '' THEN 1 ELSE 0 END) AS vazios_occupation,
    SUM(CASE WHEN NAME_TYPE_SUITE = '' THEN 1 ELSE 0 END) AS vazios_suite,
    SUM(CASE WHEN FONDKAPREMONT_MODE = '' THEN 1 ELSE 0 END) AS vazios_fondkapremont
FROM application_train_final;

--verificando se existem espaços invisíveis
SELECT COUNT(*) 
FROM application_train_final 
WHERE OCCUPATION_TYPE IS NOT NULL AND LTRIM(RTRIM(OCCUPATION_TYPE)) = '';

--verificando strigs vazias
SELECT 
    SUM(CASE WHEN NAME_CONTRACT_TYPE = '' THEN 1 ELSE 0 END) as Vazio_Contract,
    SUM(CASE WHEN CODE_GENDER = '' THEN 1 ELSE 0 END) as Vazio_Gender,
    SUM(CASE WHEN NAME_TYPE_SUITE = '' THEN 1 ELSE 0 END) as Vazio_Suite,
    SUM(CASE WHEN NAME_INCOME_TYPE = '' THEN 1 ELSE 0 END) as Vazio_Income,
    SUM(CASE WHEN OCCUPATION_TYPE = '' THEN 1 ELSE 0 END) as Vazio_Occupation,
    SUM(CASE WHEN ORGANIZATION_TYPE = '' THEN 1 ELSE 0 END) as Vazio_Organization,
    SUM(CASE WHEN WALLSMATERIAL_MODE = '' THEN 1 ELSE 0 END) as Vazio_Walls,
    SUM(CASE WHEN EMERGENCYSTATE_MODE = '' THEN 1 ELSE 0 END) as Vazio_Emergency
FROM application_train_final;

--verificando se existe outlies no tempo de emprego atual do cliente
SELECT 
    DAYS_EMPLOYED, 
    COUNT(*) as total_clientes,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM application_train_final)) as porcentagem
FROM application_train_final
WHERE DAYS_EMPLOYED = 365243
GROUP BY DAYS_EMPLOYED;

-- transformando o valor absurdo em NULL
UPDATE application_train_final
SET DAYS_EMPLOYED = NULL
WHERE DAYS_EMPLOYED = 365243;

-- Adiciona a coluna de idade
ALTER TABLE application_train_final ADD Idade_Anos INT;

-- Calcula a idade aproximada
UPDATE application_train_final
SET Idade_Anos = ABS(DAYS_BIRTH) / 365.25;

--verificando a quantidade de nulos de colunas principais
SELECT 
    COUNT(*) AS Total_Registros,
    SUM(CASE WHEN AMT_INCOME_TOTAL IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Pct_Null_Renda,
    SUM(CASE WHEN AMT_CREDIT IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Pct_Null_Credito,
    SUM(CASE WHEN EXT_SOURCE_2 IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Pct_Null_ExtSource2
FROM application_train_final;

--verificando dados estatisticos
SELECT 
    MIN(AMT_INCOME_TOTAL) AS Min_Renda,
    MAX(AMT_INCOME_TOTAL) AS Max_Renda,
    AVG(AMT_INCOME_TOTAL) AS Media_Renda,
    MIN(AMT_CREDIT) AS Min_Credito,
    MAX(AMT_CREDIT) AS Max_Credito
FROM application_train_final;




