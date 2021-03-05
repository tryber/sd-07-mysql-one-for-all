create view faturamento_atual as select
round(min(plan.valor), 2) as faturamento_minimo,
round(max(plan.valor), 2) as faturamento_maximo,
round(avg(plan.valor), 2) as faturamento_medio,
round(sum(plan.valor), 2) as faturamento_total
from SpotifyClone.usuarios as usu
inner join SpotifyClone.planos as plan
on usu.plano_id = plan.plano_id;
