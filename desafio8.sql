DELIMITER //
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.`history`
WHERE OLD.USER_ID = USER_ID;
DELETE FROM SpotifyClone.followers
WHERE OLD.USER_ID = USER_ID;
END //
