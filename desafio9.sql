USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN 
  SELECT art.artista, alb.album FROM SpotifyClone.artistas AS art
  INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
  WHERE art.artista = nome_artista;
END $$
DELIMITER ;
