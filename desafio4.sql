create view top_3_artistas as
select a.artista as artista, count(u.usuario_id) as seguidores
from SpotifyClone.seguindo as s
inner join SpotifyClone.artistas as a on a.artista_id = s.artista_id
inner join SpotifyClone.usuarios as u on u.usuario_id = s.usuario_id
group by artista
order by seguidores desc, artista
limit 3;
