CREATE VIEW top_3_artistas AS
SELECT
  ARTISTA.artista,
  COUNT(HISTORICO.usuario_id) AS "seguidores"
FROM SpotifyClone.usuarios_seguindo_artistas AS HISTORICO
INNER JOIN SpotifyClone.artistas AS ARTISTA
ON ARTISTA.artista_id = HISTORICO.artista_id
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 3;
