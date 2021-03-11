SELECT songs.cancao AS cancao,
count(history.cancao_id) AS reproducoes
FROM SpotifyClone.historico AS `history`
INNER JOIN SpotifyClone.cancoes AS songs
ON history.cancao_id = songs.cancao_id
GROUP BY history.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
