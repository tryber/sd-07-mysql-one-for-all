create view historico_reproducao_usuarios as
select u.usuario as usuario, c.cancoe as nome
from SpotifyClone.reproducoes as r
inner join SpotifyClone.usuarios as u on u.usuario_id = r.usuario_id
inner join SpotifyClone.cancoes as c on c.cancoe_id = r.cancoe_id
order by u.usuario, c.cancoe;
