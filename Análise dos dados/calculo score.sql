--risco de credito do cliente avaliado segundo o total de contratos externos, renda, idade, escolaridade
with notacliente as(
select 
	a.SK_ID_CURR
	,isnull(a.totalcontratos,0) as totalcontratos
	,b.possuicarro
	,b.possuicasa
	,b.idade
	,b.escolaridade
	,b.renda
	,c.qtdreprovado
	,100
	-(case when isnull(a.totalcontratos,0)>=3 then 20 else 0 end) 
	-(case when b.escolaridade='Lower secondary' and b.renda>100000 and b.renda<=200000 then 30
	        when b.escolaridade='Lower secondary' and b.renda>200000 and b.renda<=350000 then 20
	        when b.escolaridade='Secondary / secondary special' and b.renda>100000 and b.renda<=200000 then 15
			when b.escolaridade='Lower secondary' and b.renda<=100000 then 10
			when b.escolaridade='Incomplete higher' and b.renda<=100000 then 10 else 0 end)
	-(case when b.idade<40 then 20 else 0 end)
	-(case when isnull(c.totalemprestimo,0)>1 then 20 else 0 end) as scorefinal
from [vw_resumo_bureau] a
right join [vw_perfil_cliente] b on a.SK_ID_CURR=b.SK_ID_CURR
left join [dbo].[vw_historico_interno] c on b.SK_ID_CURR=c.SK_ID_CURR

	)
select *
,case when scorefinal<=40 then 'reprovado'
	  when scorefinal>40 and scorefinal<=60 then 'Condicionado -Ánalise Manual'
	  else 'aprovado' end as scorecalculado

from notacliente
