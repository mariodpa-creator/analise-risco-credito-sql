--verificando se clientes que possui dividas externas altas possui maior rjeicao interna
with clientesporfaixa as(
select
	a.SK_ID_CURR
	,case when a.totaldivida>=350000 then 'alta divida >350.000'
	else 'divida baixa/normal' end faixadivida

from [vw_resumo_bureau] a

)
select
	 a.faixadivida
	,count(a.SK_ID_CURR) as totalclientes
	,avg(b.percentualrejeição) media
from clientesporfaixa a
join [vw_historico_interno] b on a.SK_ID_CURR=b.SK_ID_CURR
group by 	 a.faixadivida

