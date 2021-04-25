CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancoes_nome AS cancao, COUNT(hr.cancoes_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes as hr
INNER JOIN SpotifyClone.cancoes AS c ON hr.cancoes_id = c.cancoes_id
GROUP BY hr.cancoes_id
ORDER BY 2 DESC, 1 LIMIT 2;
