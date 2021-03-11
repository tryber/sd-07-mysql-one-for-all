create view faturamento_atual as 
select round(min(valor_plano), 2) as faturamento_minimo,
round(max(valor_plano), 2) as faturamento_maximo,
round(avg(valor_plano), 2) as faturamento_medio,
round(sum(valor_plano), 2) as faturamento_total
from SpotifyClone.planos;
