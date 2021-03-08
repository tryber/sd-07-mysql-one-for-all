CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT c.nome AS nome, COUNT(uoc.cancao_id) AS reproducoes FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.usuario_ouve_cancao AS uoc ON c.id = uoc.cancao_id
LEFT JOIN SpotifyClone.usuarios AS u ON uoc.usuario_id = u.id
LEFT JOIN SpotifyClone.planos AS p ON u.plano_id = p.id
WHERE p.tipo IN ('familiar', 'universitário')
GROUP BY nome ORDER BY nome;
