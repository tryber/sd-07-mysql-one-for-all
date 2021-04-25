USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE historico_total INT;
SELECT COUNT(*)
FROM SpotifyClone.historico_usuario
WHERE usuario_id = id
GROUP BY usuario_id INTO historico_total;
RETURN historico_total;
END $$

DELIMITER ;
