create view top_2_hits_do_momento as
select c.cancoe as cancao, count(u.usuario) as reproducoes
from SpotifyClone.reproducoes as r
inner join SpotifyClone.usuarios as u on u.usuario_id = r.usuario_id
inner join SpotifyClone.cancoes as c on c.cancoe_id = r.cancoe_id
group by cancoe
order by reproducoes desc, cancao
limit 2;
