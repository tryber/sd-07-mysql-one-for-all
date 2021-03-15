CREATE VIEW SpotifyClone.top_3_artistas AS 
SELECT art.artista_nome AS "artista",
COUNT(seg.usuario_id) AS "seguidores"
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.seguindo AS seg
ON seg.artista_id = art.artista_id
GROUP BY art.artista_nome
ORDER BY 2 DESC, 1
LIMIT 3;
