USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id_m INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qty_reproductions INT;
SELECT COUNT(user_id) FROM user_songs_reproduction WHERE user_id = user_id_m INTO qty_reproductions;
RETURN qty_reproductions;
END $$
DELIMITER ;
