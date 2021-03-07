CREATE VIEW perfil_artistas AS
SELECT art.artista, alb.album, COUNT(usuario_id) AS seguidores
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
INNER JOIN SpotifyClone.usuario_artista AS ua ON art.artista_id = ua.artista_id
GROUP BY alb.album_id
ORDER BY seguidores DESC, art.artista, alb.album;
