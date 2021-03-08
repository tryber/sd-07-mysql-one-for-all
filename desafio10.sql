USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION retorna_usuario_id(user_name VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
		DECLARE id_user INT;
    SELECT usuario_id FROM usuario 
    WHERE nome = user_name INTO id_user;
    RETURN id_user;
END $$
DELIMITER ;

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

SELECT quantidade_musicas_no_historico(retorna_usuario_id('Bill'));
