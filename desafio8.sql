USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    AFTER DELETE ON Users
    FOR EACH ROW
BEGIN
    DELETE FROM Followings
    WHERE Followings.use_id = OLD.use_id;
DELETE FROM Historic
    WHERE Historic.use_id = OLD.use_id;
END $$
DELIMITER ;
