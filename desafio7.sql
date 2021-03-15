SELECT 
count(SpotifyClone.seguindo.artista_id) as "seguidores",
SpotifyClone.artista.artista
FROM SpotifyClone.seguindo
inner join SpotifyClone.artista
on SpotifyClone.seguindo.artista_id = SpotifyClone.artista.id
group by SpotifyClone.artista.artista