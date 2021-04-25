CREATE VIEW `top_2_hits_do_momento` AS
SELECT 
  mus.music_name AS `cancao`,
  COUNT(his.id_music) AS `reproducoes` 
FROM 
(
  SpotifyClone.musics AS `mus`
  INNER JOIN SpotifyClone.historys AS `his` ON mus.music_id = his.id_music
)
GROUP BY
`cancao`
ORDER BY 
`reproducoes` DESC, `cancao`ASC
LIMIT 2
; 
