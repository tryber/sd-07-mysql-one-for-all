create view faturamento_atual as
select min(p.valor_plano) as faturamento_minimo,
max(p.valor_plano) as faturamento_maximo,
round(avg(p.valor_plano), 2) as faturamento_medio,
sum(p.valor_plano) as faturamento_total
from SpotifyClone.planos p
inner join SpotifyClone.usuario u on u.id_plano = p.id_plano;
