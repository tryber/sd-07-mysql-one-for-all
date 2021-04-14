DELIMITER &&

CREATE FUNCTION quantidade_musicas_no_historico(userID INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas INT;
SELECT COUNT(*) FROM SpotifyClone.play_history
WHERE user_id = userID
GROUP BY user_id INTO quantidade_musicas;
RETURN quantidade_musicas;
END &&

DELIMITER ;
