DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(30))
BEGIN
  SELECT A.nome AS artista,
  AL.titulo AS album
  FROM SpotifyClone.artistas AS A
  INNER JOIN SpotifyClone.albuns AS AL ON A.artista_id = AL.artista_id
  WHERE A.nome = artist
  ORDER BY album;
END $$

DELIMITER ;
