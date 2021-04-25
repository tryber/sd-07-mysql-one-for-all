USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(userId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE history_total INT;
SELECT COUNT(*)
FROM rep_history
WHERE rep_history.user_id = userId INTO history_total;
RETURN history_total;
END $$
DELIMITER ;
