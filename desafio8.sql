USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON user
FOR EACH ROW
BEGIN
DELETE FROM rep_history
WHERE user_id = OLD.id;
DELETE FROM followed_artists
WHERE user_id = OLD.id;
END $$
DELIMITER ;
