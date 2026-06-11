-- analisando se clientes alavancados no mercado, possui chance maior de inadimplir
with analisecliente as(
select
	 a.SK_ID_CURR
	,count(a.SK_ID_BUREAU) qtdcontratosexternos
	,max(cast(b.target as int)) as inadiplenteinterno
from [bureau] a
join [dbo].[application_train_final] b on a.SK_ID_CURR=b.SK_ID_CURR
where a.CREDIT_ACTIVE='Active'
group by a.SK_ID_CURR
)
select
	case
		when qtdcontratosexternos>3 then 'mais de 3 creditos ativos'
		else 'menor ou igual a três créditos ativos'
	end as perfil_do_cliente
	,count(*) as totalclientes
	,sum(inadiplenteinterno) as total_inadiplentes
	,round(avg(cast(inadiplenteinterno as float))*100,2) as taxa_inadimplente
from analisecliente
group by case
		when qtdcontratosexternos>3 then 'mais de 3 creditos ativos'
		else 'menor ou igual a três créditos ativos'
	end;
