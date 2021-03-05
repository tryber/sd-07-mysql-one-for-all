USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM followers
WHERE user_id = OLD.user_id;
DELETE FROM playbacks
WHERE user_id = OLD.user_id;
END $$
DELIMITER ;
