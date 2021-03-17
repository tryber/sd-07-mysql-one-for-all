USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(iduser int)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*)
    FROM SpotifyClone.plays
    WHERE SpotifyClone.plays.user_id = iduser INTO total;
    RETURN movie_total;
END $$

DELIMITER ;
