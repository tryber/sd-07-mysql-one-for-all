DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.following_artist
WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.user_history_songs
WHERE user_id = OLD.user_id;
END $$
DELIMITER ;
