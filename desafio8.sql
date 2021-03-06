USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
	AFTER DELETE ON SpotifyClone.Users
	FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.Following
    WHERE user_id = OLD.user_id;
    DELETE FROM SpotifyClone.Music_history
    WHERE user_id = OLD.user_id;
END $$
DELIMITER ;