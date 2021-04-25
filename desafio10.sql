USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(userId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE songs_history INT;
SELECT COUNT(*)
FROM SpotifyClone.playedMusicHistory AS h
WHERE userID = user_id INTO songs_history;
RETURN songs_history;
END $$
DELIMITER;
