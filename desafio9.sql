USE SpotifyClone
DELIMITER $$ 
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100))
  BEGIN
  SELECT 
    A.artista AS 'artista',
    AL.album AS 'album'
  FROM
    SpotifyClone.artistas AS A
  INNER JOIN
    albuns AS AL
      ON A.artista_id = AL.artista_id
  WHERE A.artista= artista
  ORDER BY AL.album;
  END;
$$ DELIMITER ;
