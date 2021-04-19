USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id_user int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd_musicas INT;
SELECT COUNT(*)
FROM SpotifyClone.historico
WHERE usuario_id = id_user INTO qtd_musicas;
RETURN qtd_musicas;
END $$
DELIMITER ;
