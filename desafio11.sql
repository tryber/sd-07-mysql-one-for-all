create view cancoes_premium as select
can.cancao as nome, count(can.cancao_id) as reproducoes
from SpotifyClone.reproducoes as rep
inner join SpotifyClone.cancoes as can on can.cancao_id = rep.cancao_id
inner join SpotifyClone.usuarios as usu on usu.usuario_id = rep.usuario_id
where usu.plano_id in (2,3) group by can.cancao order by can.cancao
