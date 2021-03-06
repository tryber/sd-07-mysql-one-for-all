create view faturamento_atual as 
select
min(t2.valor_plano) as faturamento_minimo,
max(t2.valor_plano) as faturamento_maximo,
round(avg(t2.valor_plano),2) as faturamento_medio,
round(sum(t2.valor_plano),2) as faturamento_total
from SpotifyClone.usuarios t1
inner join SpotifyClone.planos t2 where t2.id_plano = t1.id_plano;
