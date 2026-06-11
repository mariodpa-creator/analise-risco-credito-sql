-- ANALISE INADIMPLENCIA de cliente que possui carro ou casa
SELECT
	 CASE WHEN possuicarro='Y' THEN 'POSSUICARRO' ELSE 'NÃO POSSUI CARRO' END CARRO
	 ,CASE WHEN possuicasa='Y' THEN 'POSSUICASA' ELSE 'NÃO POSSUI CASA' END CASA

	,COUNT(a.SK_ID_CURR) total
	,sum(case when b.target=1 then 1 else 0 end) totalinadimplentes
	,round(cast(sum(case when b.target=1 then 1 else 0 end) as float)/COUNT(a.SK_ID_CURR)*100,2) percentutalINADIMPLENCIA

from [dbo].[vw_perfil_cliente] a
join [dbo].[application_train_final] b on a.SK_ID_CURR=b.SK_ID_CURR
GROUP BY CASE WHEN possuicarro='Y' THEN 'POSSUICARRO' ELSE 'NÃO POSSUI CARRO' END,CASE WHEN possuicasa='Y' THEN 'POSSUICASA' ELSE 'NÃO POSSUI CASA' END



