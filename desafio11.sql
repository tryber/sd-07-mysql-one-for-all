CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT songs.cancoes AS nome,
COUNT(historico.cancoes_id) AS reproducoes
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.historico
ON songs.cancoes_id = historico.cancoes_id
INNER JOIN SpotifyClone.users
ON users.usuario_id = historico.usuario_id
WHERE users.plano_id IN (2, 3)
GROUP BY nome
ORDER BY 1 asc;
