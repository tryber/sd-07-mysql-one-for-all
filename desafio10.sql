DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE resultado INT;
SELECT
COUNT(DISTINCT musica_id)
FROM SpotifyClone.historico_reproducao AS `use`
WHERE `use`.usuario_id = user_id  INTO resultado;
RETURN resultado;
END $$
DELIMITER ;
