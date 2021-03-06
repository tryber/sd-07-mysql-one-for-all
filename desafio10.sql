DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(userId int)
RETURNS INT READS SQL DATA 

BEGIN
DECLARE total INT;
SELECT COUNT(*) FROM SpotifyClone.historico_reproducoes AS t1
INNER JOIN SpotifyClone.usuarios AS t2 ON t1.id_usuario = t2.id_usuario
WHERE t2.id_usuario = userId INTO total;
RETURN total;
END $$

DELIMITER ;
