CREATE VIEW cancoes_premium AS
SELECT c.cancao AS nome,
COUNT(h.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_de_reproducoes AS h
ON h.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios AS u
ON h.usuario_id = u.usuario_id
WHERE u.plano_id in (2, 3)
GROUP BY 1
ORDER BY 1;
