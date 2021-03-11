create view top_3_artistas as
select a.artista as artista, count(a.artista) as seguidores
from SpotifyClone.seguindo as s
inner join SpotifyClone.artistas as a on a.artista_id = s.artista_id
group by artista
order by seguidores desc, artista
limit 3;
