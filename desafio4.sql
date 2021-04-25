CREATE VIEW top_3_artistas AS
SELECT artista_nome AS artista,
  COUNT(artista_nome) AS seguidores
FROM SpotifyClone.artistas AS table_artistas
  INNER JOIN SpotifyClone.seguidores AS table_seguidores ON table_artistas.artista_id = table_seguidores.artista_id
GROUP BY artista
ORDER BY seguidores DESC,
  artista ASC
LIMIT 3;
