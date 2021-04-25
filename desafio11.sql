CREATE VIEW cancoes_premium AS
SELECT c.cancao AS nome, COUNT(uc.usuario_id) AS reproducoes
FROM SpotifyClone.usuario_cancao AS uc
INNER JOIN SpotifyClone.cancoes AS c ON uc.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios AS u ON uc.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.planos AS p ON u.plano_id = p.plano_id
WHERE u.plano_id NOT LIKE 1
GROUP BY nome
ORDER BY nome;
