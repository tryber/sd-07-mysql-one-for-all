create view top_3_artistas as 
select 
a.artista_nome as artista,
count(u.usuario_nome) as seguidores
from SpotifyClone.historico_de_seguidores as h
inner join SpotifyClone.usuarios as u
on h.usuario_id = u.usuario_id
inner join SpotifyClone.artistas as a
on a.artista_id = h.artista_id
group by a.artista_nome
order by 2 desc, 1
limit 3;
