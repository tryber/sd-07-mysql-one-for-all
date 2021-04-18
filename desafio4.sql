CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT a.`nome_artista` AS `artista`,
  COUNT(s.`artista_id`) AS `seguidores`
FROM SpotifyClone.seguidores AS s
  INNER JOIN SpotifyClone.artistas AS a ON a.`artista_id` = s.`artista_id`
  JOIN SpotifyClone.usuarios AS u ON u.`usuario_id` = s.`usuario_id`
GROUP BY s.`artista_id`
ORDER BY `seguidores` DESC,
  `artista`
LIMIT 3;
