create view faturamento_atual as 
select
min(p.plano_preço) as faturamento_minimo,
max(p.plano_preço) as faturamento_maximo,
round (avg(p.plano_preço),2) as faturamento_medio,
sum(p.plano_preço) as faturamento_total
from SpotifyClone.planos as p
inner join SpotifyClone.usuarios as u
on p.plano_id = u.plano_id;
