DELIMITER $$

CREATE TRIGGER `trigger_usuario_delete`
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.seguidores WHERE id_usuario = OLD.id_usuario;
DELETE FROM SpotifyClone.historico_reproducao WHERE id_usuario = OLD.id_usuario;
END $$

DELIMITER ;
