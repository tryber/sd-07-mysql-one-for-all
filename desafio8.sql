USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN

END $$
DELIMITER ;
