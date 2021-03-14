CREATE VIEW top_2_hits_do_momento AS
SELECT
t1.nome AS 'cancao',
COUNT(t2.usuario_id) AS 'reproducoes'
FROM
SpotifyClone.cancoes AS t1
INNER JOIN
SpotifyClone.historico_de_reproducoes AS t2 ON t1.cancao_id = t2.cancao_id
GROUP BY t1.nome
ORDER BY `reproducoes` DESC, t1.nome
LIMIT 2;
