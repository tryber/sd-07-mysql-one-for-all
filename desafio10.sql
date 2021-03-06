USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(ID INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantity INT;
SELECT COUNT(*)
FROM SpotifyClone.historico_de_reproducoes hr
WHERE hr.usuario_id = ID INTO quantity;
RETURN quantity;
END $$

DELIMITER ;
