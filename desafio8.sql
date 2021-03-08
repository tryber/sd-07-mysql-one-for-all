delimiter $$
CREATE TRIGGER `trigger_usuario_delete`
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico AS H WHERE H.usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.seguidores AS S WHERE S.usuario_id = OLD.usuario_id;
END $$
delimiter ;
