DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.users
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.user_history_songs where SpotifyClone.user_history_songs.user_id = OLD.id;
  DELETE FROM SpotifyClone.following_artists where SpotifyClone.following_artists.user_id = OLD.id;
END $$
DELIMITER ;
