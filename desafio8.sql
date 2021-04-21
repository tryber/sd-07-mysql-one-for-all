DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
before DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
	DELETE FROM SpotifyClone.`history` WHERE user_id = old.user_id;
	DELETE FROM SpotifyClone.artists_followed WHERE user_id = old.user_id;
END
$$
DELIMITER ;
