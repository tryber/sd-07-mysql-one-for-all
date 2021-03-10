DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(in_use_id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE songs_total INT;
  SELECT COUNT(*) FROM SpotifyClone.Historic
  WHERE use_id = in_use_id INTO songs_total;
  RETURN songs_total;
END $$

DELIMITER ;
