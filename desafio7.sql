SELECT 
SpotifyClone.seguindo.artista_id as "seguidores",
SpotifyClone.artista.artista,
SpotifyClone.album.album
FROM SpotifyClone.seguindo
inner join SpotifyClone.artista
on SpotifyClone.seguindo.artista_id = SpotifyClone.artista.id
inner join SpotifyClone.album
on SpotifyClone.seguindo.artista_id = SpotifyClone.album.id

