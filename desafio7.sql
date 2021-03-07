CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT a.`nome_artista` AS `artista`,
	al.`nome_album` AS `album`,
  COUNT(s.`artista_id`) AS `seguidores`
FROM SpotifyClone.seguidores AS s
  INNER JOIN SpotifyClone.artistas AS a ON a.`artista_id` = s.`artista_id`
  JOIN SpotifyClone.usuarios AS u ON u.`usuario_id` = s.`usuario_id`
  JOIN SpotifyClone.albuns AS al ON al.`artista_id` = a.`artista_id`
GROUP BY al.`album_id`
ORDER BY `seguidores` DESC,
  `artista`,
  `album`;
