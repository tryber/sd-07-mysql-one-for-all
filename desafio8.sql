USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.usuario_artista
WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.usuario_cancao
WHERE usuario_id = OLD.usuario_id;
END

DELIMITER $$ ;
