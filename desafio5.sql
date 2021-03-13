CREATE VIEW top_2_hits_do_momento AS
SELECT
m.nome AS cancao,
COUNT(h.musica_id) AS reproducoes
FROM
SpotifyClone.musica AS m
INNER JOIN SpotifyClone.historico AS h ON m.musica_id = h.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao 
LIMIT 2;
