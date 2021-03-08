USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(userID INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE playbacksByUser INT;
    SELECT COUNT(*)
    FROM SpotifyClone.playbacks
    WHERE user_id = userID
    INTO playbacksByUser;
    RETURN playbacksByUser;
END $$

DELIMITER ;
