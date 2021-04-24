CREATE VIEW cancoes_premium AS
SELECT c.nome_da_cancao AS nome, COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancao c
INNER JOIN SpotifyClone.historico_de_reproducao hr
ON c.cancao_id = hr.cancao_id
INNER JOIN SpotifyClone.usuario u
ON hr.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.plano p
ON u.plano_id = p.plano_id
WHERE u.usuario_id = hr.usuario_id AND u.plano_id = 2 OR u.plano_id = 3
GROUP BY c.nome_da_cancao
ORDER BY 1;
