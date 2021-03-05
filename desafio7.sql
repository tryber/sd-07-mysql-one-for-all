create view perfil_artistas as select
art.artista,
alb.album,
(select count(*) from SpotifyClone.seguindo as seg
where seg.artista_id = alb.artista_id) as seguidores
from SpotifyClone.albuns as alb
inner join SpotifyClone.artistas as art
on art.artista_id = alb.artista_id
order by seguidores desc, art.artista, alb.album;
