
--Conversão Interna: Qual o percentual de aprovação de novos empréstimos por tipo de contrato?
--ex.: Emprestimo em dinheiro, financiamento ao consumidor, credito rotativo, 

select 
	NAME_CONTRACT_TYPE
	,count(*) as totalpropostas
	,sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as totalaprovado
	,round(cast(sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as float)/count(*)*100,2) percentual_aprovação
from [dbo].[agreg_previous_application]
group by NAME_CONTRACT_TYPE


--Aprovação para clientes com venda cruzada, que já possuiam outro credito na instituição
--clientes com produtos ativos, tendem a ser aprovados
select 
	NAME_CONTRACT_TYPE
	,NAME_PRODUCT_TYPE
	,count(*) as totalpropostas
	,sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as totalaprovado
	,round(cast(sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as float)/count(*)*100,2) percentual_aprovação
from [dbo].[agreg_previous_application]
WHERE 
    NAME_PRODUCT_TYPE = 'X-SELL'
group by NAME_CONTRACT_TYPE,NAME_PRODUCT_TYPE

--Aprovação para clientes novos
select 
	NAME_CONTRACT_TYPE
	,NAME_PRODUCT_TYPE
	,count(*) as totalpropostas
	,sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as totalaprovado
	,round(cast(sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as float)/count(*)*100,2) percentual_aprovação
from [dbo].[agreg_previous_application]
WHERE 
    NAME_PRODUCT_TYPE = 'Walk-in'
group by NAME_CONTRACT_TYPE,NAME_PRODUCT_TYPE

-- OS DADOS CONSOLIDADOS
--unificando as querys

select 
	NAME_CONTRACT_TYPE
	,NAME_PRODUCT_TYPE
	,count(*) as totalpropostas
	,sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as totalaprovado
	,round(cast(sum( case when NAME_CONTRACT_STATUS='Approved' then 1 else 0 end) as float)/count(*)*100,2) percentual_aprovação
from [dbo].[agreg_previous_application]
WHERE 
    NAME_PRODUCT_TYPE IN  ('Walk-in','X-SELL')
group by NAME_CONTRACT_TYPE,NAME_PRODUCT_TYPE
ORDER BY NAME_CONTRACT_TYPE ASC, percentual_aprovação DESC

