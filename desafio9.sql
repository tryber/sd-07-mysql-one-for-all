DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN nome_artista VARCHAR(100))
BEGIN
  SELECT
    ARTISTAS.artista,
    ALBUNS.album
  FROM SpotifyClone.artistas AS ARTISTAS
  INNER JOIN SpotifyClone.albuns AS ALBUNS
  ON ALBUNS.artista_id = ARTISTAS.artista_id
  WHERE ARTISTAS.artista = nome_artista
  ORDER BY 2;
END $$
DELIMITER ;
