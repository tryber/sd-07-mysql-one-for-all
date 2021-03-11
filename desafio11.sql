CREATE VIEW cancoes_premium AS
SELECT songs.cancao AS nome,
COUNT(history.cancao_id) AS reproducoes
FROM SpotifyClone.historico AS history
INNER JOIN SpotifyClone.cancoes AS songs
ON history.cancao_id = songs.cancao_id
INNER JOIN SpotifyClone.usuarios AS users
ON history.usuario_id = users.usuario_id
WHERE users.plano_id = 2 OR users.plano_id = 3
GROUP BY nome
ORDER BY nome;
