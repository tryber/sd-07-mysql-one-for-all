CREATE VIEW cancoes_premium AS
SELECT m.musica AS nome, count(h.musicas_id) AS reproducoes FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico AS h ON h.musicas_id = m.musicas_id
GROUP BY m.musica
ORDER BY m.musica;
