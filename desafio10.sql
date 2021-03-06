DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
    RETURNS INT READS SQL DATA
    BEGIN
        DECLARE quant INT;
        SELECT COUNT(id_user)
            INTO quant
            FROM SpotifyClone.users_songs
            WHERE id_user = id;
        RETURN quant;
    END $$
    
DELIMITER ;
