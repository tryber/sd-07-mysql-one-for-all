USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON users
FOR EACH ROW
BEGIN
DELETE FROM historico
WHERE usuario_id = OLD.usuario_id;
DELETE FROM seguindo
WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
