create view historico_reproducao_usuarios as
select
usu.usuario as usuario,
can.cancao as nome
from SpotifyClone.reproducoes as rep
inner join SpotifyClone.usuarios as usu
on usu.usuario_id = rep.usuario_id
inner join SpotifyClone.cancoes as can
on can.cancao_id = rep.cancao_id
order by usu.usuario, can.cancao;
