CREATE VIEW `perfil_artistas` AS
SELECT 
  art.artist_name AS `artista`,
  alb.album_name AS `album`,
  COUNT(fl.artist_id) AS `seguidores`
FROM 
  SpotifyClone.artist AS `art`
  INNER JOIN SpotifyClone.albums AS `alb` ON alb.album_id = art.id_album
  INNER JOIN SpotifyClone.followers AS `fl` ON art.artist_id = fl.artist_id

GROUP BY 
fl.artist_id
ORDER BY 
`seguidores` DESC, `artista`ASC, `album` ASC
;
