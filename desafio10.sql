DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (user_indent INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE music_result INT;
    SELECT
    COUNT(id_music)
    FROM 
    SpotifyClone.historys AS `hist`
    WHERE 
    hist.id_user = user_indent
    INTO music_result;
    RETURN music_result;
    
END $$

DELIMITER ;
