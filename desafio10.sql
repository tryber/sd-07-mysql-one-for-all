USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(IdUser INT)
RETURNS INT READS SQL DATA 
BEGIN
DECLARE qt_musicas_por_usuario  INT;
SELECT COUNT(*) AS "quantidade_musicas_no_historico"
FROM SpotifyClone.music_history AS music_history
WHERE music_history.user_id = IdUser INTO qt_musicas_por_usuario;
RETURN qt_musicas_por_usuario;
END $$

DELIMITER ;
