USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(codigo_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE quantidade_de_musicas INT;
    SELECT COUNT(musica_id) FROM SpotifyClone.historicos
    WHERE codigo_usuario = usuario_id
    INTO quantidade_de_musicas;
    RETURN quantidade_de_musicas;
END $$

DELIMITER ;
