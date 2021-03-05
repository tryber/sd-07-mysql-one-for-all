DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.follow WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.reproductions WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
