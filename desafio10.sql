DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(username VARCHAR(10))
RETURNS INT READS SQL DATA
BEGIN
DECLARE musicCount INT;
SELECT COUNT(*) FROM SpotifyClone.playback_list AS p
INNER JOIN SpotifyClone.users AS u ON
p.user_id = u.user_id
WHERE u.user_name = username
INTO musicCount;
RETURN musicCount;
END $$

DELIMITER ;
