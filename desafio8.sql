DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.historico_de_reproducao
  WHERE usuario_id = OLD.usuario_id;
  DELETE FROM SpotifyClone.seguidores
  WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
