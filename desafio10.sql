USE SpotifyClone; 
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(ID_USUARIO INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade INT;
SELECT COUNT(musicas_id)
FROM historico
WHERE usuario_id = ID_USUARIO
INTO quantidade;
RETURN quantidade;
END $$
DELIMITER;
