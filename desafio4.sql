CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT
a.artista_nome AS 'artista',
COUNT(*) AS 'seguidores'
FROM SpotifyClone.seguindo s
JOIN SpotifyClone.artistas a ON s.artista_id = a.artista_id
GROUP BY a.artista_nome
ORDER BY `seguidores` DESC
LIMIT 3;
