USE SpotifyClone;
DELIMITER //
CREATE FUNCTION quantidade_musicas_no_historico(id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas INT;
SELECT COUNT(cancao_id) 
FROM historico_reproducoes
WHERE id_usuario = usuario_id
INTO quantidade_musicas;
RETURN quantidade_musicas;
END //
DELIMITER ;
