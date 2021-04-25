DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE musica_total INT;
SELECT COUNT(song_id)
FROM SpotifyClone.user_history_songs
WHERE SpotifyClone.user_history_songs.user_id = user_id INTO musica_total;
RETURN musica_total;
END $$
DELIMITER ;
