USE SpotifyClone;

DELIMITER $$

CREATE function quantidade_musicas_no_historico(id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT COUNT(*)
FROM SpotifyClone.usuario_cancao AS ua
WHERE ua.usuario_id = id_usuario INTO quantidade_musicas_no_historico;
RETURN quantidade_musicas_no_historico;
END $$

DELIMITER ;
