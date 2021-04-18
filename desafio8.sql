DELIMITER //
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON spotifyclone.users
FOR EACH ROW
BEGIN
DELETE FROM spotifyclone.`history`
WHERE OLD.USER_ID = USER_ID;
DELETE FROM spotifyclone.followers
WHERE OLD.USER_ID = USER_ID;
END //
