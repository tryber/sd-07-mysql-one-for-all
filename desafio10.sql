USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd_musics INT;
SELECT COUNT(usuario_id) FROM historico_reproducoes
WHERE usuario_id = user_id INTO qtd_musics;
RETURN qtd_musics;
END $$
DELIMITER ;
