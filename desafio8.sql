DELIMITER $$

CREATE TRIGGER trigger_usuario_delete

BEFORE DELETE ON usuario
FOR EACH ROW

BEGIN

DELETE FROM SpotifyClone.seguindo
WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.historico
WHERE usuario_id = OLD.usuario_id;

END;

$$ DELIMITER ;
