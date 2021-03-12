DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
  SELECT 
    art.artista AS artista,
    alb.album AS album
  FROM SpotifyClone.artistas AS art
  INNER JOIN SpotifyClone.albuns AS alb
  ON art.id = alb.artista_id
  WHERE nome_artista = art.artista
  ORDER BY album;
END $$

DELIMITER ;
