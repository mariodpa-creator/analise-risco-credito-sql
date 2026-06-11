--tipos de contratos externos mais inadiplentes
select
	a.CREDIT_TYPE
	,count(*) totalcontratosgeral
	,sum(cast(b.target as int)) totalinadimplentes
	,cast(sum(cast(b.target as int))*100.0/count(*) as decimal(10,2)) percentual
from [dbo].[bureau] a
join [dbo].[application_train_final] b on a.SK_ID_CURR=b.SK_ID_CURR
group by a.CREDIT_TYPE
order by percentual desc
