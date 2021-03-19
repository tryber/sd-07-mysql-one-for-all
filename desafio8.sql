USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE
ON `user`
FOR EACH ROW
BEGIN
	DELETE FROM rep_history
	WHERE user_id = OLD.user_id;
	DELETE FROM SpotifyClone.followed_artists
	WHERE user_id = OLD.user_id;
END
DELIMITER $$ ;
