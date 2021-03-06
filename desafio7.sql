create view perfil_artistas as select 
t2.artista, album,
count(t1.id_artista) as seguidores
from SpotifyClone.seguindo_artistas as t1
join SpotifyClone.artistas as t2 on t2.id_artista = t1.id_artista
join SpotifyClone.albuns as t3 on t3.id_artista = t1.id_artista
group by t2.artista, t3.album
order by seguidores desc, t2.artista, t3.album;
