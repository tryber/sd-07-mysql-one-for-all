CREATE VIEW cancoes_premium AS
SELECT
m.musica AS nome,
COUNT(h.musica_id) AS reproducoes
FROM
SpotifyClone.musica AS m
INNER JOIN SpotifyClone.historico AS h ON m.musica_id = h.musica_id
INNER JOIN SpotifyClone.usuario AS u ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.plano AS p ON u.plano_id = p.plano_id
WHERE p.plano IN ('familiar' , 'universitario')
GROUP BY nome
ORDER BY nome ASC;
