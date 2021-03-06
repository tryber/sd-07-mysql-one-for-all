create view faturamento_atual as select
round(min(p.price_plano),2) as faturamento_minimo,
round(max(p.price_plano),2) as faturamento_maximo,
round(avg(p.price_plano),2) as faturamento_medio,
round(sum(p.price_plano),2) as faturamento_total
from spotifyclone.usuario t1
inner join spotifyclone.planos t2 where p.idplanos = u.planos_idplanos;
