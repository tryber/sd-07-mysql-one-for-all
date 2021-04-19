CREATE VIEW SpotifyClone.top_2_hits_do_momento AS 
SELECT mus.musica_nome AS "cancao",
COUNT(rep.musica_id) AS "reproducoes"
FROM SpotifyClone.musicas AS mus
INNER JOIN SpotifyClone.reproducoes AS rep
ON rep.musica_id = mus.musica_id
GROUP BY mus.musica_id
ORDER BY 2 DESC, 1
LIMIT 2;
