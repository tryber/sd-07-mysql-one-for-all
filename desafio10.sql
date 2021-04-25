USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idUsuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE totalReproducoes INT;
SELECT COUNT(*) FROM SpotifyClone.historico_reproducoes
WHERE usuario_id = idUsuario
INTO totalReproducoes;
RETURN totalReproducoes;
END $$
DELIMITER ;
