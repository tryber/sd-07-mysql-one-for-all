CREATE VIEW cancoes_premium AS
SELECT m.nome_musica AS nome,
COUNT(h.musica_id) AS reproducoes
FROM SpotifyClone.historico_usuario AS h
INNER JOIN SpotifyClone.musicas AS m
ON m.id = h.musica_id
GROUP BY m.nome_musica
ORDER BY nome;
