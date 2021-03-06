DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(nome_usuario VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
DECLARE music_total INT;
DECLARE cod_usuario INT;

SELECT usuario_id FROM SpotifyClone.usuarios
WHERE usuario = nome_usuario INTO cod_usuario;

SELECT COUNT(*)
FROM SpotifyClone.historico_reproducao
WHERE usuario_id = cod_usuario INTO music_total;
RETURN music_total;
END $$
DELIMITER ;
