--clientes com rejeicao total interna e que se tornaram inadimplentes

select * 

from [dbo].[vw_historico_interno] a
join [dbo].[application_train_final] b  on a.sk_id_curr=b.sk_id_curr
where a.percentualrejeição=100 and b.TARGET=1

--verificando o total de clientes desse grupo e a taxa de inadimplentes
SELECT 
    COUNT(*) AS Total_Clientes_100_Recusa,
    SUM(CASE WHEN b.TARGET = 1 THEN 1 ELSE 0 END) AS Inadimplentes,
    ROUND(CAST(SUM(CASE WHEN b.TARGET = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS Taxa_Inadimplencia_Desse_Grupo
FROM [dbo].[vw_historico_interno] a 
JOIN [dbo].[application_train_final] b ON a.sk_id_curr = b.sk_id_curr 
WHERE a.percentualrejeição = 100;

--verificando as medias e o total de inadimplnetes desse grupo
select 
	count(distinct a.SK_ID_CURR) total_grupo_rejeiçao
	,avg(c.totalcontratos) as media_total_contrato
	,round(avg(c.totaldivida),2) as media_total_divida
	,sum(case when a.target=1 then 1 else 0 end) total_inadimplentes
	,round(casT(sum(case when a.target=1 then 1 else 0 end) as float)/count(distinct a.SK_ID_CURR)*100,2) as taxa_inadimpkentes
from [dbo].[application_train_final] a
join [dbo].[vw_historico_interno] b on a.SK_ID_CURR=b.SK_ID_CURR
left join [dbo].[vw_resumo_bureau] c on b.SK_ID_CURR=c.SK_ID_CURR
where b.percentualrejeição=100
