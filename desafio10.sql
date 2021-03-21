USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_name VARCHAR(200))
RETURNS INT READS SQL DATA
BEGIN
DECLARE qty_reproductions INT;
SELECT COUNT(user_id) FROM user_songs_reproduction WHERE user_id = (SELECT user_id FROM `user` WHERE `name` = user_name) INTO qty_reproductions;
RETURN qty_reproductions;
END $$
DELIMITER ;
