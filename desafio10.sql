USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id_usuario int)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qnt_musicas_usuario INT;
    SELECT COUNT(*)
    FROM SpotifyClone.historico
    WHERE usuario_id = id_usuario INTO qnt_musicas_usuario;
    RETURN qnt_musicas_usuario;
END $$

DELIMITER ;
