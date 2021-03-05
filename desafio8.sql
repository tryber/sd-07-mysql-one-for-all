USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.historicos
    WHERE OLD.usuario_id = usuario_id;
    DELETE FROM SpotifyClone.historicos
    WHERE OLD.usuario_id = usuario_id;
END $$

DELIMITER ;
