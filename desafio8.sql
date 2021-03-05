DROP TRIGGER IF EXISTS SpotifyClone.trigger_usuario_delete;

USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE 
ON SpotifyClone.users FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.users_follow_artists
WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.users_history_songs
WHERE user_id = OLD.user_id;
END $$

DELIMITER ;
