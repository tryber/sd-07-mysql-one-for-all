DELIMITER $$
CREATE FUNCTION `quantidade_musicas_no_historico`(`param_id_usuario` VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd INT;
SELECT COUNT(U.usuario_id)
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H ON H.usuario_id = U.usuario_id
WHERE U.usuario_id = `param_id_usuario`
INTO qtd;
RETURN qtd;
END $$
DELIMITER ;
