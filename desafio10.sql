-- USE SpotifyClone;

-- DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(search_user VARCHAR(50))
RETURNS INT READS SQL DATA
  BEGIN
    DECLARE history_sum INT;
    SELECT COUNT(*)
    FROM history AS h
    JOIN users AS u
      ON h.user_id = u.user_id
    WHERE u.name = CONCAT('%', search_user, '%')
    INTO history_sum;
    RETURN history_sum;
  END $$

DELIMITER ;

-- SELECT quantidade_musicas_no_historico('Bill');
