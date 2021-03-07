CREATE VIEW cancoes_premium AS
SELECT
 musc.music_name AS `nome`,
 COUNT(hist.id_music) AS `reproducoes`
FROM
  SpotifyClone.musics AS `musc`
INNER JOIN
  SpotifyClone.historys AS `hist`
ON
  musc.music_id = hist.id_music
  
INNER JOIN
  SpotifyClone.user AS `usr`
ON
  usr.user_id = hist.id_user
  
INNER JOIN
  SpotifyClone.plan AS `pl`
ON
  pl.plan_id = usr.user_plan

WHERE
 pl.plan_name IN ('familiar','universitário')
GROUP BY
 `nome`
 ORDER BY
 `nome`ASC;
