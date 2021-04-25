DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id_parametro VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(U.usuario_nome)
FROM Usuarios AS U
INNER JOIN Historico_Usuarios AS H
ON H.fk_usuario_id = U.usuario_id
WHERE U.usuario_id = id_parametro
INTO total;
RETURN total;
END $$

DELIMITER ;
