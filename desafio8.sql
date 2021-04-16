USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.seguindo_artistas WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.historicos
WHERE
    usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
