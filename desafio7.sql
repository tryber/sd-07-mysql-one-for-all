CREATE VIEW perfil_artistas AS 
SELECT a.artista, ab.album , count(s.usuario_id) seguidores FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS ab ON ab.artista_id = a.artista_id
INNER JOIN SpotifyClone.seguidores AS s ON ab.artista_id = s.artista_id
GROUP BY artista, album
ORDER BY count(s.usuario_id) DESC, a.artista , ab.album ;
