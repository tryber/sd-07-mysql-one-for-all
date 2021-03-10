USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usr_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE historico_total INT;
SELECT COUNT(*)
FROM historico_reproducao
WHERE usuario_id = usr_id
GROUP BY usuario_id INTO historico_total;
RETURN historico_total;
END $$
DELIMITER ;
