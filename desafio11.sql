CREATE VIEW cancoes_premium AS
SELECT
t1.nome AS 'nome',
COUNT(t2.usuario_id) AS 'reproducoes'
FROM
SpotifyClone.cancoes AS t1
INNER JOIN
SpotifyClone.historico_de_reproducoes AS t2 ON t1.cancao_id = t2.cancao_id
INNER JOIN
SpotifyClone.usuarios AS t3 ON t2.usuario_id = t3.usuario_id
INNER JOIN
SpotifyClone.planos AS t4 ON t3.plano_id = t4.plano_id
WHERE
t4.plano LIKE 'familiar' OR t4.plano LIKE 'universitário'
GROUP BY t1.nome
ORDER BY t1.nome;
