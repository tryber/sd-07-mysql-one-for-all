USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT(11))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE Qtde INT;
SELECT
COUNT(usuario_id)
FROM
historico
WHERE usuario_id = id INTO Qtde;
RETURN Qtde;
END
$$
DELIMITER ;
