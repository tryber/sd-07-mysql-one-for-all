CREATE VIEW top_2_hits_do_momento AS 
SELECT c.nome AS cancao, COUNT(h.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN historico_reproducoes AS h
ON c.id = h.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
