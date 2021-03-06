DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qty_songs INT;
    SELECT COUNT(h.song_id)
    FROM SpotifyClone.history h
    WHERE h.user_id = user_id
    INTO qty_songs ;
    RETURN qty_songs;
END $$
DELIMITER ;
