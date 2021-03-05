CREATE VIEW top_2_hits_do_momento AS
SELECT t1.musica AS 'cancao',
COUNT(t2.usuario_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS t1
INNER JOIN SpotifyClone.historico_reproducao AS t2
ON t1.musica_id = t2.musica_id
GROUP BY t1.musica
ORDER BY 2 DESC, 1 ASC
LIMIT 2;
