USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(255))
BEGIN
  SELECT A.artist_name AS artista, alb.album_name AS album
  FROM SpotifyClone.artists AS a
    JOIN SpotifyClone.albums AS album
    on album.artist_id = a.id
  WHERE a.artist_name = nome
  ORDER BY 'album';
END $$

DELIMITER ;
