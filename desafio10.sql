DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE mus_hist INT;
SELECT COUNT(h.user_id)
FROM SpotifyClone.reproduction_history AS h
INNER JOIN SpotifyClone.user AS u
ON u.user_id = h.user_id 
WHERE u.user_id = id
INTO mus_hist;
RETURN mus_hist;
END $$
DELIMITER ;
