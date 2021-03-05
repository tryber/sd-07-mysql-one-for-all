CREATE VIEW cancoes_premium AS
SELECT m.nome_musica AS nome,
COUNT(h.musica_id) AS reproducoes
FROM SpotifyClone.historico_usuario AS h
INNER JOIN SpotifyClone.musicas AS m
ON m.id = h.musica_id
INNER JOIN SpotifyClone.usuarios AS u
ON u.id = h.usuario_id
WHERE u.plano_id <> 1
GROUP BY m.nome_musica
ORDER BY nome;
