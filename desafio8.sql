DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.user
FOR EACH ROW
BEGIN
 DELETE FROM SpotifyClone.historys WHERE id_user = old.user_id;
 DELETE FROM SpotifyClone.followers WHERE user_id = old.user_id;
END $$

DELIMITER ;