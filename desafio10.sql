USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantity INT;
SELECT COUNT(user_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.reproduction_history
WHERE user_id = id
    INTO quantity;
RETURN quantity;
END $$

DELIMITER ;
