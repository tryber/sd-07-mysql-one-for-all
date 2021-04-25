DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(cod_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE music_total INT;
SELECT COUNT(*)
FROM SpotifyClone.historico_reproducao
WHERE usuario_id = cod_usuario INTO music_total;
RETURN music_total;
END $$
DELIMITER ;
