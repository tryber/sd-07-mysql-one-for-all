DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.Users
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.Followings
    WHERE OLD.use_id = Followings.use_id;
DELETE FROM SpotifyClone.Historic
    WHERE OLD.use_id = Historic.use_id;
END $$
DELIMITER;
