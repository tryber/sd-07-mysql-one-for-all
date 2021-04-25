CREATE VIEW top_2_hits_do_momento AS
SELECT
m.musica AS cancao,
COUNT(h.usuario_id) AS reproducoes
FROM SpotifyClone.historico AS h
INNER JOIN SpotifyClone.musicas AS m ON h.musicas_id = m.musicas_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
