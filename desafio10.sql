DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(searchUser_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE resultado INT;
SELECT
COUNT(DISTINCT song_id)
FROM history AS `his`
WHERE `his`.user_id = searchUser_id  INTO resultado;
RETURN resultado;
END $$
DELIMITER ;
