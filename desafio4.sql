CREATE VIEW `top_3_artistas` AS
SELECT 
  art.artist_name AS `artista`,
  COUNT(fl.artist_id) AS `seguidores` 
FROM 
(
  SpotifyClone.artist AS `art`
  INNER JOIN SpotifyClone.followers AS `fl` ON art.artist_id = fl.artist_id
)
GROUP BY
`artista`
ORDER BY 
`seguidores` DESC, `artista`ASC
LIMIT 3
; 
