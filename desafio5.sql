CREATE VIEW top_2_hits_do_momento AS SELECT 
Sc.song_colum AS cancao , COUNT(H.song_id) as reproducoes FROM songs AS Sc
INNER JOIN history AS H ON Sc.song_id = H.song_id
GROUP BY cancao 
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
