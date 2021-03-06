CREATE VIEW perfil_artistas AS
SELECT
a.artista_nome as 'artista',
al.album,
(SELECT COUNT(*) FROM SpotifyClone.seguindo s WHERE a.artista_id = s.artista_id) AS 'seguidores'
FROM SpotifyClone.albuns al
JOIN SpotifyClone.artistas a ON al.artista_id = a.artista_id
ORDER BY `seguidores` DESC, `artista`, al.album;
