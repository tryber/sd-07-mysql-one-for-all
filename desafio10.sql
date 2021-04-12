DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE music_total INT;
  SELECT COUNT(*)
  FROM SpotifyClone.user_history_songs
  JOIN users
  ON SpotifyClone.user_history_songs.user_id = SpotifyClone.users.id
  WHERE SpotifyClone.user_history_songs.user_id = user_id
  INTO music_total;
  RETURN music_total;
END $$
DELIMITER ;
