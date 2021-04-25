USE SpotifyClone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_musicas INT;
SELECT COUNT(*) FROM SpotifyClone.historico_reproducoes
GROUP BY usuario_id
HAVING usuario_id = id_usuario INTO total_musicas;
RETURN total_musicas;
END $$

DELIMITER ;
