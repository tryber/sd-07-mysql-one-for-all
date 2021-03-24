USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE count INT;
SELECT COUNT(cancao_id) AS quantidade_musicas_no_historico
FROM historico_de_reproducoes AS hist
INNER JOIN usuarios AS usr
ON usr.usuario_id = hist.usuario_id
WHERE usr.usuario_id = user_id INTO count;

RETURN count;
END $$

DELIMITER ;
