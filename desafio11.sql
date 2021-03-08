CREATE VIEW cancoes_premium AS
SELECT c.nome AS cancao, COUNT(h.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN historico_reproducoes AS h
ON c.id = h.cancao_id
INNER JOIN usuarios AS u
ON u.id = h.usuario_id AND (u.plano_id = 2 OR u.plano_id = 3)
GROUP BY cancao
ORDER BY cancao;
