DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(cancao_id) 
FROM SpotifyClone.historico_de_reproducoes
WHERE usuario_id=id
GROUP BY usuario_id
INTO total;
RETURN total;
END $$

DELIMITER ;
