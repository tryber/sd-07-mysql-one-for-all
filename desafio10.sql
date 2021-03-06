USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE playback_total INT;
    SELECT COUNT(*)
    FROM SpotifyClone.playbacks p
    
    INNER JOIN SpotifyClone.users u
    ON p.user_id = u.user_id
    
    WHERE u.user_id = id INTO playback_total;
    RETURN playback_total;
END $$

DELIMITER ;
