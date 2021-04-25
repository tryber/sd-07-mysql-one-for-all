CREATE VIEW top_2_hits_do_momento AS
SELECT
cancoes.cancao AS cancao,
COUNT(historico_reproducoes.cancoes_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS historico_reproducoes
INNER JOIN SpotifyClone.cancoes AS cancoes
ON cancoes.cancoes_id = historico_reproducoes.cancoes_id
GROUP BY historico_reproducoes.cancoes_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
