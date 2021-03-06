DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.usario_artistas WHERE usuario_idusuario = OLD.idusuario;
DELETE FROM SpotifyClone.usuario_musicas WHERE usuario_idusuario = OLD.idusuario;
END; $$
DELIMITER ;
