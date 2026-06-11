use riscocredito
select * from [dbo].[vw_historico_interno]

select * from [dbo].[vw_perfil_cliente]
order by 2

select * from [dbo].[vw_resumo_bureau]

-- maior indice de inadimplentes por escolaridade e categoria de renda
select
	b.escolaridade
    ,CASE 
        WHEN b.renda <= 100000 THEN 'Baixa Renda'
        WHEN b.renda <= 200000 THEN 'Média-Baixa'
        WHEN b.renda <= 350000 THEN 'Média-Alta'
        ELSE 'Alta Renda'
    END as categoria_renda
    ,count(*) as totalinadimplentes
    ,sum(cast(a.target as int)) qtdinadimplente
    ,round(sum(cast(a.target as float))/count(*)*100,2) as indice


from [dbo].[application_train_final] a 
join [dbo].[vw_perfil_cliente] b on a.SK_ID_CURR=b.SK_ID_CURR
group by b.escolaridade,CASE 
        WHEN b.renda <= 100000 THEN 'Baixa Renda'
        WHEN b.renda <= 200000 THEN 'Média-Baixa'
        WHEN b.renda <= 350000 THEN 'Média-Alta'
        ELSE 'Alta Renda' 
    END
order by indice desc



