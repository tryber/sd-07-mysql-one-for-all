CREATE VIEW top_2_hits_do_momento AS
SELECT cancao,
COUNT(historicos.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS cancoes
INNER JOIN SpotifyClone.historicos AS historicos ON historicos.cancao_id = cancoes.id
GROUP BY historicos.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
