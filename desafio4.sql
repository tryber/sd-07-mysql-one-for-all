create view top_3_artistas as
select a.nome_artista as artista,
count(sa.id_usuario) as seguidores
from SpotifyClone.artistas a
inner join SpotifyClone.seguindo_artistas sa on sa.id_artista = a.id_artista
group by `artista` order by `seguidores` desc, `artista` limit 3;
