CREATE VIEW perfil_artistas AS
SELECT 
ar.nome_do_artista as artista,
al.nome_do_album as album,
COUNT(s.artista_id) as seguidores
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al
ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.seguidores s
ON ar.artista_id = s.artista_id
GROUP BY al.album_id
ORDER BY 3 DESC, 1, 2;
