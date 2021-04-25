create view perfil_artistas as
select a.nome_artista as artista,
al.album as album,
count(sa.id_artista) as seguidores
from SpotifyClone.artistas a
inner join SpotifyClone.albuns al on a.id_artista = al.id_artista
inner join SpotifyClone.seguindo_artistas sa on sa.id_artista = a.id_artista
group by al.id_album
order by 3 desc, 1, 2;
