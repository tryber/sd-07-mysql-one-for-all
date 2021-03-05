CREATE VIEW top_2_hits_do_momento AS
SELECT
s.nome_musica AS cancoes,
COUNT(r.musica_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN
SpotifyClone.reproductions AS r
ON
s.musica_id = r.musica_id
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 2;
