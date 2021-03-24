CREATE VIEW top_3_artistas AS
SELECT 
    A.artist_name AS `artista`, 
    COUNT(*) AS `seguidores`
FROM followers F
    INNER JOIN artists A
    ON F.id_artist = A.id_artist
GROUP BY F.id_artist
ORDER BY `seguidores` DESC, `artista` LIMIT 3;
