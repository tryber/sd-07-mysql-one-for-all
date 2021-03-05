CREATE VIEW top_2_hits_do_momento AS
SELECT m.musica AS cancao, COUNT(h.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historicos AS h ON h.musica_id = m.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
limit 2;
