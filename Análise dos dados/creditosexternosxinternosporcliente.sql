--número de contratos interno x externo

with totalexterno as(
select
	 a.SK_ID_CURR
	,count(*) qtdcontratosexternos
from [bureau] a
where a.CREDIT_ACTIVE='Active'
group by a.SK_ID_CURR
--having count(*)>3
),

totalinternos as(
SELECT 
    a.SK_ID_CURR AS ID_Cliente
    ,COUNT(a.SK_ID_PREV) AS Total_Emprestimos_Internos
 FROM [dbo].[previous_application_clean] a
GROUP BY a.SK_ID_CURR

)
select

--credito interno

	case
		when coalesce(inte.Total_Emprestimos_Internos,0)=0 then 'Sem histórico interno'
		when inte.Total_Emprestimos_Internos between 1 and 3 then '1 a 3 contratos interno'
		else 'acima de 3 contratos interno'
	end as perfil_credito_interno,

--credito externo
case
when coalesce(ext.qtdcontratosexternos,0)=0 then 'Sem créditos externos'
when ext.qtdcontratosexternos between 1 and 3 then '1 a 3 créditos externos' 
else 'acima de 3 créditos externos'
end as perfil_crédito_externo,


	 count(distinct ina.SK_ID_CURR) as totalclientes
	,sum(cast(ina.target as int)) as totalinadimplentes
	,round(sum(cast(ina.target as float))*100/count(distinct ina.SK_ID_CURR),2) pec_inadimplentes

from [application_train_final] ina
left join totalexterno ext on ina.SK_ID_CURR=ext.SK_ID_CURR
left join totalinternos inte on ina.SK_ID_CURR=inte.ID_Cliente
group by case
		when coalesce(inte.Total_Emprestimos_Internos,0)=0 then 'Sem histórico interno'
		when inte.Total_Emprestimos_Internos between 1 and 3 then '1 a 3 contratos interno'
		else 'acima de 3 contratos interno'
	end,

--credito externo
case
when coalesce(ext.qtdcontratosexternos,0)=0 then 'Sem créditos externos'
when ext.qtdcontratosexternos between 1 and 3 then '1 a 3 créditos externos' 
else 'acima de 3 créditos externos'
end
ORDER BY perfil_crédito_externo DESC, Perfil_Credito_Interno DESC;
