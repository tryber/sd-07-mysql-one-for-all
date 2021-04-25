CREATE VIEW cancoes_premium AS
SELECT
cancao AS 'nome',
COUNT(*)
AS 'reproducoes'
FROM SpotifyClone.cancoes c
LEFT JOIN SpotifyClone.historico_de_reproducoes hr ON c.cancao_id = hr.cancao_id
LEFT JOIN SpotifyClone.usuarios u ON hr.usuario_id = u.usuario_id
LEFT JOIN SpotifyClone.planos p ON u.plano_id = p.plano_id
WHERE hr.cancao_id = c.cancao_id
AND p.plano IN ('familiar', 'universitário')
GROUP BY cancao
ORDER BY `nome`;
