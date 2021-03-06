CREATE VIEW top_2_hits_do_momento AS 
SELECT m.musica AS cancao , COUNT(h.musicas_id) AS reproducoes FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico AS h ON h.musicas_id = m.musicas_id
GROUP BY  m.musica
ORDER BY COUNT(h.musicas_id) DESC,m.musica limit 2;
