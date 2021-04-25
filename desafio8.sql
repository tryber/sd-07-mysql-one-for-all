USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM followers WHERE OLD.user_id = user_id;
DELETE FROM reproduction_history WHERE OLD.user_id = user_id;
END $$

DELIMITER ;
