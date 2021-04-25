create view perfil_artistas as 
select 
ar.artista_nome as artista,
al.album_titulo as album,
count(*) as seguidores
from SpotifyClone.albuns as al
inner join SpotifyClone.artistas as ar
on al.artista_id = ar.artista_id
inner join SpotifyClone.historico_de_seguidores as h
on ar.artista_id = h.artista_id
group by al.album_titulo, ar.artista_nome
order by 3 desc, 1 ,2;
