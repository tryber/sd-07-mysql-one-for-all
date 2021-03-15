DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.usuario
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.historico
  WHERE historico.usuarios_id = OLD.id;
  DELETE FROM SpotifyClone.seguindo
  WHERE historico.usuarios_id = OLD.id;
  
END$$    

DELIMITER ;
