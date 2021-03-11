DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.artistas WHERE SpotifyClone.idusuario = OLD.idusuario;
DELETE FROM SpotifyClone.musicas WHERE SpotifyClone.idusuario = OLD.idusuario;
END; $$
DELIMITER ;
