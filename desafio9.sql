DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN name_artists VARCHAR(50)) 
BEGIN SELECT art.name_artists AS "artista",
alb.name_album AS "album"
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS alb
ON alb.artist_id = art.artist_id
WHERE art.name_artists = name_artists
ORDER BY `album`;
END $$
DELIMITER ;
