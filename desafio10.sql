DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(musicas INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE quantidade_musicas INT;
  SELECT COUNT(*)
  FROM SpotifyClone.cancoes c
  WHERE c.cancao = musicas
  INTO quantidade_musicas;
  RETURN quantidade_musicas;
END $$

DELIMITER ;
