CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT songs.cancoes AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.historico
ON songs.cancoes_id = historico.cancoes_id
GROUP BY songs.cancoes_id
ORDER BY 2 DESC, 1
LIMIT 2;
