--perfil cliente na instituição
create view vw_perfil_cliente as
select
 [SK_ID_CURR]
,[AMT_INCOME_TOTAL] as renda
,cast(abs([DAYS_BIRTH])/365.25 as int) as idade
,[NAME_EDUCATION_TYPE] as escolaridade
,[NAME_HOUSING_TYPE] as moradia
,cast(abs([DAYS_EMPLOYED])/365.25 as int) as tempoemprego
,[OCCUPATION_TYPE] as ocupacao
,[CNT_CHILDREN] as nfilhos
,[NAME_FAMILY_STATUS] as estadocivil 
,[CNT_FAM_MEMBERS] as npessoasfamilia
,FLAG_OWN_CAR as possuicarro
,FLAG_OWN_REALTY as possuicasa
,REGION_RATING_CLIENT as regiaomoradia
from [dbo].[application_train_final]

--perfil cliente externo
create view vw_resumo_bureau as
select 
[SK_ID_CURR]
,[totalcontratos]
,[totalcredito]
,[totaldivida]
,abs([diasultatualizacao]) as diasultatualizacao


from [bureau_final_cliente]

--perfil cliente interno
create view vw_historico_interno as 
select 
[SK_ID_CURR]
,sum(case when [NAME_CONTRACT_STATUS]='approved' then 1 else 0 end) qtdaprovado
,sum(case when [NAME_CONTRACT_STATUS]='refused' then 1 else 0 end) qtdreprovado
,count([SK_ID_CURR]) as totalemprestimo
from [previous_application_clean]
group by [SK_ID_CURR]


