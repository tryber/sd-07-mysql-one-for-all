DELIMITER $$
  CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
  BEGIN
    DELETE FROM SpotifyClone.history
    WHERE user_id = OLD.id;
    DELETE FROM SpotifyClone.follow
    WHERE user_id = OLD.id;
  END;
$$ DELIMITER ;
