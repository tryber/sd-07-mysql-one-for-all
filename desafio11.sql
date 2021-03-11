CREATE VIEW cancoes_premium AS
SELECT c.nome AS nome, COUNT(hr.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN historico_reproducoes AS hr
ON c.id = hr.cancao_id
INNER JOIN usuarios AS u
ON u.id = hr.usuario_id AND (u.plano_id = 2 OR u.plano_id = 3)
GROUP BY nome
ORDER BY nome;
