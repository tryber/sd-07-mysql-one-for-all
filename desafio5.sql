CREATE VIEW top_2_hits_do_momento AS (
SELECT c.nome_cancao AS `cancao`,
COUNT(u.historico_id) AS `reproducoes`
FROM cancao AS `c`
INNER JOIN historico AS `h` ON c.nome_cancao = h.nome_reproducao
INNER JOIN usuario_historico AS `u` ON u.historico_id = h.historico_id
GROUP BY c.nome_cancao
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2
);
