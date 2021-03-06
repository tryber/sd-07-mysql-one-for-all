USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.followers
WHERE SpotifyClone.users.user_id = OLD.followers.user_id;
DELETE FROM SpotifyClone.playbacks
WHERE SpotifyClone.users.user_id = OLD.playbacks.user_id;
END $$
DELIMITER ;
