DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(`targetUser` varchar(50))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE musicCount INT;
    SELECT COUNT(*)
    FROM SpotifyClone.`history` as h
    inner join SpotifyClone.users u
    on h.user_id = u.user_id
    WHERE u.user_id = targetUser INTO musicCount;
    RETURN musicCount;
END $$

DELIMITER ;
