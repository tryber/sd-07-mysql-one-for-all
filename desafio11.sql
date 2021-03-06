CREATE VIEW cancoes_premium AS
SELECT
m.musica AS nome,
COUNT(h.usuario_id) AS reproducoes
FROM SpotifyClone.historico AS h
INNER JOIN SpotifyClone.usuarios AS u ON h.usuario_id = u.usuario_id AND u.plano_id IN (1, 2)
INNER JOIN SpotifyClone.musicas AS m ON h.musicas_id = m.musicas_id
GROUP BY nome
ORDER BY nome;
