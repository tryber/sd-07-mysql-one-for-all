DELIMITER $$

CREATE FUNCTION uantidade_musicas_no_historico(in_use_name VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
  DECLARE songs_total INT;
  SELECT COUNT(*) FROM SpotifyClone.Historic AS his
  INNER JOIN SpotifyClone.Users AS usr ON usr.use_id = his.use_id
  WHERE usr.use_name = in_use_name INTO songs_total;
  RETURN songs_total;
END $$

DELIMITER ;
