CREATE VIEW cancoes_premium AS
SELECT c.nome_da_cancao AS nome, COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancao c
INNER JOIN SpotifyClone.historico_de_reproducao hr
ON c.cancao_id = hr.cancao_id
INNER JOIN SpotifyClone.usuario us
ON hr.usuario_id = us.usuario_id
INNER JOIN SpotifyClone.plano p
ON us.plano_id = p.plano_id
WHERE us.usuario_id = hr.usuario_id AND us.plano_id = 2 OR us.plano_id = 3
GROUP BY c.nome_da_cancao
ORDER BY 1;
