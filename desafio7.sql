create view perfil_artistas as
select ar.artista as artista,
al.album as album,
count(s.usuario_id) as seguidores
from SpotifyClone.albums as al
inner join SpotifyClone.artistas as ar on ar.artista_id = al.artista_id
inner join SpotifyClone.seguindo as s on al.artista_id = s.artista_id
group by artista, album
