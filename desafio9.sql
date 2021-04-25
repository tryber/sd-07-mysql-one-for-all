USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(50))
BEGIN
  SELECT Art.artist_name AS artista, Album.album_name AS album
  FROM SpotifyClone.Artists AS Art
  INNER JOIN SpotifyClone.Album AS Album
  ON Art.artist_id = Album.artist_id
  WHERE Art.artist_name = artist
  ORDER BY album;
END $$

DELIMITER ;
