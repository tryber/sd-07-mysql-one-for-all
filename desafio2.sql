create view estatisticas_musicais as
select count(distinct c.id_cancao)  as cancoes,
count(distinct a.id_artista) as artistas,
count(distinct al.id_album) as albuns
from SpotifyClone.cancoes c,
SpotifyClone.artistas a,
SpotifyClone.albuns al;
