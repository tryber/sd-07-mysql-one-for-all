DELIMITER $
CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW 
BEGIN 
DELETE FROM SpotifyClone.seguidores 
WHERE OLD.usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.historico 
WHERE OLD.usuario_id = OLD.usuario_id;
END
$
