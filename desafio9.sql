DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(300))
BEGIN
    SELECT ARTISTA.artist_name AS 'artista', 
    ALBUM.album_title AS 'album'
   FROM SpotifyClone.artist AS ARTISTA
   INNER JOIN SpotifyClone.album AS ALBUM
   WHERE ALBUM.artist_id = ARTISTA.id
   AND ARTISTA.artist_name = nomeArtista
   ORDER BY ALBUM.album_title;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
