create view top_3_artistas as select
art.artista,
count(*) as seguidores
from SpotifyClone.seguindo as seg
inner join SpotifyClone.artistas as art
on art.artista_id = seg.artista_id
group by seg.artista_id
order by seguidores desc
limit 3;
