create view top_3_artistas as
select a.artista as artista, count(a.artista) as seguidores
from SpotifyClone.usuarios as u
inner join SpotifyClone.seguindo as s on u.usuario_id = s.usuario_id
inner join SpotifyClone.artistas as a on a.artista_id = s.artista_id
group by artista
order by seguidores desc, artista
limit 3;
