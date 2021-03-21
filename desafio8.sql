USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON `user`
FOR EACH ROW
BEGIN
DELETE FROM user_artist ua WHERE ua.user_id = OLD.user_id;
DELETE FROM user_songs_reproduction usr WHERE usr.user_id = OLD.user_id;
END $$
DELIMITER ;
