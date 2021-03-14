USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
  AFTER DELETE ON SpotifyClone.users
  FOR EACH ROW
BEGIN
  SET @user_id = OLD.id;
  DELETE FROM SpotifyClone.music_history WHERE user_id = @user_id;
  DELETE FROM SpotifyClone.followers WHERE user_id = @user_id;
END; $$

DELIMITER ;
