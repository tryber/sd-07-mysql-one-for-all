DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuarioId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE music_qnt INT;
SELECT COUNT(*) FROM SpotifyClone.reproducoes AS rep
WHERE usuarioId = rep.usuario_id INTO music_qnt;
RETURN music_qnt;
END $$

DELIMITER ;
