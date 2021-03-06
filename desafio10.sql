USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE history INT;
  SELECT COUNT(user_id) AS quantidade_musicas_no_historico 
  FROM SpotifyClone.Music_history
  WHERE user_id = user INTO history;
  RETURN history;
END $$

DELIMITER ;
