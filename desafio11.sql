create view cancoes_premium as select
t2.nome as nome, count(t2.id_cancao) as reproducoes
from SpotifyClone.historico_reproducoes as t1
inner join SpotifyClone.cancoes as t2 on t2.id_cancao = t1.id_cancao
inner join SpotifyClone.usuarios as t3 on t3.id_usuario = t1.id_usuario
where t3.id_plano in (2,3) group by t2.nome order by t2.nome
