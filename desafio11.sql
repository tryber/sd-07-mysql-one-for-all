CREATE VIEW cancoes_premium AS
SELECT c.cancoes_nome AS nome, COUNT(hr.cancoes_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes as hr
INNER JOIN SpotifyClone.cancoes AS c ON hr.cancoes_id = c.cancoes_id
INNER JOIN SpotifyClone.usuario AS u ON hr.usuario_id = u.usuario_id
WHERE u.plano_id IN (2, 3)
GROUP BY c.cancoes_nome
ORDER BY 1;
