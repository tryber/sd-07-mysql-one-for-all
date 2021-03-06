create view top_3_artistas as select
t2.artista, count(*) as seguidores
from SpotifyClone.seguindo_artistas as t1
inner join SpotifyClone.artistas as t2
on t1.id_artista = t2.id_artista
group by t1.id_artista
order by seguidores desc, t2.artista
limit 3;
