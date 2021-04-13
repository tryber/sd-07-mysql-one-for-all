CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao AS cancao,
COUNT(c.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS h
ON h.cancao_id = c.cancao_id
GROUP BY cancao
ORDER BY 2 DESC, 1
LIMIT 2;
