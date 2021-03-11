
USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON user
  FOR EACH ROW
  BEGIN
    DELETE FROM history
      WHERE userID = OLD.userID;
    DELETE FROM user_artist
      WHERE userID = OlD.userID;

END $$

DELIMITER ;
