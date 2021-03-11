DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(findId  INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE resultado INT;
SELECT
COUNT(DISTINCT song_id)
FROM history AS `his`
WHERE `his`.user_id = findId   INTO resultado;
RETURN resultado;
END $$
DELIMITER ;
