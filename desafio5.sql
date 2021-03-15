CREATE VIEW top_2_hits_do_momento AS 
SELECT MUSICA.song_title AS 'cancao', 
COUNT(LISTA.user_id) AS 'reproducoes' 
FROM SpotifyClone.song AS MUSICA
INNER JOIN SpotifyClone.history_reproduction AS LISTA
ON LISTA.song_id = MUSICA.id
GROUP BY MUSICA.id
ORDER BY COUNT(LISTA.user_id) DESC,  MUSICA.song_title limit 2;
